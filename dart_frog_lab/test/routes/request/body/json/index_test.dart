import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../routes/request/body/json/index.dart' as route;

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

  group('POST /request/body/json', () {
    test('responds with a 200 and the decoded JSON body', () async {
      const content = {
        'prize': 'gold',
        'candidates': ['ada', 'noir'],
      };
      when(() => request.method).thenReturn(HttpMethod.post);
      when(() => request.json()).thenAnswer((_) async => content);

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.headers['content-type'], contains('application/json'));

      final json = jsonDecode(await response.body()) as Map<String, dynamic>;
      expect(json['bodyType'], isA<String>());
      expect(json['content'], equals(content));
    });
  });

  group('GET /request/body/json', () {
    test('responds with a 405', () async {
      when(() => request.method).thenReturn(HttpMethod.get);

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });
  });
}
