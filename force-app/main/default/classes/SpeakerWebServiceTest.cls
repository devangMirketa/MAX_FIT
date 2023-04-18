@isTest
public with sharing class SpeakerWebServiceTest {
    
    @isTest static void createSpeakerRecord(){
        Test.startTest();
        RestContext.request=new RestRequest();
        RestContext.response=new RestResponse();
        Id spkrRecord1 = SpeakerWebServices.createSpeaker('Devang','aaab@gmail.com','555555556','Mirketa');
        Id spkrRecord2 = SpeakerWebServices.createSpeaker('Devang','aaaa@gmail.com','5555555565','Mirketa');
        List <Speaker__c> speaker = [Select Id, Name From Speaker__c Where Name= 'Devang'];
        System.assertEquals(1,speaker.size());
        System.assertEquals(400, RestContext.response.statusCode);
        Test.stopTest();
    }
}