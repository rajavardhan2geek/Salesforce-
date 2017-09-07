public with sharing  class HttpReqResController {
	
    private Integration_Configuration__c icc{get;set;}
    public String resp{get;set;}
    public List<String> response{get;set;}
    public String consumerkey{get;set;}
    public String consumersecret{get;set;}
    public String selectmethod{get;set;}
    public String Authorizatiotype{get;set;}
    public List<SelectOption> method
    {   get{
        List<SelectOption> options = new List<SelectOption>();
            options.add( new SelectOption('GET', 'GET', false));
             options.add( new SelectOption('PUT', 'PUT', false));
             options.add( new SelectOption('DELETE', 'DELETE', false));
        	options.add( new SelectOption('POST', 'POST', false));
        	return options;
    }
        set;
     }
     public String url{get;set;}
    public List<SelectOption> Authorizationheader
    {
     get{ List<SelectOption> options = new List<SelectOption>();
            options.add( new SelectOption('BASIC', 'BASIC', false));
             options.add( new SelectOption('NoAuth', 'NoAuth', false));
             options.add( new SelectOption('OAuth', 'OAuth', false));
      
        	return options;
        }
     set;}
    public HttpReqResController(ApexPages.StandardController stdctrl)
    {
        icc= new Integration_Configuration__c();
        
    }
    public PageReference cancel()
    {
       
        PageReference page = new PageReference('https://www.google.com') ;
          return page;
    }
    public void authorizeurl()
    {
        if(selectmethod=='GET')
        { ReqRespProcessor obj = new ReqRespProcessor(url,selectmethod,null,null);
         	
        	response=obj.sendResponse(); 
        }
        else
        {
               ReqRespProcessor obj = new ReqRespProcessor(url,selectmethod,consumerkey,consumersecret);
            	resp=obj.getaccesstoken();
       		 System.debug(obj.getaccesstoken());
        }
    }
}