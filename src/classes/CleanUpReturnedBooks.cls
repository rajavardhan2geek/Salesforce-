global  class CleanUpReturnedBooks implements Database.Batchable<sObject> {
    
   
    global Database.QueryLocator start(Database.BatchableContext job)
    {
        
        String query = 'SELECT Book__r.Id,Book__r.Name ,Issue_Date__c,Return_Date__c,Name FROM BookEntries__c WHERE isReturned__c = true AND IsDeleted = false';
        return Database.getQueryLocator(query);   
    }
    global void execute(Database.BatchableContext job,List<BookEntries__c> bookentries)
    {
        
            Returned_Books__c returnedbooks;
            List<Returned_Books__c> retbooklist = new List<Returned_Books__c>();
            System.debug(bookentries);
            for(BookEntries__c bookentry :  bookentries)
            {
                 returnedbooks = new Returned_Books__c();
                returnedbooks.Name  =bookentry.Book__r.Name;
                returnedbooks.Book__c = bookentry.Book__c;
                returnedbooks.IssuedDate__c =bookentry.Issue_Date__c;
                 returnedbooks.ReturnDate__c =bookentry.Return_Date__c;
                retbooklist.add(returnedbooks);
            }
        Database.SaveResult[]  listsucess= Database.insert(retbooklist,false);
        for( Database.SaveResult sli: listsucess)
        {
            
                
                    
                    System.debug(LoggingLevel.DEBUG,'sucessfully inserted');
                    Database.delete(bookentries);
                    System.debug(LoggingLevel.DEBUG,'successfully deleted');
                
              
        }
    }
   
    global void finish(Database.BatchableContext job)
    {
        
        AsyncApexJob processedjobid = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email
                                         FROM AsyncApexJob WHERE Id = :job.getJobId()];


        System.debug('finished batch ');
        String address ='rajavardhan1290@gmail.com';
        String subject ='Moved Returned Books to another Object';
        String body ='Moved Returned Books to another Object'+processedjobid.TotalJobItems+'number of errors '+processedjobid.NumberOfErrors ;
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        String[] toaddress=new string[]{address};    
        mail.setToAddresses(toaddress);
        mail.setSubject(subject);
        mail.setHtmlBody(body);
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail} );
        
    }
    
    
}