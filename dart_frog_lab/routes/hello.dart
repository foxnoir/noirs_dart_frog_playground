import 'package:dart_frog/dart_frog.dart';

// Postman: GET http://localhost:8080/hello

Response onRequest(RequestContext context) {
  // TODO: implement route handler
  return Response(body: 'Hello');
}
