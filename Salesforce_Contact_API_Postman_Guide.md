
# 🧪 Salesforce Contact API – Quick Start Guide (Postman)

This guide helps you quickly test your Apex REST API for Contacts using Postman.

---

## ✅ Step 1: Prerequisites

Make sure you have:
- A Salesforce **Developer Org** or **Scratch Org**
- A deployed version of:
  - `ContactAPI.cls`
  - `ContactAPI_Test.cls`
- [Postman](https://www.postman.com/downloads/) installed

---

## 🔐 Step 2: Get Your Salesforce Access Token

### Option A: OAuth 2.0 via Postman

1. In Salesforce Setup → App Manager → New Connected App:
   - Enable OAuth Settings
     - Callback URL: `https://oauth.pstmn.io/v1/callback`
     - Scopes: `Full access`, `Perform requests on your behalf`
   - Save and wait 10 minutes.

2. In Postman:
   - Authorization → OAuth 2.0
   - Auth URL: `https://login.salesforce.com/services/oauth2/authorize`
   - Token URL: `https://login.salesforce.com/services/oauth2/token`
   - Use `Get New Access Token`

### Option B: Use Salesforce CLI

```bash
sfdx force:org:display -u your-alias
```

Copy:
- `Access Token`
- `Instance URL`

---

## 📥 Step 3: Import the Postman Collection

1. Download and import the file:
   [Salesforce_Contact_API_Postman_Collection.json](./Salesforce_Contact_API_Postman_Collection.json)

2. Postman → File → Import → Upload the file

---

## 🧠 Step 4: Set Environment Variables

| Variable       | Example                                 |
|----------------|------------------------------------------|
| `access_token` | `00Dxxxxxx...`                           |
| `instance_url` | `https://yourInstance.salesforce.com`    |

---

## 🚀 Step 5: Make Requests

### ➕ Create Contact

```http
POST {{instance_url}}/services/apexrest/contactapi/
Authorization: Bearer {{access_token}}
Content-Type: application/json
```

Body:
```json
{
  "firstName": "Jane",
  "lastName": "Doe",
  "email": "jane@example.com"
}
```

### 📥 Retrieve Contacts

```http
GET {{instance_url}}/services/apexrest/contactapi/
Authorization: Bearer {{access_token}}
```

---

## 🧪 Step 6: Run the Apex Test

```bash
sfdx force:apex:test:run -n ContactAPI_Test -r human
```

---

## ✅ You’re Done!

Use this as a technical proof-of-concept, interview artifact, or integration reference. 🎉
