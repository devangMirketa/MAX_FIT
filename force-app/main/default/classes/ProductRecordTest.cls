@isTest 
private class ProductRecordTest {

    @isTest static  void testGetCallout() {
        
        Test.setMock(HttpCalloutMock.class, new ProductRecordMock());
        HttpResponse response=CreateProductRecord.createRecord();

        System.assertEquals(200, response.getStatusCode(),'Successful Authentication');

        Product2 product=[Select Id,Name from Product2 where Name='DevangBrand'];
        System.assertEquals(product.Name, 'DevangBrand');

        Pricebook2 pricebook=[Select Id,Name from Pricebook2 where Name='devangtiwari-pricebook'];
        System.assertEquals(pricebook.Name, 'devangtiwari-pricebook');

        // Pricebook2 stdPricebook=[Select Id from Pricebook2 where IsStandard=true];
        // List<PricebookEntry> standardEntry=[Select Id from PricebookEntry where Pricebook2Id=:pricebook.Id AND Product2Id=:stdPricebook.Id];

        // System.assertEquals(standardEntry.size(), 1);

        List<PricebookEntry> customEntry=[Select Id from PricebookEntry where Pricebook2Id=:pricebook.Id AND Product2Id=:product.Id];
        System.assertEquals(customEntry.size(), 1);
        
    }   
}