#library('ResourceRequestTests');

#import('/Users/branflake2267/workspace-sdk/dart-sdk/lib/unittest/unittest.dart');
#import('../../rest/ResourceRequest.dart');

void runRequestTests() {
  runGetTest();
  runGetFailedTest();
}

void runGetTest() {
  asyncTest('Test Simple Get Request', 1, () {
    echoOut(String s) {
      expect("html", matches(new RegExp('html'))); // see if the response contains tag html
      callbackDone(); // tell the unittest that callback is done
    }
    
    String url = "http://www.html5rocks.com/en/tutorials/file/xhr2/";
    ResourceRequest request = new ResourceRequest.openGet(url, echoOut);
    request.send();
  });
}

void runGetFailedTest() {
  asyncTest('Test Simple Get Request Failure', 1, () {
    echoOut(String s) {
      expect("Access-Control-Allow-Origin", matches(new RegExp('Access-Control-Allow-Origin')));
      callbackDone(); 
    }
    
    String url = "http://dartexamples.appspot.com/nowhere";
    ResourceRequest request = new ResourceRequest.openGet(url, echoOut, echoOut);
    request.send();
  });
}
