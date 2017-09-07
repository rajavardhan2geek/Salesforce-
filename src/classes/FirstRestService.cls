@RestResource(urlMapping='/FirstRestService/*')
global with sharing  class FirstRestService {

    @HttpGet
    global static List<Book__c>  doGet()
    {
        
       
        List<Book__c> acclist =[select Id,Name from Book__c];
        return  acclist;
    }
      @HttpPost
    global static String  doPost(String gname)
    {
        RestRequest req = RestContext.request;
        String name =req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
    
        RestResponse resp= RestContext.response;
    	 	searchBooks(req,resp);    
        return  'hello';
    } 
    
    private static void searchBooks(RestRequest req,RestResponse resp)
    {
        
    }
    private static void findbookbyname(String name)
    {
        
    }
  
}