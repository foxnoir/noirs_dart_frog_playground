import 'package:dart_frog/dart_frog.dart';

// Postman: GET http://localhost:8080/request/headers
// Optional: Headers tab → foo: bar (shows up under request_headers)

Response onRequest(RequestContext context) {
  final headers = context.request.headers;
  return Response.json(body: {'request_headers': headers});
}
