public with sharing class sample {
    
       public String temp {get; set;}
    public List<Book__c> booklist {get; set;}
 	public List<SelectOption> selectoptions ;
        public List<SelectOption> getselectoptions()
    {
        selectoptions= new list<SelectOption>();
        for(RecordType rectype:[SELECT Id, Name FROM RecordType WHERE sObjectType = 'Book__c'])
        {
            selectoptions.add(new SelectOption(rectype.Id,rectype.Name));
        }
        System.debug(selectoptions);
        return selectoptions;
    }
    public void find()
    {
         booklist = new List<Book__c>();
        booklist=[SELECT Author__c,BookType__c,Book_Title__c,Category__c,Id,Issued_Copies__c,Name,No_Of_avail_Copies__c,RecordTypeId,Total_Copies__c FROM Book__c where RecordTypeId=:temp ];
        
    }
}