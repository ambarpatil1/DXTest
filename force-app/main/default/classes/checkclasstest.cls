@isTest
public class checkclasstest{
static testMethod void validateSampleApex() {
Account a =new Account();

// Test that the trigger correctly updated the price
System.assertEquals(999, a.AnnualRevenue);
}
}