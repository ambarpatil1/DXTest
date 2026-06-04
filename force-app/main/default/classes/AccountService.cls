public class AccountService {
    public static String getAccountName(Id accountId) {
        Account acc = [SELECT Name FROM Account WHERE Id = :accountId LIMIT 1];
        return acc.Name;
//comments added on 27may26
//test02
    }
}