import 'package:dart_frog/dart_frog.dart';

// Postman: GET http://localhost:8080/

Response onRequest(RequestContext context) {
  return Response(body: 'Welcome to Dart Frog!');
}
