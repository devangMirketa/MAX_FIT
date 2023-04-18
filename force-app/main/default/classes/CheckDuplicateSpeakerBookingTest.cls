@isTest
private class CheckDuplicateSpeakerBookingTest {
    @isTest
    static void TesteventSpeakerDuplicateTest() {
        Event_Details__c firstEvent = new Event_Details__c();
        firstEvent.Name_of_Event__c = 'Shirley1 Concert1';
        firstEvent.Live__c = true;
        firstEvent.Recurring__c=true;
        firstEvent.Frequency__c='Weekly';
        firstEvent.Start_Date_Time__c = Datetime.now().addDays(3);
        firstEvent.End_Date_Time__c = Datetime.now().addDays(5);
        firstEvent.Event_Type__c = 'Virtual';
        insert firstEvent;

        Event_Details__c secondEvent = new Event_Details__c();
        secondEvent.Name_of_Event__c = 'Disco1 Night1';
        secondEvent.Live__c = true;
        secondEvent.Recurring__c=true;
        secondEvent.Frequency__c='Daily';
        secondEvent.Start_Date_Time__c = Datetime.now().addDays(5);
        secondEvent.End_Date_Time__c = Datetime.now().addDays(7);
        secondEvent.Event_Type__c = 'Virtual';
        insert secondEvent;

        Speaker__c newSpeaker = new Speaker__c();
        newSpeaker.Name = 'Shirley12';
        insert newSpeaker;

        Event_Speaker__c oldEvent = new Event_Speaker__c();
        oldEvent.Event_Details__c = firstEvent.Id;
        oldEvent.Speaker__c = newSpeaker.Id;
        insert oldEvent;

        Event_Speaker__c newEvent = new Event_Speaker__c();
        newEvent.Event_Details__c = secondEvent.Id;
        newEvent.Speaker__c = newSpeaker.Id;
        Test.startTest();
        try {
            insert newEvent;
        } catch (DmlException e) {
            System.assert(e.getMessage().contains('Duplicate booking found'), 'Unexpected error message: ' + e.getMessage());
        }
        Test.stopTest();
     }
}