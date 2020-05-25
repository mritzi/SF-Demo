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
    
    public static void logError(){
        Account account = new Account();
        account.Name = 'Mohammed RIzwan';
        account.Website = 'www.mdrizwan.com';
        account.UpsellOpportunity__c = 'Invalid val';
        
        List<Account> account_list = new List<Account>{account};
        List<Database.SaveResult> sr_list = Database.insert(account_list, false);
        
        if(hasErrors(sr_list)){
            SentryErrorLogEntity obj = new SentryErrorLogEntity(sr_list, account_list);
            System.debug(JSON.serializePretty(obj));
            TestClass111.callSentry(
                JSON.serializePretty(obj)
            );
        }
    }
    
    @future(Callout=true)
    public static void callSentry(String payload){
        payload = payload.replace('excptn', 'exception');
        SentryErrorLogCallout obj = new SentryErrorLogCallout(payload);
        ResponseStatusWrapper status = obj.run();
        System.debug(
        	JSOn.serializePretty(status)
        );
    }
    
    private static Boolean hasErrors(List<Database.SaveResult> sr_list){
        for(Database.SaveResult sr:sr_list){
            if(!sr.isSuccess()){
                return true;
            }
        }
        return false;
    }
    
}
