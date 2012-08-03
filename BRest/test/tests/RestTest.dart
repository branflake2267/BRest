#library('RestTests');

#import('/Users/branflake2267/workspace-sdk/dart-sdk/lib/unittest/unittest.dart');
#import('../../rest/RestRequest.dart');

void runRestTests() {
  runGetTest();
  runGetFailedTest();
  runPutTest();
  runPostTest();
  runDeleteTest();
}

void runGetTest() {
  asyncTest('Test Get', 1, () {
    echoOut(String s) {
      print(s);
      expect(s, matches(new RegExp('GET')));
      callbackDone(); 
    }
    
    String url = "http://127.0.0.1:8080?id=1";
    RestRequest request = new RestRequest.openGet(url, echoOut);
    request.send();
  });
}

void runGetFailedTest() {
  asyncTest('Test Simple Get Request Failure', 1, () {
    onFail(String s) {
      print(s);
      Expect.isTrue(true);
      callbackDone(); 
    }
    
    echoOut(String s) {
      print(s);
      callbackDone();
    }
    
    String url = "http://dartexamples.appspot.com/nowhere";
    RestRequest request = new RestRequest.openGet(url, echoOut, onFail);
    request.send();
  });
}

void runPutTest() {
  asyncTest('Test Put', 1, () {
    echoOut(String s) {
      print(s);
      expect(s, matches(new RegExp('PUT')));
      callbackDone();
    }
    
    String url = "http://127.0.0.1:8080?id=1";
    RestRequest request = new RestRequest.openPut(url, echoOut, echoOut);
    request.send();
  });
}

void runPostTest() {
  asyncTest('Test Put Test', 1, () {
    echoOut(String s) {
      print(s);
      expect(s, matches(new RegExp('POST')));
      callbackDone();
    }
    
    String url = "http://127.0.0.1:8080?id=1";
    RestRequest request = new RestRequest.openPost(url, echoOut, echoOut);
    request.send();
  });
}

void runDeleteTest() {
  asyncTest('Test Put Test', 1, () {
    echoOut(String s) {
      print(s);
      expect(s, matches(new RegExp('DELETE')));
      callbackDone();
    }
    
    String url = "http://127.0.0.1:8080?id=1";
    RestRequest request = new RestRequest.openDelete(url, echoOut, echoOut);
    request.send();
  });
}

