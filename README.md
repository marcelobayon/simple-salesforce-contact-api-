# simple-salesforce-contact-api-

I created this GitHub repo to demonstrate a lightweight, production-ready Salesforce REST API that follows best practices for API development, Apex class structure, testing, and CI documentation. 

Goal:

Expose a simple Salesforce Apex REST API that:

  📤 Accepts POST requests to create a Contact
  
  📥 Accepts GET requests to retrieve Contacts
  
  🧪 Shows test methods
  
  🔐 Demonstrates basic security via named credentials or IP whitelisting

Best Practices:

I deserialize JSON input as a Map<String, Object> — this gives flexibility to handle different inputs and prevents type-casting errors.
The API uses try/catch blocks for both endpoints to catch unexpected errors and return friendly, structured error messages with the right HTTP status codes (400 for bad input, 201 for success).
I use LIMIT 10 in queries to avoid CPU and heap limits.
The @isTest class simulates both the POST and GET requests using RestContext, which means it’s not just checking that the code runs — it’s validating API-level behavior.

Tech Stack:

  Apex (REST API, SOQL, Test Classes)
  Salesforce Developer Org (you can deploy via VS Code or Dev Console)
  GitHub (README + code + optional Postman collection)

Full step by step instructions have been moved into the Salesforce_Contact_API_Postman_Guide.md in this same Github Repo  or alternatively click here : https://github.com/marcelobayon/simple-salesforce-contact-api-/blob/Marcelobayon/Salesforce_Contact_API_Postman_Guide.md 
