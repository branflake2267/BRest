#library('ResourceRequest');

#import('dart:html');
#import("dart:json");

typedef void RequestHandler(String responseText);

typedef void ErrorHandler(String error);

class ResourceRequest {
  XMLHttpRequest request;
  RequestHandler _callbackOnSuccess;
  ErrorHandler _callbackOnFailure;
 
  /**
   * Instantiate a resource request. 
   * 
   * Note: If the request is cross site, the remote site will need to have CORS enabled.  
   */
  ResourceRequest.openGet(String url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure {
    request.open("GET", url, async : true);
    request.on.loadEnd.add((XMLHttpRequestProgressEvent e) => onLoadEnd(e));
  }
  
  /**
   * Start the get request
   */
  void send() {
    request.send();
  }

  void onLoadEnd(XMLHttpRequestProgressEvent event) {
    if (request.readyState == 4 && request.status == 200) {
      _callbackOnSuccess(request.responseText);
    } else if (_callbackOnFailure != null) {
      _callbackOnFailure(request.statusText);
    }
  }
}