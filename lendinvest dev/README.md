THis Folder contains All my devs for the requirements enjoy!!!!



TECHNICAL SOLUTIONS by Mehde Nessil

Requirement number 1:

Create a new custom field (rollup summary) on the Account object called "Total Customer Spend". 

Create a new custom field on the Account object called "Customer Classification" with a data type of picklist. Picklist values will be "GOLD", "SILVER", "BRONZE", and leave one value blank.

Create a new Apex trigger on the Account object that will run whenever the "Total Customer Spend" field is updated.

In the trigger, retrieve the value of the "Total Customer Spend" for each account that triggered.
Based on the total customer spend, set the value of the "Customer Classification" field on the Account object.

Test mytrigger to ensure that it is working as expected and that the "Customer Classification" field is being set correctly.


Requirement number 2:

For the second requirement, i will need to create an Apex class that uses the Twilio API to send an SMS to the CEO's business mobile when an Account reaches Gold status. As Callouts from triggers are currently not supported in salesforce i will trigger it through a flow trigger.

To use the Twilio API, i will need to sign up for a Twilio account and obtain an API key and a phone number that will be used to send the SMS. i can then use the API key and phone number to make requests to the Twilio API from myApex code.

To send an SMS, i will need to make a POST request to the Twilio API with the phone number of the recipient and the message to be sent in the request body. i can use the HttpRequest class in Apex to make this request.

To ensure that the notification only runs when the customer reaches Gold status for the first time, i can use a custom field(checkbox) on the Account object to track whether the customer has reached Gold status before. i can then check the value of this field in myApex code before sending the SMS.


Requirement number 3:

For this requirement I build a LWC who take a message as an input, and the JS logic fetch the receiver Phone number from the current Account, to make it visible only to the account with the Gold Customer classification I decided to go with a conditional view of the LWC on the record page but I could also put the condition in the html and retrieve this data with from my JS with my @Wire method.

I added inline comment for and unit test for the code.


You will find a Powerpoint with some screenshot attached to this email.

Enjoy!!!




