public class EventAttendeeForm {

    public Attendee__c attendee{get; set;}
    public Event_Attendee__c eventAttendee{get; set;}
    public Location_Address_Book__c location{get; set;}
    public EventAttendeeForm() {
        attendee=new Attendee__c();
        eventAttendee=new Event_Attendee__c();
        location=new Location_Address_Book__c();
        Id eventId=Apexpages.currentPage().getParameters().get('id');
        if(eventId != null){
            eventAttendee.Event__c=eventId;
        }
    }
    public void addEventAttendee(){
        try{
            insert location;
            attendee.Address_of_Event__c=location.Id;
            insert attendee;
            eventAttendee.Attendee__c=attendee.Id;
            insert eventAttendee;
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
}