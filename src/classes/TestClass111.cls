public class TestClass111 {
    public List<Account> accountList{get;set;}

    public TestClass111(){
        accountList = [Select Id, Name, Website From Account Where Website != NULL LIMIT 10];
    }
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> acList = new List<Account>();
        acList = [Select Id, Name, Website From Account Where Website != NULL LIMIT 10];
        return acList;
    }

}
