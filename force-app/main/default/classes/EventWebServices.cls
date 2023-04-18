@RestResource(urlMapping='/Event_Details__c/*')
global with sharing class EventWebServices {

    @HttpGet
    global static Event_Details__c EventServices(){
        RestRequest request=RestContext.request;
        String eventId=request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Event_Details__c result=[Select Name_of_Event__c,Start_Date_Time__c,Max_Seats__c,Event_Organizer__r.Name,Event_Organizer__r.Email__c from Event_Details__c where Id=:eventId];
        return result;
    }
}