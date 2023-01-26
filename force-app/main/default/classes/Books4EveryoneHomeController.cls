/**
* Projeto:Transform SQL Queries to SOQL Queries in a Lightning App
* Trilha: Write Your First SOQL Query 
* URL: https://trailhead.salesforce.com/pt-BR/content/learn/projects/transform-sql-queries-to-soql-queries-in-a-lightning-app/write-your-first-soql-query
*/
public with sharing class Books4EveryoneHomeController {
@AuraEnabled
    public static List<Book__c> getBooks() {
        return [SELECT Id, Name, Genre__c, Description__c FROM Book__c];
        //return [select id, Name, Genre__c,  Author__r.Name from Book__c]; 
    }
    
    static string nameGenre = 'Fantasy';
    static String [] stringGenre = new String [10];
    static Integer [] integerGenre = new Integer [stringGenre.size()];
    
    /**
	* Método  utilizar variavel estatico  para obter a  quantidade de  registro 
	**/
    public static Integer countGenre(){        
        return countGenre(nameGenre);
    }
    
    /**
	* Método  utilizar variavel estatico  para obter a  quantidade de  registro 
	**/
    public static Integer countGenre(String nameGenre){
        List <Book__c> books = getBooks();
        Integer count = 0;
        for (Book__c boo: books){
            if(boo.Genre__c == nameGenre){
                count++;
            } 
        }
        if(count ==0){
            System.debug('Erro !!');
        }
        return count;
    }
    
    /**
	* Método  utilizar variavel estatico  para obter a  quantidade de  registro 
	**/
    public static void classifyGenre(){
        List <Book__c> books = getBooks();
        for(Book__c bb: books){
            for(Integer a = 0 ; a <stringGenre.size() ; a++){
                if(stringGenre[a] == bb.Genre__c){
                    if(integerGenre[a]== 0 || integerGenre[a]== null ){
                        integerGenre[a] = 1; 
                    }else{
                        integerGenre[a]++;
                    }
                    break;
                } else if(stringGenre[a] == null){
                    stringGenre[a] = bb.Genre__c;
                    if(integerGenre[a]== 0 || integerGenre[a]== null ){
                        integerGenre[a] = 1; 
                    }
                    break;
                }
            }
        }       
    }
    
    /**
	* Método  utilizar variavel estatico  para obter a  quantidade de  registro 
	**/
    public static void imprintGenre(){
        classifyGenre();
        for(integer a =0 ;a<stringGenre.size();a++){
            String  ast = stringGenre[a];
            if(!String.isEmpty(ast) && !String.isBlank(ast) && ast != null){
                System.debug('Genero: ' +stringGenre[a] + ' | contar: ' + integerGenre[a]);
            }
        }
    }
    
}