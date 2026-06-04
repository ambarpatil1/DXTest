public class OrderService {
    public static String processOrder(Id accountId) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        HelperClass.log('Processing order for ' + acc.Name);
        return 'Processed order for ' + acc.Name;
        //29May26
        //c012
        //t02
    }
}