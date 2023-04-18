public class RejectDuplicateHandler {
    public static void Reject_Duplicate_Booking(Set<Event_Speaker__c> newRecords){
        Set<Id> speakerIds=new Set<Id>();
        for(Event_Speaker__c es:newRecords){
            speakerIds.add(es.Speaker__c);
        }
        List<Event_Speaker__c> existingAssignments=[select Id,Speaker__c from Event_Speaker__c where Speaker__c IN:speakerIds];
        Map<Id, Event_Speaker__c> speakerToEventMap = new Map<Id, Event_Speaker__c>();
        for(Event_Speaker__c existing : existingAssignments) {
            speakerToEventMap.put(existing.Speaker__c, existing);
        }
        for(Event_Speaker__c es:NewRecords){
            if(speakerToEventMap.containsKey(es.Speaker__c)) {
                Event_Speaker__c existing = speakerToEventMap.get(es.Speaker__c);
                if(existing.Id != es.Id) {
                    es.addError('Speaker ' + es.Speaker__r.Name + ' is already assigned to another event');
                }
            }
        }
    }
}