// === ContactAPI.cls ===
@RestResource(urlMapping='/contactapi/*')
global with sharing class ContactAPI {

    /**
     * Handles HTTP POST to create a new Contact record.
     * Best Practices:
     * - Use try/catch to handle unexpected errors and return meaningful messages.
     * - Deserialize as untyped map to allow flexible key/value access.
     * - Validate fields (not shown in detail here to keep it simple).
     */
    @HttpPost
    global static String createContact() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        try {
            Map<String, Object> body = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());

            // Basic input sanitation
            if (!body.containsKey('firstName') || !body.containsKey('lastName')) {
                res.statusCode = 400;
                return JSON.serialize(new Map<String, String>{
                    'error' => 'Missing required fields: firstName or lastName'
                });
            }

            Contact c = new Contact(
                FirstName = (String) body.get('firstName'),
                LastName = (String) body.get('lastName'),
                Email = (String) body.get('email')
            );

            insert c;
            res.statusCode = 201;
            return JSON.serialize(c);
        } catch (Exception e) {
            res.statusCode = 400;
            return JSON.serialize(new Map<String, String>{
                'error' => 'Failed to create contact: ' + e.getMessage()
            });
        }
    }

    /**
     * Handles HTTP GET to retrieve a list of Contacts.
     * Best Practices:
     * - Use LIMIT to avoid querying excessive records.
     * - Return only needed fields for performance and security.
     */
    @HttpGet
    global static List<Contact> getContacts() {
        try {
            return [
                SELECT Id, FirstName, LastName, Email
                FROM Contact
                ORDER BY CreatedDate DESC
                LIMIT 10
            ];
        } catch (Exception e) {
            // Return an empty list if the query fails, or handle via custom error object
            return new List<Contact>();
        }
    }
}
