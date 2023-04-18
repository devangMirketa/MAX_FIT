@RestResource(urlMapping='/Speaker__c/*')
global with sharing class SpeakerWebServices {
    
    @HttpPost
    global static ID createSpeaker(String speakerName, String Email,
        String Phone, String CompanyName) {
        Speaker__c thisSpeaker = new Speaker__c(
            Name=speakerName,
            Email__c=Email,
            Phone__c=Phone,
            Company_Name__c=CompanyName);
        //insert thisSpeaker;
        //return thisSpeaker.Id;
        try{
            RestResponse res=RestContext.response;
            res.statusCode=200;
            insert thisSpeaker;
            return 'success';
        }
        catch(Exception e){
            RestResponse res=RestContext.response;
            res.statusCode=400;
            return 'Failed';
        }
    }   
}