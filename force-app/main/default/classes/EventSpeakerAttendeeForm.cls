public class EventSpeakerAttendeeForm {
    public Event_Details__c event{get; set;}
    public List<Event_Speaker__c> event_Speaker{get; set;}
    public EventSpeakerAttendeeForm() {
        Id eventID = ApexPages.currentPage().getParameters().get('id');
        if(eventID != null){
            event=[Select Name_of_Event__c, Event_Organizer__r.Name, Location_of_Event__c,Location_of_Event__r.City__c,Location_of_Event__r.Postal_Code__c,Location_of_Event__r.Country__c, Start_Date_Time__c From Event_Details__c Where Id = :eventID];
            event_speaker = [Select Event_Details__c, Speaker__c,Speaker__r.Name, Speaker__r.Profile_URL__c, Speaker__r.About_Me__c From Event_Speaker__c Where Event_Details__c = :eventID];
        }
    }
    
}