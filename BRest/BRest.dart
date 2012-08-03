#import('dart:html');
#import('./oauth/OAuth2.dart');

void main() {
 
  if (hasAccessToken()) {
    startRestRequest();
  } else {
    startOAuthRequest();
  }
  
}

void startRestRequest() {
  
}

void startOAuthRequest() {
  String url = "https://accounts.google.com/o/oauth2/auth";
  String response_type = "token";
  String client_id = "734175750239.apps.googleusercontent.com";
  String redirect_uri = "http://127.0.0.1:3030/Users/branflake2267/git/BRest/BRest/BRest.html";
  String scope = "https://www.googleapis.com/auth/drive";
  String state = "testingState";
  String approval_prompt = "force";
  OAuth2 oAuth = new OAuth2.createRequest(url, 
                                          response_type, 
                                          client_id, 
                                          redirect_uri, 
                                          scope, 
                                          state, 
                                          approval_prompt);
  window.location.href = oAuth.getOAuthUrl();
}

bool hasAccessToken() {
  Map<String,String> map = getQueryStringParameters();
  return map.containsKey("access_token");
}

Map<String,String> getQueryStringParameters() {
  Map<String, String> params = new HashMap<String, String>();
  window.location.hash.replaceFirst("#", "").split("&").forEach((e) {
    if (e.contains("=")) {
      List<String> split = e.split("=");
      params[split[0]] = split[1];
    }
  });
  return params;
}