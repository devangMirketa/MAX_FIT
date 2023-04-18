trigger EmailEventAttendeeTrigger on Event_Attendee__c (after insert) {
    EventAttendeeHandler.sendConfirmationEmail(trigger.new);
}