@isTest
global class ProductRecordMock implements HttpCalloutMock {
    global HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('[{"id":1,"title":"DevangBrand","description":"Its My time to rise","price":99.99}]');
        response.setStatusCode(200);
        return response;    
    }
}