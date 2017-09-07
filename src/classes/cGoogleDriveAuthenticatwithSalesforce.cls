public with sharing  class cGoogleDriveAuthenticatwithSalesforce {

  
    private String key='gkgfy3s1kploh4w45owu3nbvcbtr13wn';
    private String secret='fBkeVV0tBbn0rpF9Nma0Pl3YB7QZyJH6';
    String redirect_uri ='https://app.box.com';
    String accesstoken='';
    String clientIdent_token='';
    
    
    
    public cGoogleDriveAuthenticatwithSalesforce()
    {	
        
        clientIdent_token=ApexPages.currentPage().getParameters().get('code');
        System.debug(clientIdent_token		);
    }
    public PageReference authenticate()
    {
        System.debug(redirect_uri);
        PageReference page = new PageReference(new cAuthenticationURIBuilder(key,redirect_uri).AuthenticationURI);
        return page;
    }
}