import 'package:dart_frog/dart_frog.dart';

// Postman: GET http://localhost:8080/request/query_parameters?name=ada&limit=10
// Or Params tab → name=ada, limit=10

Response onRequest(RequestContext context) {
  final queryParameters = context.request.uri.queryParameters;
  return Response.json(body: {'queryParameters': queryParameters});
}
