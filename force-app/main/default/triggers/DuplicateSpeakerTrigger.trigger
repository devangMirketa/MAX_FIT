trigger DuplicateSpeakerTrigger on Event_Speaker__c (before insert,before update) {
    List<Id> speakerIds=new List<Id>();
    Map<Id,Datetime> requested_booking=new Map<Id,Datetime>();
    for(Event_Speaker__c esc:Trigger.new){
        requested_booking.put(esc.Event_Details__c, null);
        speakerIds.add(esc.Speaker__c);
    }
    List<Event_Details__c> relatedEvents=[Select Id,Start_Date_Time__c,End_Date_Time__c from 
                                        Event_Details__c where Id in:requested_booking.keySet()];
    for(Event_Details__c related_Event:relatedEvents){
        requested_booking.put(related_Event.Id, related_Event.Start_Date_Time__c);
    }
    List<Event_Speaker__c> realted_Speaker=[Select Id,Speaker__c,Event_Details__c,Event_Details__r.Start_Date_Time__c,
                                            Event_Details__r.End_Date_Time__c from Event_Speaker__c where Speaker__c IN: speakerIds];
    for(Event_Speaker__c esc:trigger.new){
        Datetime bookingtime=requested_booking.get(esc.Event_Details__c);
        for(Event_Speaker__c speaker:realted_Speaker){
            if(speaker.Speaker__c==esc.Speaker__c && speaker.Event_Details__r.Start_Date_Time__c<=bookingtime && speaker.Event_Details__r.End_Date_Time__c>=bookingtime){
                esc.addError('Speaker has been already booked');
            }
        }
    }
}