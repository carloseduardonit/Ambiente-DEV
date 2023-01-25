public class OlderAccountsUtility {
     public static void updateOlderAccounts() {
		Account[] OldAccount  = [Select Id, Description from Account order by CreatedDate asc Limit 5];
   	 	for(Account acct : OldAccount) {
            System.debug(acct.Id +' Descrição velha '+ acct.Description);
        	acct.Description = 'Heritage Account';
            System.debug(acct.Id +' Descrição nova '+ acct.Description);
   	 	}
         update OldAccount;
     }
}