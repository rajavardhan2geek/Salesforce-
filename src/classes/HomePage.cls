public class HomePage {
    private String username;
    private String password;
    private List<Student__c> Students{get;set;}

   public HomePage()
   {
       
       Cookie counter =  ApexPages.currentPage().getCookies().get('counter');
       if(counter==null)
       {
           counter = new Cookie('counter','1',null,-1,false);
       }
       else
       {
          Integer count = Integer.valueOf(counter.getValue());
          counter = new Cookie('counter',String.valueOf(count+1),null,-1,false);
       }
        ApexPages.currentPage().setCookies(new Cookie[]{counter});
   }
    public String getcounter()
    {
        Cookie counter = ApexPages.currentPage().getCookies().get('counter');
        if(counter==null)
            return '0';
        else
            return counter.getValue();
    }
    
    public void setusername(String u )
    {
        this.username = u;
       
    }
     public void setpassword(String p )
    {
        this.password = p;
       
    }
   public String getusername()
   {
       return username;
   }
    public String getpassword()
   {
       
       System.debug('password'+password);
       return password;
   }
   public PageReference Login()
   {
        System.debug('password'+password);
       PageReference page = new PageReference('/apex/SearchBooks');
       page.setRedirect(true);
       System.debug(page.getContent());
        
       return page;
   }
    public PageReference Register()
   {
       PageReference page = new PageReference('/a0C/o');
       
       return page;
   }
    
    
}