public class TestClass999 {
    public List<Account> accountList{get;set;}

    public TestClass999(){
        accountList = [Select Id, Name, Website From Account Where Website != NULL LIMIT 10];
        System.debug('accountList : ' + accountList);
    }
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> acList = new List<Account>();
        acList = [Select Id, Name, Website From Account Where Website != NULL LIMIT 10];
        System.debug('acList : ' + acList);
        return acList;
    }

}
