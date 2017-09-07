global class cAuthenticationURIBuilder {
   global String AuthenticationURI='';
 global cAuthenticationURIBuilder(String clientkey,String redirect_url)
  {
      String key = EncodingUtil.urlEncode(clientkey,'UTF-8');
       String url = EncodingUtil.urlEncode(redirect_url,'UTF-8');
       
      String authuri='https://account.box.com/api/oauth2/authorize?response_type=code&client_id='+key+'&redirect_uri='+url+'&state=security_token%3DKnhMJatFipTAnM0nHlZA';
 		AuthenticationURI =authuri;
  }
}