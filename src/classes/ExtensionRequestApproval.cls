public class ExtensionRequestApproval {
	
      private BookEntries__c bookentry ;
    private List<BookEntries__c>  bookentrylist{get;set;}   
    private Map<String,BookEntries__c> bookmap;
  
    
      
      public ExtensionRequestApproval(StudentSelectionBook controller)
      {
           bookentrylist =controller.getbookentries();
           System.debug('list of book entry ' +bookentrylist);
      }
    
    public void submitforApproval()
    {
        System.debug('list of book entry ' +bookentrylist);
       // update bookentrylist;
       
    }
      
}