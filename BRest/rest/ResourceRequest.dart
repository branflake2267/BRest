#library('Request');

#import('dart:html');
#import("dart:json");

typedef void RequestHandler(String responseText);

typedef void ErrorHandler(String error);

class ResourceRequest {
  XMLHttpRequest request;
  RequestHandler _callbackOnSuccess;
  ErrorHandler _callbackOnFailure;
  
  ResourceRequest.openGet(String url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure {
    request.open("GET", url, async : true);
    request.on.loadEnd.add((XMLHttpRequestProgressEvent e) => onLoadEnd(e));
  }
  
  void send() {
    request.send();
  }

  void onLoadEnd(XMLHttpRequestProgressEvent event) {
    if (request.readyState == 4 && request.status == 200) {
      _callbackOnSuccess(request.responseText);
    } else if (_callbackOnFailure != null) {
      print(request.statusText);
      _callbackOnFailure(request.statusText);
    }
  }
  
}