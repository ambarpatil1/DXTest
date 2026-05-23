public with sharing class AccountTriggerHandler {
    public static void updateAddress(List<Account> newAccounts) {
        for (Account acc: newAccounts) {
            acc.BillingCity = 'Prague';
        }
    }
}