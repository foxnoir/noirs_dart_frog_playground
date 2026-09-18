import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../routes/request/methods/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {}

class _MockRequest extends Mock implements Request {}

void main() {
  late _MockRequestContext context;
  late _MockRequest request;

  setUp(() {
    context = _MockRequestContext();
    request = _MockRequest();
    when(() => context.request).thenReturn(request);
  });

  group('GET /request/methods', () {
    test('responds with a 200 and JSON for the request method', () {
      when(() => request.method).thenReturn(HttpMethod.get);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.headers['content-type'], contains('application/json'));
      expect(
        response.body(),
        completion(equals('{"Request method": "${HttpMethod.get}"}')),
      );
    });
  });

  group('POST /request/methods', () {
    test('responds with a 201', () {
      when(() => request.method).thenReturn(HttpMethod.post);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.created));
    });
  });

  group('PUT /request/methods', () {
    test('responds with a 200 and the request method', () {
      when(() => request.method).thenReturn(HttpMethod.put);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        response.body(),
        completion(equals('Request method: ${HttpMethod.put}')),
      );
    });
  });

  group('DELETE /request/methods', () {
    test('responds with a 204', () {
      when(() => request.method).thenReturn(HttpMethod.delete);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.noContent));
    });
  });

  group('unsupported method', () {
    test('responds with a 405 and "Invalid Request"', () {
      when(() => request.method).thenReturn(HttpMethod.patch);
      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
      expect(response.body(), completion(equals('Invalid Request')));
    });
  });
}
