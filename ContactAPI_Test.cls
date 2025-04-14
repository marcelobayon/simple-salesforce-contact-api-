// === ContactAPI_Test.cls ===
@isTest
private class ContactAPI_Test {

    /**
     * Tests POST and GET methods from ContactAPI.
     * Best Practices:
     * - Use test.startTest() and test.stopTest() for accurate coverage measurement.
     * - Assert on expected results.
     */
    @isTest static void testCreateAndGetContact() {
        // Prepare POST request
        RestRequest req = new RestRequest();
        req.httpMethod = 'POST';
        req.requestUri = '/services/apexrest/contactapi/';
        req.requestBody = Blob.valueOf(JSON.serialize(new Map<String, String>{
            'firstName' => 'Test',
            'lastName' => 'User',
            'email' => 'testuser@example.com'
        }));
        RestContext.request = req;
        RestContext.response = new RestResponse();

        Test.startTest();
        String result = ContactAPI.createContact();
        Test.stopTest();

        System.assert(result.contains('Test'));

        // Test GET method
        Test.startTest();
        List<Contact> contacts = ContactAPI.getContacts();
        Test.stopTest();

        System.assert(!contacts.isEmpty(), 'Contact list should not be empty');
    }
}
