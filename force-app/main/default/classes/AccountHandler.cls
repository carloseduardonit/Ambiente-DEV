/**
     * Trilha  de Estudo: Desenvolvedor iniciante
     * Url:https://trailhead.salesforce.com/pt-BR/content/learn/trails/force_com_dev_beginner?trailmix_creator_id=tormen&trailmix_slug=baby-steps-4-devs
     * Módulo: Banco de dados e noções básicas do Apex
     * url:https://trailhead.salesforce.com/pt-BR/content/learn/modules/apex_database?trail_id=force_com_dev_beginner&trailmix_creator_id=tormen&trailmix_slug=baby-steps-4-devs
     */
public with sharing class AccountHandler{
    /**
     * Metodo responsavel pela  criação e inserção no objeto conta conforme o usuario determinar a quantidade
     */
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

    /**
     * Metodo responsavel pela  Obtenção  do registro no objeto conta conforme o usuario determinar Nome
     */
    public static String obterID(String nameString){
        Account acc = [Select ID from Account where Name = :nameString limit 1];
        //System.debug(acc.Id);
        return  acc.Id;
    }
}