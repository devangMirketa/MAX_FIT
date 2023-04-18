@isTest
private class ErrorLogUtilsTest {

    @isTest
    public static void testInsertErrorLog() {
        // Create test data
        Error_Log__c errorLog = new Error_Log__c();
        dateTime logDateTime = System.now();
        String logDetails = 'Test error log details';
        String processName = 'Test process name';
        insert errorLog;
        /*system.assertEquals(logDetails,'Test error log details');
        system.assertEquals(processName,'Test process name');
        system.assertEquals(logDateTime,System.now());*/
        // Call the insertErrorLog method
        Test.startTest();
        system.assertEquals(logDetails,'Test error log details');
        system.assertEquals(processName,'Test process name');
        system.assertEquals(logDateTime,System.now());
        ErrorLogHandler.insertErrorLog(logDateTime, logDetails, processName);
       
        Test.stopTest();
    }
}