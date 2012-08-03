#library('ResourceRequest');

#import('dart:html');

typedef void RequestHandler(String responseText);

typedef void ErrorHandler(String error);

/**
 * Note: If the request is cross site, the remote site will need to have CORS enabled.  
 */
class RestRequest {
  String url;
  XMLHttpRequest request;
  RequestHandler _callbackOnSuccess;
  ErrorHandler _callbackOnFailure;
  String _data;
  
  RestRequest.openGet(this.url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure {
      _open("GET");
  }
  
  RestRequest.openPut(this.url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure, String data])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure,
      _data = data {
      _open("PUT");
  }
  
  RestRequest.openPost(this.url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure, String data])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure,
      _data = data {
      _open("POST");
  }
  
  RestRequest.openDelete(this.url, RequestHandler callbackOnSuccess, [ErrorHandler callbackOnFailure])
    : request = new XMLHttpRequest(),
      _callbackOnSuccess = callbackOnSuccess,
      _callbackOnFailure = callbackOnFailure {
      _open("DELETE");
  }
  
  /**
   * Start the request
   */
  void send([String data]) {
    if (data != null) {
      request.send(data);
    } else if (_data != null) { 
      request.send(_data);
    } else {
      request.send();
    }
  }
  
  void _open(String method) {
    request.open(method, url, async : true);
    request.on.loadEnd.add((XMLHttpRequestProgressEvent e) => _onLoadEnd(e));
  }

  void _onLoadEnd(XMLHttpRequestProgressEvent event) {
    if (request.readyState == 4 && request.status == 200) {
      _callbackOnSuccess(request.responseText);
    } else if (_callbackOnFailure != null) {
      _callbackOnFailure(request.statusText);
    }
  }
}