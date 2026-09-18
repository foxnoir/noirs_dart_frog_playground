import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../routes/request/body/string/index.dart' as route;

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

  group('POST /request/body/string', () {
    test('responds with a 200 and the body runtime type', () async {
      when(() => request.method).thenReturn(HttpMethod.post);
      when(() => request.body()).thenAnswer((_) async => 'hello');

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(
        response.body(),
        completion(equals('bodyType: String, content: hello')),
      );
    });
  });

  group('GET /request/body/string', () {
    test('responds with a 405', () async {
      when(() => request.method).thenReturn(HttpMethod.get);

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });
  });
}
