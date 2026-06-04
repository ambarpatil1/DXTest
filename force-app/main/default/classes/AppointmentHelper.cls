public class AppointmentHelper {
    
    // Method to create an Appointment__c record
    public static Appointment__c createAppointment(String epicField, String epicNewField, String feedbackDescription) {
        // Create a new Appointment__c instance
        Appointment__c newAppointment = new Appointment__c();
        
        // Setting field values
        newAppointment.epic_field__c = epicField;
        newAppointment.epic_new_field__c = epicNewField;
        newAppointment.feedabck_Description__c = feedbackDescription;
        
        try {
            // Insert the new Appointment record
            insert newAppointment;
        } catch (DmlException e) {
            System.debug('Error creating appointment: ' + e.getMessage());
            throw new CustomException('Error creating appointment.');
        }
        
        return newAppointment;
    }

    // Method to update an Appointment__c record
    public static Appointment__c updateAppointment(Id appointmentId, String epicField, String epicNewField, String feedbackDescription) {
        Appointment__c appointmentToUpdate = [SELECT Id, epic_field__c, epic_new_field__c, feedabck_Description__c 
                                             FROM Appointment__c 
                                             WHERE Id = :appointmentId 
                                             LIMIT 1];
        
        // Updating the fields
        appointmentToUpdate.epic_field__c = epicField;
        appointmentToUpdate.epic_new_field__c = epicNewField;
        appointmentToUpdate.feedabck_Description__c = feedbackDescription;
        
        try {
            // Update the Appointment record
            update appointmentToUpdate;
        } catch (DmlException e) {
            System.debug('Error updating appointment: ' + e.getMessage());
            throw new CustomException('Error updating appointment.');
        }
        
        return appointmentToUpdate;
    }
    
    // Custom exception for handling errors
    public class CustomException extends Exception {}
}