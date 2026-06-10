@isTest
public class A32Test {
    
    @isTest
    static void testCreateAccount() {
        // Arrange
        A32 obj = new A32();
        String testName = 'Test Account A32';
        
        // Act
        Account acc = obj.createAccount(testName);
        
        // Assert
        System.assertNotEquals(null, acc, 'Returned account should not be null');
        System.assertEquals(testName, acc.Name, 'Account name should match input');
    }
}