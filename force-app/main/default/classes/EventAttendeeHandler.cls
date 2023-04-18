public  class EventAttendeeHandler {
    public static void sendConfirmationEmail (List<Event_Attendee__c> newRecordList){
        Set<Id> attendeesIdsSet = new Set<Id>();
        Set<Id> eventIdsSet = new Set<Id>();
        for(Event_Attendee__c EventAttendee : newRecordList){
            attendeesIdsSet.add(EventAttendee.Attendee__c);
            eventIdsSet.add(EventAttendee.Event__c);
        }
        Map<Id,Attendee__c> attendeeMap = new Map<Id,Attendee__c>( [Select Id, Name, Email__c From Attendee__c WHERE Id IN : attendeesIdsSet]);
        Map<Id, Event_Details__c > eventMap = new Map<Id, Event_Details__c > ( [Select Id, Name,Name_of_Event__c, Start_Date_Time__c,Event_Organizer__c , Event_Organizer__r.Name, Location_of_event__r.Name FROM Event_Details__c WHERE ID IN: eventIdsSet]);
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        for(Event_Attendee__c eventAttendee:newRecordList){
            Attendee__c Attendee = attendeeMap.get(EventAttendee.Attendee__c);
            Event_Details__c evt = eventMap.get(EventAttendee.Event__c);  
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setSubject('Pass for the '+evt.Name_of_Event__c);
            List<String> toAddress = new List<String>();
            toAddress.add(Attendee.Email__c);
            mail.setToAddresses( toAddress );
            mail.setSenderDisplayName(evt.Event_Organizer__r.Name);
            String emailBody = 'Dear '+ Attendee.Name + ',<br/><br/>'+ 'Thank you for registering for'+evt.Name+' which will be Organized on '+evt.Start_Date_Time__c+' & will be held in '+evt.Location_of_event__r.Name+'.<br/>Weare excited to have you,'+ 'see you in the event. <br/>'+'Thanks,<br/>'+evt.Event_Organizer__r.Name;
            mail.setHtmlBody(emailBody);
            emailList.add(mail);
        }
        List<Messaging.SendEmailResult> results=Messaging.sendEmail(emailList,false);
        for(Messaging.SendEmailResult email:results){
            System.debug(email.isSuccess());
        }
    }
}