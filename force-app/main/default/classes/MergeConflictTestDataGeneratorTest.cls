@IsTest
private class MergeConflictTestDataGeneratorTest {

    @IsTest
    static void testBuildRecords() {
        Test.startTest();
        List<MergeConflictTestDataGenerator.MergeConflictRecord> records =
            MergeConflictTestDataGenerator.buildRecords();
        Test.stopTest();

        System.assertEquals(950, records.size(), 'Expected 950 generated records.');

        MergeConflictTestDataGenerator.MergeConflictRecord firstRecord = records[0];
        System.assertEquals(1, firstRecord.rowNumber, 'First row number should match.');
        System.assertEquals('MC-0001', firstRecord.externalKey, 'First external key should match.');
        System.assertEquals('feature/merge-conflict-demo', firstRecord.sourceBranch, 'Source branch should match.');
        System.assertEquals('main', firstRecord.targetBranch, 'Target branch should match.');
        System.assertEquals('READY', firstRecord.status, 'Status should match.');

        MergeConflictTestDataGenerator.MergeConflictRecord lastRecord = records[records.size() - 1];
        System.assertEquals(950, lastRecord.rowNumber, 'Last row number should match.');
        System.assertEquals('MC-0950', lastRecord.externalKey, 'Last external key should match.');
    }

    @IsTest
    static void testGetRecordCount() {
        Test.startTest();
        Integer countValue = MergeConflictTestDataGenerator.getRecordCount();
        Test.stopTest();

        System.assertEquals(950, countValue, 'Record count should match generated records.');
    }

    @IsTest
    static void testGetSummary() {
        Test.startTest();
        String summary = MergeConflictTestDataGenerator.getSummary();
        Test.stopTest();

        System.assertEquals(
            'Generated 950 merge conflict test records.',
            summary,
            'Summary should include generated record count.'
        );
    }

    @IsTest
    static void testLogSummary() {
        Test.startTest();
        MergeConflictTestDataGenerator.logSummary();
        Test.stopTest();

        System.assert(true, 'logSummary should complete without exceptions.');
    }

    @IsTest
    static void testMergeConflictRecordConstructor() {
        MergeConflictTestDataGenerator.MergeConflictRecord record =
            new MergeConflictTestDataGenerator.MergeConflictRecord(1001, 'MC-1001');

        System.assertEquals(1001, record.rowNumber);
        System.assertEquals('MC-1001', record.externalKey);
        System.assertEquals('feature/merge-conflict-demo', record.sourceBranch);
        System.assertEquals('main', record.targetBranch);
        System.assertEquals('READY', record.status);
        System.assertEquals(
            'Generated test row for merge conflict validation',
            record.notes
        );
    }
}