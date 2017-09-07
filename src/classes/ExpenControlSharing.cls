public class ExpenControlSharing extends virtualclassdemo{
    
    public override  void GetExpenseRecords()
    {
        
        Account acc = new Account(name ='ABC');
		insert acc;
        String acd = acc.name;
		System.debug('acd'+acd);
	}
    

}