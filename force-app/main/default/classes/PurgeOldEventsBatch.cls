public class PurgeOldEventsBatch implements Database.Batchable<sObject> {
    public Database.QueryLocator start(Database.BatchableContext BC){
        String query='Select Id From Event_Details__c where End_Date_Time__c < LAST_N_MONTHS:2 AND Live__c = True';
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext BC, List<Event_Details__c> scope){
        delete scope;
    }
    public void finish(Database.BatchableContext BC){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[]{'devang.tiwari@Mirketa.com'});
        mail.setSubject('Batch job complete');
        mail.setPlainTextBody('Execution of the batch has been processed.');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
}