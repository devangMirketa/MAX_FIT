@isTest
public class EventEmailAttendeeTest {
    @isTest
     Static void setupData(){
        Event_Organizer__c  org = new Event_Organizer__c (
            Name = 'Devang Tiwari',
            Phone_No__c = '8953829030',
            Email__c = 'devang.tiwari@mirketa.com',
            Alternative_Phone_Number__c = '9555859877',
            Alternative_Email__c ='devang.tiwari_cs19@gla.ac.in'
        );
        insert org;
        
        Event_Details__c event = new Event_Details__c(
            Name_of_Event__c = 'MAX FIT Campaign',
            Event_Organizer__c  = org.Id,
            Event_Type__c = 'Virtual',
            Frequency__c  = 'Weekly',
            Max_Seats__c  = 199,
            Recurring__c = true,
            Live__c = true,
            Start_Date_Time__c = System.now(),
            End_Date_Time__c  = System.now().addDays(3)
        );
        insert event;
        Attendee__c att = new Attendee__c(
            Name = 'Anurag Tiwari',
            Email__c = 'tiwarianshumala1979@gmail.com',
            Phone_No__c = '9336904538'
        );
        insert att;
        
        Event_Attendee__c evtAtt = new Event_Attendee__c(Event__c = event.Id, Attendee__c = att.Id);
        insert evtAtt;
           
    }
    //  @isTest
    // static void sendEmailTest(){
    //     Test.startTest();
    //     EventAttendeeHandler.sendConfirmationEmail(trigger.new);
    //     Test.stopTest();
    // }
}