import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

// Postman (http://localhost:8080/request/methods):
// GET    → 200 JSON {"Request method": "HttpMethod.get"}
// POST   → 201 Created
// PUT    → 200 text Request method: HttpMethod.put
// DELETE → 204 No Content
// PATCH  → 405 Invalid Request

Response onRequest(RequestContext context) {
  return switch (context.request.method) {
    HttpMethod.get => _handleGet(context),
    HttpMethod.post => _handlePost(context),
    HttpMethod.put => _handlePut(context),
    HttpMethod.delete => _handleDelete(context),
    _ => Response(
      statusCode: HttpStatus.methodNotAllowed,
      body: 'Invalid Request',
    ),
  };
}

Response _handleGet(RequestContext context) {
  return Response(
    headers: {'Content-Type': 'application/json'},
    body: '{"Request method": "${context.request.method}"}',
  );
}

Response _handlePost(RequestContext context) {
  return Response(statusCode: HttpStatus.created);
}

Response _handlePut(RequestContext context) {
  return Response(body: 'Request method: ${context.request.method}');
}

Response _handleDelete(RequestContext context) {
  return Response(statusCode: HttpStatus.noContent);
}
