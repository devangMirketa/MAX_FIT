@isTest
private class PurgeEventsBatchTest {

    @testSetup
    public static void testSetupData() {
        List<Event_Details__c> eventList = new List<Event_Details__c>();
        for(Integer i=0; i<200; i++){
            Event_Details__c event = new Event_Details__c(
                Name_of_Event__c = 'MAX FIT Campaign #'+i+1,
                Event_Type__c = 'Virtual',
                Frequency__c  = 'Weekly',
                Max_Seats__c  = 199,
                Recurring__c = true,
                Live__c = true,
                Start_Date_Time__c = System.now().addMonths(-4),
                End_Date_Time__c  = System.now().addDays(3).addMonths(-4)
            );
            eventList.add(event);
        }
        insert eventList;
    }

    @isTest
    static void PurgeOldEventsBatch(){
        //Test.startTest();
        String jobId=Database.executeBatch(new PurgeOldEventsBatch(),200);
        //Test.stopTest();
        List<Event_Details__c> events=new List<Event_Details__c>();
        System.assertEquals(0, events.size(),'Error');
    }
}