public class ReqRespProcessor {
	
    public String method;
    private  String url;
    private   String consumerkey;
    private   String consumersecret;
    List<String> response;
    private final static String REQUEST_BODY = 'grant_type=password&client_id={0}&client_secret={1}&username={2}&password={3}';

    public ReqRespProcessor(){}
    public ReqRespProcessor(String url,String method,String consumerkey,String consumersecret)
    {
        this.url= url;
        this.method= method;
        this.consumersecret=consumersecret;
        this.consumerkey=consumerkey;
	}
	public String getaccesstoken()
    {
       try{
        String  USERNAME ='rajavardhan@salesforce.com';
        String PASSWORD='Vardhan@1990';
        HttpRequest req = new HttpRequest();
           System.debug('url'+url);
        req.setEndpoint(url);
        req.setMethod('POST');          
        Blob headerValue = Blob.valueOf(USERNAME + ':' + PASSWORD);
        String authorizationHeader = 'BASIC' +EncodingUtil.base64Encode(headerValue);
        req.setHeader('Authorization', authorizationHeader); 
        req.setBody(String.format(REQUEST_BODY ,new string[]{consumerkey,consumersecret,USERNAME,PASSWORD}));
        req.setTimeout(60000);
        Http http = new Http();
        HttpResponse res = http.send(req);
           System.debug(res.getBody());
       OAuth objAuthenticationInfo = (OAuth)JSON.deserialize(res.getbody(), OAuth.class);
           System.debug(' OAuth'+objAuthenticationInfo);
        return res.getBody();
    }catch(CallOutException ce){
        throw ce;
    }
    return null;
    }
    
/*    public OAuth authenticationDetail{
    get{
        if(authenticationDetail == null){
            authenticationDetail = getAccessToken();
        }
        return authenticationDetail;
    }set;
}*/

/*To get aouthentication detail Wrapper*/
public class OAuth{
    public String id{get;set;}
    public String issued_at{get;set;}
    public String instance_url{get;set;}
    public String signature{get;set;}
    public String access_token{get;set;}    
  } 
    private   List<String> getResponse()
    {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(url);
        req.setMethod(method);
        HttpResponse resp = http.send(req);
        response = new List<String>();
        response.add( resp.getStatus());
        response.add(resp.getBody());
        return response;
    }
    public List<String>  sendResponse()
    {
        //response =getResponse();
         //System.debug('response'+response);
        return getResponse();
    }
}