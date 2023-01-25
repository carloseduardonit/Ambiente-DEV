public with sharing class Books4EveryoneHomeController {
@AuraEnabled
    public static List<Book__c> getBooks() {
        return [SELECT Id, Name, Genre__c, Description__c FROM Book__c];
        //return [select id, Name, Genre__c,  Author__r.Name from Book__c]; 
    }
    
    static string nameGenre = 'Fantasy';
    static String [] StringGenre = new String [10];
    static Integer [] IntegerGenre = new Integer [StringGenre.size()];
    
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
            for(Integer a = 0 ; a <StringGenre.size() ; a++){
                if(StringGenre[a] == bb.Genre__c){
                    if(IntegerGenre[a]== 0 || IntegerGenre[a]== null ){
                       IntegerGenre[a] = 1; 
                    }else{
                        IntegerGenre[a]++;
                    }
                    break;
                } else if(StringGenre[a] == null){
                    StringGenre[a] = bb.Genre__c;
                    if(IntegerGenre[a]== 0 || IntegerGenre[a]== null ){
                       IntegerGenre[a] = 1; 
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
        for(integer a =0 ;a<StringGenre.size();a++){
            String  ast = StringGenre[a];
            if(!String.isEmpty(ast) && !String.isBlank(ast) && ast != null){
                System.debug('Genero: ' +StringGenre[a] + ' | contar: ' + IntegerGenre[a]);
            }
        }
    }
    
}