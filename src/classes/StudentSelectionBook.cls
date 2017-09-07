public with sharing class StudentSelectionBook {
   
    
    public StudentSelectionBook(ApexPages.StandardController controller)
    {
         this.Ident= UserInfo.getUserId();
        System.debug('user if'+Ident);
    }
    public String booktypeid{get;set;}
    public List<SelectOption> Books{get;set;}
    private User user{get;set;}
    private String Ident;
    public List<BookEntries__c> bookentries{
        get{
        try{
        
        bookentries =(List<BookEntries__c>) [select Id,Book__r.Name,Issue_Date__c,Return_Date__c,User__r.Name ,ExtensionRequired__c,Extend_return_date__c from BookEntries__c where User__r.Id=:Ident and isReturned__c=false];
        System.debug('Success full y read'+bookentries);
        }
        catch(DmlException e){System.debug(' DML EXCEPTION E'+e);}
        return bookentries;}
         set;
      }
   
       
    public String bookid{get;set;}
     
   public PageReference goto()
    {
        System.debug(' id'+ApexPages.currentPage().getparameters().get('Id'));
        String identi = ApexPages.currentPage().getParameters().get('bookid');
        PageReference page = new PageReference('/'+identi);
        
        
        
       	return page;
    }
}