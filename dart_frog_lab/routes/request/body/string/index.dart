import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

// Postman (http://localhost:8080/request/body/string):
// POST Body tab → raw → Text → hello  → 200 bodyType: String, content: hello
// GET / PATCH → 405

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  switch (method) {
    case HttpMethod.post:
      final body = await context.request.body();
      return Response(
        body: 'bodyType: ${body.runtimeType}, content: $body',
      );
    case _:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
