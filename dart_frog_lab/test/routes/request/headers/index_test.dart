import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../routes/request/headers/index.dart' as route;

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

  group('GET /request/headers', () {
    test('responds with a 200 and the request headers as JSON', () async {
      const headers = {'user-agent': 'dart-test'};
      when(() => request.headers).thenReturn(headers);

      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.headers['content-type'], contains('application/json'));
      expect(
        jsonDecode(await response.body()),
        equals({'request_headers': headers}),
      );
    });
  });
}
