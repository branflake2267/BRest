#import('/Users/branflake2267/workspace-sdk/dart-sdk/lib/unittest/unittest.dart');
#import('../../rest/Request.dart');

// TODO how to test html methods
void main() {
  String url = "http://google.com";
  Request request = new Request.openGet(url, (e) => test);
  request.send();
  
  
}

void test(String s) {
  print(s);
}
