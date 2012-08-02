#library('OAuth2');

class OAuth2 {
  String url;
  String response_type;
  String client_id;
  String redirect_uri;
  String scope;
  String state;
  String approval_prompt;
  
  OAuth2.createRequest([this.url, 
                        this.response_type,    
                        this.client_id, 
                        this.redirect_uri,
                        this.scope, 
                        this.state, 
                        this.approval_prompt]);
  
  String getOAuthUrl() {
    String oauthurl = "$url"
        "?scope=$scope"
        "&state=$state"
        "&redirect_uri=$redirect_uri"
        "&response_type=$response_type"
        "&client_id=$client_id"
        "&approval_prompt=$approval_prompt";
    return oauthurl;
  }
}
