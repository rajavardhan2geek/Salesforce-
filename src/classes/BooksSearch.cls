public with sharing class BooksSearch {
	
    private String bookinsertId;
	ApexPages.StandardController controller;
    public String userselect{get;set;}
    public String booktype{get;set;}
    public BookEntries__c bookentry;
    public List<SelectOption> userlist
    {
        get{
            userlist = new list<SelectOption>();
            for(User user:[SELECT Id, Name FROM User where ProfileId  in (select Id from profile where name='Students')])
       		 {
            userlist.add(new SelectOption(user.Id,user.Name));
       		 }
        	
        	return userlist;
        }
        set;
    }
    public List<SelectOption> bookstobeselected
    {
        get{
         	 bookstobeselected= new list<SelectOption>();
        	for(Book__c book:[SELECT Id, Name FROM Book__c where 	Total_Copies__c > 0])
       		 {
            bookstobeselected.add(new SelectOption(book.Id,book.Name));
       		 }
        	return bookstobeselected;
    	 }
        set;
    } 
    public BooksSearch(ApexPages.StandardController controller)
    {
       bookentry= (BookEntries__c) controller.getRecord();
       
    }
	public PageReference saverecord()
	{
        try
        {
          bookentry.Book__c =booktype;
          bookentry.User__c =userselect;
          
           Database.SaveResult saveres =  Database.insert(bookentry);
            if(saveres.isSuccess())
                bookinsertId = saveres.getId();
           
        }
        catch(Exception ex)
        {
        	ApexPages.addMessages(ex);
        
        }
        
         
        if(bookinsertId != null )
		return  new PageReference('/'+bookinsertId);
        else
            return  ApexPages.currentPage();
  	}
}