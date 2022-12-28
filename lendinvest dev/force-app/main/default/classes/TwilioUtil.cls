/**
 * @description       : This class provides a method for sending SMS messages using Twilio.
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-28-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class TwilioUtil {
    // The Twilio phone number to send the SMS message from
    private static final String TWILIO_PHONE_NUMBER = '6188925075';

    /**
     * @description       : This method sends an SMS message to the specified phone number using the Twilio API.
     * @param FlowInCal   : A list of FlowInputCallout objects containing the recipient phone number and message to send.
     * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
     * @group             : 
     * @last modified on  : 12-28-2022
     * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
    **/
    @InvocableMethod
    public static void sendSms(List<FlowInputCallout>FlowInCal) {
        // Replace these with your own Twilio account SID and auth token
        String accountSid = 'AC27d6afba20d5c491eb273978bfd7f87a';
        String token = '0125d954dda7b6b734e6cf1beb6332b5';
        
        // The URL for the Twilio API endpoint for sending SMS messages
        String endPoint = 'https://api.twilio.com/2010-04-01/Accounts/'+accountSid+'/SMS/Messages.json';
        
        // Encode the Twilio account SID and auth token as a base64 string for use in the HTTP request header
        Blob creds = Blob.valueOf(accountSid+':' +token);
        
        // Create a new HTTP request
        HttpRequest req = new HttpRequest();
        Http http = new Http();
        HTTPResponse res = new HTTPResponse();
        
        // Set the endpoint for the request
        req.setEndpoint(endPoint);
        
        // Set the HTTP method for the request
        req.setMethod('POST');
        
        // Set the HTTP headers for the request
        String VERSION  = '3.2.0';
        req.setHeader('X-Twilio-Client', 'salesforce-' + VERSION);
        req.setHeader('User-Agent', 'twilio-salesforce/' + VERSION);
        req.setHeader('Accept', 'application/json');
        req.setHeader('Accept-Charset', 'utf-8');
        req.setHeader('Authorization', 'Basic '+EncodingUtil.base64Encode(creds));
        
            // Set the body of the request to contain the recipient phone number, Twilio phone number, and message to send
        req.setBody('To=' + EncodingUtil.urlEncode(FlowInCal[0].to, 'UTF-8') + '&From=' + EncodingUtil.urlEncode(TWILIO_PHONE_NUMBER,'UTF-8') + '&Body=' + FlowInCal[0].message);
        
        // Send the HTTP request
        res = http.send(req);
        
        // Debug the response body
        System.debug(res.getBody());

        // Check the response status code
        if (res.getStatusCode() != 201) {
            // If the status code is not 201 (Created), something went wrong.
            // You may want to throw an exception or log an error here.

            System.debug('Error sending SMS message: ' + res.getStatusCode() + ' ' + res.getStatus());
        } else {
            // The SMS message was sent successfully
            System.debug('SMS message sent successfully');
        }
    }
}
