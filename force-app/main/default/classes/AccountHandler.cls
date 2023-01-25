public class AccountHandler{
    public static void insertAccount(integer num){
        integer count =1;
        list <Account> addAccounts = new list <Account>();
        while(count <= num){
            System.debug('Valor do contador antes da incrementação' + count);
            Account acc = new Account();
            acc.Name = 'Acme Inc '+ count;
            acc.AccountNumber = 'A000' + count;           
            count++;
            addAccounts.add(acc);
        } 
        insert addAccounts;
    }
}