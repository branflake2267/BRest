#library('RequestTests');

#import('/Users/branflake2267/workspace-sdk/dart-sdk/lib/unittest/unittest.dart');
#import('../../rest/Request.dart');

void runRequestTests() {
  
  asyncTest('Test Simple Get Request', 1, () {
    echoOut(String s) {
      expect("html", matches(new RegExp('html'))); // see if the response contains tag html
      callbackDone(); // tell the unittest that callback is done
    }
    
    String url = "http://www.html5rocks.com/en/tutorials/file/xhr2/";
    Request request = new Request.openGet(url, echoOut);
    request.send();
  });
  
}
