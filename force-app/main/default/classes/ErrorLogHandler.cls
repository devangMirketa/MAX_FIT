public class ErrorLogHandler {
    public static void insertErrorLog(dateTime logDateTime, String logDetails, String processName) {
        Error_Log__c errorLog = new Error_Log__c();
        errorLog.Log_Date_Time__c = logDateTime;
        errorLog.Log_Details__c = logDetails;
        errorLog.Process_Name__c = processName;
        insert errorLog;
    }
}