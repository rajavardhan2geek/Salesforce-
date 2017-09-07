global class CleanupScheduable implements Schedulable{
    
    global void execute(SchedulableContext ctx)
    {
        String crontime='0 0 9 * 6?';
        String cronID =System.scheduleBatch(new CleanUpReturnedBooks(), 'CleanupReturnedBooks', 1);
        CronTrigger ct = [select Id,TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :cronID];
        System.debug(' Next fire time of  cleanupbatch'+ ct.NextFireTime +'no of times triggered '+ct.TimesTriggered);
    }

}