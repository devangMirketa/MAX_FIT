trigger DuplicateTriggerHandler on Event_Speaker__c (before insert) {
    List<Event_Speaker__c> existingBookings=[select Id,Speaker__c, Event_Details__r.End_Date_Time__c,Event_Details__r.Start_Date_Time__c from Event_Speaker__c];
    for(Event_Speaker__c es:Trigger.new){
        Datetime newbooking= es.Event_Details__r.Start_Date_Time__c;
        for(Event_Speaker__c booking:existingBookings){
            if(booking.Speaker__c==es.Speaker__c) {
                if((booking.Event_Details__r.Start_Date_Time__c <= newbooking)){// && (booking.Event_Details__r.End_Date_Time__c >= newbooking)){
                    es.addError('Speaker already has a booking for a event');
                }
            }
        }
        existingBookings.add(es); 
    }   
}