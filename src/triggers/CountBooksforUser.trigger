trigger CountBooksforUser on BookEntries__c (before insert) {

    if(Trigger.isInsert){
      If(Trigger.isBefore)
      {
          try{
                List<BookEntries__c> bookscanbeinserted =new List<BookEntries__c>();
                Map<Id,AggregateResult> book_users = new Map<id,AggregateResult>([SELECT User__r.id ,count(Book__r.Id) totalbooks   FROM BookEntries__c where isReturned__c = false group by User__r.id ]);
            
              for(BookEntries__c bookentry : Trigger.New)
               {
                     
                    if(book_users.containsKey(bookentry.User__c))
                        {
                            Integer no_of_books_assg_user =(Integer)book_users.get(bookentry.User__c).get('totalbooks'); 
                            String name  = (String) book_users.get(bookentry.User__c).get('id');
                
                            if(no_of_books_assg_user >=3)
                            { bookentry.addError('Admin  cant add because this user already has '+no_of_books_assg_user);
                              
                             System.debug('book user'+book_users.get(bookentry.User__c).get('Id')+'totaal books '+no_of_books_assg_user);
                               System.debug((book_users.get(bookentry.User__c)));}
                            else{
                                 bookscanbeinserted.add(bookentry);
                                System.debug('inserted '+bookentry.User__c);
                            }
                            
                        }
                   else
                   {
                       bookscanbeinserted.add(bookentry);
                   }
                   
               }
            Database.upsert(bookscanbeinserted,true);
            
          }
          catch(Exception e)
          {
              System.debug('Exception e'+e);
          }
         
      }
    }
}