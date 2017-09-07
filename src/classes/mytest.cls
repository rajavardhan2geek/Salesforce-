public class mytest {

    
    public String mystring{get{ return 'string';}set;}
    public String getStringmethod()
    {
        return mystring;
    }
    
     public String getStringmethod2()
    {
        
        if(mystring==null)
        {mystring= 'Stringmethod2';
         return mystring;}
        else
            return null;
       
    }
}