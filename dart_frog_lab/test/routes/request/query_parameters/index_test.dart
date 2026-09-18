import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../routes/request/query_parameters/index.dart' as route;

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

  group('GET /request/query_parameters', () {
    test('responds with a 200 and the query parameters as JSON', () async {
      when(() => request.uri).thenReturn(
        Uri.parse(
          'http://localhost/request/query_parameters?name=ada&limit=10',
        ),
      );

      final response = route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.headers['content-type'], contains('application/json'));
      expect(
        jsonDecode(await response.body()),
        equals({
          'queryParameters': {'name': 'ada', 'limit': '10'},
        }),
      );
    });
  });
}
