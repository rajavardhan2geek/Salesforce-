public class ShipmentsController {
    
    public static List<Campsite_Reservation__c> GetCampsiteReservations()
    {
       
  		 String[] fields = new String[]{'End_Date__c','Start_Date__c','User__c','Campsite__c'};
          Map<String,Schema.SObjectField> fielddesctok = Schema.SObjectType.Campsite_Reservation__c.fields.getMap();
          for(String field : fields)
          {
              if(fielddesctok.get(field).getDescribe().isAccessible())
              {
                  System.debug('Key set is '+fielddesctok.keySet()+ 'values are '+fielddesctok.values());
              }
              
          }
      
        return [SELECT Id, Campsite__c
                       
                FROM Campsite_Reservation__c];

}
}