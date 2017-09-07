public with sharing  class ViewByCategory {
	
    public String categoriestypes {get;     set;}
    private List<SelectOption> selectoptions{get;set;}
    public List<Book__c> booklist{get{
   
    return booklist;
    
    }set;}
    
 	public ViewByCategory(ApexPages.StandardController controller)
    {
      
    }
    
    public List<SelectOption> getselectoptions()
    {
        selectoptions= new list<SelectOption>();
        for(RecordType rectype:[SELECT Id, Name FROM RecordType WHERE sObjectType = 'Book__c'])
        {
            selectoptions.add(new SelectOption(rectype.Id,rectype.Name));
        }
        return selectoptions;
    }
  
    
    public void processselected()
    {
        
		Id categoryid =  Schema.SObjectType.Book__c.getRecordTypeInfosByName().get('Technology').getRecordTypeId();        
       
        booklist=[SELECT Author__c,BookType__c,Book_Title__c,Category__c,Id,Issued_Copies__c,Name,No_Of_avail_Copies__c,RecordTypeId,Total_Copies__c FROM Book__c where RecordTypeId=:categoriestypes ];
       
    }
    
  
 
   
   
    
}