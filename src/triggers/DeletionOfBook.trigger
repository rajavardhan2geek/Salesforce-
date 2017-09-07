trigger DeletionOfBook on Book__c (before delete) {
     for(Book__c  book :Trigger.Old)
    {
        if(book.Issued_Copies__c > 0)
        {
            	
                book.addError('Admin cannot delete this '+book.Book_Title__c+' '+ book.Issued_Copies__c  +' copies issued to student.please inform students to return book');
        }
        
    }
}