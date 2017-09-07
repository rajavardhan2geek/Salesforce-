public class Loginclass {

    public String username
    {get{return username;}
     set;}
    public String password{get;set;}
   	
    public Pagereference login()
    {
        
        
        
        
        PageReference page = new PageReference('/SearchBooks');
        return page;
    }
   
     public Pagereference register()
    {
        return null;
    }
    
  
      public Pagereference cancel()
    {
        return null;
    }
     
}