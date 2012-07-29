#library('Request');

#import('dart:html');
#import("dart:json");

typedef void RequestHandler(String responseText);

class Request {
  XMLHttpRequest request;
  RequestHandler _callbackOnSuccess;
  
  Request.openGet(String url, RequestHandler callbackOnSuccess)
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess {
    request.open("GET", url, async : true);
    request.on.loadEnd.add((XMLHttpRequestProgressEvent e) => onLoadEnd(e));
  }
  
  void send() {
    request.send();
  }

  // TODO onfailure callback
  void onLoadEnd(XMLHttpRequestProgressEvent event) {
    _callbackOnSuccess(request.responseText);
  }
  
}