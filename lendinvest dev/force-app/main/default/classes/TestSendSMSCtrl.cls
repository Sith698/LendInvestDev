/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-28-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
@isTest
private class TestSendSMSCtrl {
    @isTest
    static void testSendSMS() {
        // Start the test
        Test.startTest();
        // Set up the test data
        String phoneNo = '+1234567890';
        String smsBody = 'This is a test SMS message';
        String fromPhNumber = '+1234567891';
        // Call the SendSMS method
        String result = SendSMSCtrl.SendSMS(phoneNo, smsBody, fromPhNumber);
        // Verify that the result is 'SMS Sent Successfully'
        System.assertEquals('SMS Sent Successfully', result);
        // Stop the test
        Test.stopTest();
    }
}
