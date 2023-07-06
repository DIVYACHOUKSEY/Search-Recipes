public with sharing class spoonacular {
    private static final String SPOONACULAR_API = 'https://api.spoonacular.com';
    private static final String API_KEY = 'd92e0f884d0042c2bc77ade077615ab4';
    @AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(SPOONACULAR_API+'/recipes/random?apiKey='+API_KEY);
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.

if(response.getStatusCode() == 200) {
  return response.getBody();
    }
        return '';
    }
    


      @AuraEnabled
      public static String getRecipe(String recipeId){
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(SPOONACULAR_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
//System.debug('response code'+ response.getStatusCode());
if(response.getStatusCode() == 200) {
  return response.getBody();
    }
          return '';
    }
    
    @AuraEnabled
     public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
HttpRequest request = new HttpRequest();
request.setEndpoint(SPOONACULAR_API+'/recipes/findByIngredients?apiKey='+API_KEY+'&ingredients='+ingredients);
request.setMethod('GET');
HttpResponse response = http.send(request);
// If the request is successful, parse the JSON response.
System.debug('response code'+ response.getStatusCode());
if(response.getStatusCode() == 200) {
   return response.getBody();
    }
         return '';
    }
}