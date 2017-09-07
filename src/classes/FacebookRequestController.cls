public class FacebookRequestController {

    String consumerkey='832057220167733';
    String consumersecret='666854ad755207ac908baa5b7e2e28ea';
   
    public String access_token;
    public PageReference authenticate()
    {
         String authenticateuri='https://www.facebook.com/dialog/oauth?client_id=1104890289641532&display=popup&response_type=token&redirect_uri=https://rajavardhan-cloud-dev-ed--c.ap5.visual.force.com/apex/FacebookPageController';
      	return  new PageReference(authenticateuri);
        
        
	}
    public void setaccesstoken()
    {
        access_token = ApexPages.currentPage().getParameters().get('access_token');
        System.debug(''+access_token);
    }
}