trigger DeleteBookEntry on BookEntries__c (before delete) {

    for(BookEntries__c  bookentry :Trigger.Old)
    {
        if(!bookentry.isReturned__c)
        {
            	
                bookentry.addError('Admin Cannot be delete book entry  without user returning book to library');
        }
        
    }
    
}