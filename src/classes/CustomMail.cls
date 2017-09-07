public class CustomMail {
   public static void sendMail(String address, String subject, String body)
    {
        Messaging.SingleEmailMessage mail=new Messaging.SingleEmailMessage();
        
        String[] toaddress=new string[]{address};
            
        mail.setToAddresses(toaddress);
        
        mail.setSubject(subject);
        
        mail.setHtmlBody(body);
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail} );
            
      }
       
}