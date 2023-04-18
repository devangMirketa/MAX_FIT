@isTest
private class EventWebServicesTest {
    
    @isTest static void testGetEventById() {
        Id recordId=createTestRecord();
        RestRequest request = new RestRequest();
        request.requestUri ='https://yourInstance.my.salesforce.com/services/apexrest/Event_Details__c/'+ recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        Event_Details__c thisEvent = EventWebServices.EventServices();
        System.assert(thisEvent != null);
        System.assertEquals('Test record', thisEvent.Name_of_Event__c);
    }
    static Id createTestRecord() {
        // Create test record
        Event_Details__c EventTest = new Event_Details__c(
            Name_of_Event__c='Test record', 
            Start_Date_Time__c=Date.newInstance(2021, 10, 21),
            Max_Seats__c=100);
            //Event_Organizer__r.Name ='Anurag',
            //Event_Organizer__r.Email__c='xyz@gmail.com');
        insert EventTest;
        return EventTest.Id;
    }          
}