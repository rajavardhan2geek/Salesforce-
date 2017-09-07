public with sharing class ExpenseController {
    

    @AuraEnabled
	public static Expense__c  saveexpense(String newexpe)
    {
        
            Expense__c NewExpenses =(Expense__c) JSON.deserialize(newexpe,  Expense__c.class);
            System.debug('inside expobj');
           upsert NewExpenses;
            System.debug('inside expobj0');
        	return NewExpenses;
    }
    @AuraEnabled
    public static List<Expense__c> getExpenses()
    {
        
        String[] fieldstoChk = new String[]{'Amount__c','Client__c','Date__c','Reimbursed__c','Name'};
        Map<String,schema.SObjectField> fieldDescribeTokens = Schema.SObjectType.Expense__c.fields.getMap();
        for(String field : fieldstoChk)
        {
            if(!fieldDescribeTokens.get(field).getDescribe().isAccessible())
            {   throw new System.NoAccessException();
            	return null;
            }
            
        }
       
            return [select Id,Name,Amount__c,Client__c,Date__c,Reimbursed__c ,CreatedDate from Expense__c];
       
       
        
	}
    
    
}