@isTest
private class AppointmentHelperTest {

    @isTest
    static void testCreateAppointment() {
        // Creating a new Appointment__c record
        Appointment__c newAppointment = AppointmentHelper.createAppointment('Epic Field Value', 'Epic New Field Value', 'This is a feedback description.');
        
        // Verify that the appointment record was created successfully
        System.assertNotEquals(null, newAppointment.Id, 'Appointment was not created successfully');
        System.assertEquals('Epic Field Value', newAppointment.epic_field__c, 'Epic field value did not match');
        System.assertEquals('Epic New Field Value', newAppointment.epic_new_field__c, 'Epic new field value did not match');
        System.assertEquals('This is a feedback description.', newAppointment.feedabck_Description__c, 'Feedback description did not match');
    }

    @isTest
    static void testUpdateAppointment() {
        // Create an initial Appointment record
        Appointment__c appointment = new Appointment__c(epic_field__c = 'Initial Value', 
                                                       epic_new_field__c = 'Initial New Field', 
                                                       feedabck_Description__c = 'Initial Feedback');
        insert appointment;
        
        // Update the Appointment record
        Appointment__c updatedAppointment = AppointmentHelper.updateAppointment(appointment.Id, 'Updated Value', 'Updated New Field', 'Updated Feedback Description');
        
        // Verify the updates
        System.assertEquals('Updated Value', updatedAppointment.epic_field__c, 'Epic field value was not updated');
        System.assertEquals('Updated New Field', updatedAppointment.epic_new_field__c, 'Epic new field value was not updated');
        System.assertEquals('Updated Feedback Description', updatedAppointment.feedabck_Description__c, 'Feedback description was not updated');
    }
}