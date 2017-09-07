global with sharing  class IntegrationAppClient   {
    
    public static final String HEADER_CONTENT_TYPE = 'Content-Type';
    public static final String HEADER_APPLICATION_ENCODED = 'application/x-www-form-urlencoded';
    private static String endpointurl='https://app.box.com';
    private static String consumerreq='gkgfy3s1kploh4w45owu3nbvcbtr13wn';
    private static String  consumersec='fBkeVV0tBbn0rpF9Nma0Pl3YB7QZyJH6';
    public IntegrationAppClient()
    {
        
    }
    public void getBoxConnection(String authCode)
    {
      
       String url='https://api.box.com/oauth2/token';
     
        Http http = new Http();
        HttpRequest httpreq = new HttpRequest();
         String redirect_uri ='https://'+System.Url.getSalesforceBaseUrl().getHost();
        httpreq.setMethod('POST');
        httpreq.setHeader('Content-Type','application/x-www-form-urlencoded');
   		httpreq.setEndpoint(url);
           String urlParameters = String.format('grant_type=authorization_code&code={0}&client_id={1}&client_secret={2}', 
            new String[] {authCode,consumerreq ,consumersec});
        httpreq.setBody(urlParameters);
//       httpreq.setHeader('Content-Length', httpreq);
       // httpreq.setTimeout(2000);
        HttpResponse httpresp = http.send(httpreq);
        System.debug('response'+ httpresp.getBody());
    }
   
  
}