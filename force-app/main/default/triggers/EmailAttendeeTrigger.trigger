trigger EmailAttendeeTrigger on Attendee__c (before insert) {
    List<Messaging.Email> emailList=new List<Messaging.Email>();
    for(Attendee__c a:trigger.new){
        Messaging.SingleEmailMessage ia=New Messaging.SingleEmailMessage();
        ia.setToAddresses(new string[] {a.Email__c});
        ia.setSubject('Attendee Inserted');
        String body='Dear user,your attendee is inserted';
        ia.setHtmlBody(body);
        emailList.add(ia);
    }
    Messaging.sendEmail(emailList);
}