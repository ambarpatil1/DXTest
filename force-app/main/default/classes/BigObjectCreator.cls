public class BigObjectCreator {

    /**
     * Method to insert records into a BigObject dynamically.
     * @param bigObjectName - The API name of the BigObject (e.g., 'CustomBigObject__b').
     * @param fieldValues - Map of field API names and their default values.
     * @param recordCount - Number of records to create.
     */
    public static void createBigObjectRecords(String bigObjectName, Map<String, Object> fieldValues, Integer recordCount) {
        // Validate inputs
        if (String.isBlank(bigObjectName) || !bigObjectName.endsWith('__b')) {
            throw new IllegalArgumentException('BigObject API name must end with "__b".');
        }
        if (fieldValues == null || fieldValues.isEmpty()) {
            throw new IllegalArgumentException('Field values map cannot be null or empty.');
        }
        if (recordCount <= 0) {
            throw new IllegalArgumentException('Record count must be greater than zero.');
        }

        // Describe the BigObject and create records dynamically
        Schema.SObjectType bigObjectType = Schema.getGlobalDescribe().get(bigObjectName);
        if (bigObjectType == null) {
            throw new IllegalArgumentException('Invalid BigObject API name: ' + bigObjectName);
        }

        List<SObject> recordsToInsert = new List<SObject>();
        for (Integer i = 0; i < recordCount; i++) {
            SObject bigObjectRecord = bigObjectType.newSObject();
            
            // Assign values to fields dynamically
            for (String fieldName : fieldValues.keySet()) {
                Object fieldValue = fieldValues.get(fieldName);
                bigObjectRecord.put(fieldName, fieldValue);
            }

            // Add to the list of records
            recordsToInsert.add(bigObjectRecord);
        }

        // Perform DML for BigObject
        try {
            Database.insertImmediate(recordsToInsert);
            System.debug('Successfully inserted ' + recordsToInsert.size() + ' records into BigObject: ' + bigObjectName);
        } catch (Exception e) {
            System.debug('Error while inserting BigObject records: ' + e.getMessage());
            throw e;
        }
    }
}