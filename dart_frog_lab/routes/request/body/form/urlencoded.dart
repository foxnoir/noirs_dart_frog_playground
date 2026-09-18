import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

// Postman: POST http://localhost:8080/request/body/form/urlencoded
// Body → x-www-form-urlencoded (not form-data, not raw JSON):
//   prize = gold
//   candidate = ada
// GET / PATCH → 405

Future<Response> onRequest(RequestContext context) async {
  final method = context.request.method;

  switch (method) {
    case HttpMethod.post:
      final formData = await context.request.formData();
      return Response.json(
        body: {
          'formData type': '${formData.runtimeType}',
          'formData.fields': formData.fields,
          'formData.fields type': '${formData.fields.runtimeType}',
          'formData.files': formData.files,
          'formData.files type': '${formData.files.runtimeType}',
        },
      );
    case _:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}
