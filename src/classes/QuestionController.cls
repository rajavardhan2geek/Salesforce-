public with sharing class QuestionController {
    
    @AuraEnabled
    public static List<FormFields__c> getQuestionFields()

    	{
        
            
            return [select FieldName__c,FieldType__c from FormFields__c  order by FieldType__c  asc];
   		}
    
     @AuraEnabled
    public static Boolean  setResponseFields(String ques,String resp)

    	{
            try{
		         //   response__c respobj= new response__c(Name=ques,Answer__c=resp);
					//Database.SaveResult saveres =  Database.insert(respobj,false);
            	//	if(saveres.isSuccess())
                			return false;
            	//	else
                	//		return false;
            	}
            catch(Exception e){
                System.debug('Exception due to '+e.getMessage());
                return null;
            }
   		}
     @AuraEnabled
    public static String setFormRespObj(String   formresponse)

    	{
            try{
                String h='';
           		List<FormResponse__c> fr =(List<FormResponse__c>)JSON.deserialize(formresponse, List<FormResponse__c>.class);
             
         		
					Database.SaveResult[] saveres =  Database.insert(fr,false);
            			for(Database.SaveResult sr :saveres)
                        {
                            if(sr.isSuccess())
                                h+= sr.getId()+'  saved  id ';
                            
                        }
                return h ;
            }
            catch(Exception e){
              
                return 'Exception due to '+e.getMessage();
            }
   		}
}