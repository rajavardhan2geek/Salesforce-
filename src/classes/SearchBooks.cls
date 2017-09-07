public  class SearchBooks {

    
    public  Boolean selected{get;set;}
    private List<Book__c> results{get;set;}
     public String userselect{get;set;}
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
    
    private String password {
        get{
            return ApexPages.currentPage().getParameters().get('password');
        }
    }
    private String searchcategory;
    public String  getsearchcategory()
    {
        return searchcategory;
    }
   public void setsearchcategory(String s)
   {
       this.searchcategory =s;
   }
    public List<Book__c> getresults()
    {
      
        return results;
        
	}
    
    
    public PageReference doSearch()
    {
        
          results =(List<Book__c>) [SELECT Author__c,Book_Title__c,Category__r.Name,Name,Total_Copies__c,No_Of_avail_Copies__c,Issued_Copies__c ,BookType__c FROM Book__c where Category__r.Name =:searchcategory];
		 return null;        
    }
    
       public PageReference processselected()
   {
      
      PageReference bookentry = new PageReference('/BooksByCategories');
       return bookentry;
   }
    
    
}