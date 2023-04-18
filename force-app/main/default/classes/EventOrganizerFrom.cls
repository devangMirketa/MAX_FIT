public class EventOrganizerFrom {
    
    public Event_Organizer__c eorganizer{get; set;}
    public Event_Details__c event{get; set;}
    public Location_Address_Book__c location{get; set;}

    public EventOrganizerFrom(){
        eorganizer= new Event_Organizer__c();
        event= new Event_Details__c(); 
        location= new Location_Address_Book__c();
        
    }
    public void addEventOrganizer(){
        try{
            insert location;
            eorganizer.Location_Address_Book__c=location.Id;
            insert eorganizer;  
            event.Event_Organizer__c=eorganizer.Id;
            if(event.Event_Type__c!='Virtual'){
                event.Location_of_Event__c=location.Id;}
            insert event;
            
        }
        catch(Exception e){
            System.debug(e.getMessage());
        }
    }
}