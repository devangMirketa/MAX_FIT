public class EventSpeakerForm {
    public Speaker__c speaker{get; set;}
    public Event_Speaker__c eventSpeaker{get; set;}

    public EventSpeakerForm() {
        speaker= new Speaker__c();
        eventSpeaker=new Event_Speaker__c();
        Id eventId=Apexpages.currentPage().getParameters().get('id');
        if(eventId != null){
            eventSpeaker.Event_Details__c=eventId;
        }
    }
    public void addSpeaker(){
        try{
            insert speaker;
            eventSpeaker.Speaker__c=speaker.Id;
            insert eventSpeaker;
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.CONFIRM,'Record Inserted'));
        }
        catch(Exception e){
            System.debug(e.getMessage());
            ApexPages.addMessage(new ApexPages.Message(ApexPages.severity.FATAL,'Record Not Inserted'));
        }
    }
}