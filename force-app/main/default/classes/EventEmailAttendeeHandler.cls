public class EventEmailAttendeeHandler {
    public static void sendConfirmationMail(List<Event_Attendee__c> newRecordList) {
        List<Messaging.Email> emailList=new List<Messaging.Email>();
        for(Event_Attendee__c eventAttendees:newRecordList){
            Messaging.SingleEmailMessage mails=New Messaging.SingleEmailMessage();
            mails.setToAddresses(new string[] {eventAttendees.Attendee__r.Email__c});
            mails.setSubject('Pass for the'+ eventAttendees.Event__r.Name_of_Event__c);
            String body='Dear '+eventAttendees.Attendee__r.Name+ ',<br/><br/>'+'Thank you for registering for   '+' '+
            eventAttendees.Event__r.Name_of_Event__c +' which will be Organized on '+eventAttendees.Event__r.Start_Date_Time__c +
            ' & will be held in '+ eventAttendees.Event__r.Location_of_event__r.Country__c +'.<br/>We'+' '+'are excited to have you,'+'see you in the event. <br/>'+
            'Thanks';
            
            mails.setHtmlBody(body);   
            emailList.add(mails);   
        }
        Messaging.sendEmail(emailList);     
    }
}