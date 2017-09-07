public with sharing class ExpensesController {
    // STERN LECTURE ABOUT WHAT'S MISSING HERE COMING SOON
    @AuraEnabled
    public static List<Shipments__c> getExpenses() {
        // Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[] {
        'Id', 'Name', 'Amount__c', 'Client__c', 'Date__c', 
        'Reimbursed__c', 'CreatedDate'
    };
    
    Map<String,Schema.SObjectField> fieldDescribeTokens = 
        Schema.SObjectType.Shipments__c.fields.getMap();
    
    for(String field : fieldsToCheck) {
        if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
            throw new System.NoAccessException();
            return null;
        }
    }
        return [SELECT Id, Name
                       
                FROM Shipments__c];
    }
    
    
}