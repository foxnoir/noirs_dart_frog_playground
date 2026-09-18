import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../../../../routes/request/body/form/urlencoded.dart' as route;

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

  group('POST /request/body/form/urlencoded', () {
    test('responds with a 200 and the form fields', () async {
      const formData = FormData(
        fields: {'prize': 'gold', 'candidate': 'ada'},
        files: {},
      );
      when(() => request.method).thenReturn(HttpMethod.post);
      when(() => request.formData()).thenAnswer((_) async => formData);

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.ok));
      expect(response.headers['content-type'], contains('application/json'));

      final json = jsonDecode(await response.body()) as Map<String, dynamic>;
      expect(json['formData.fields'], equals(formData.fields));
      expect(json['formData.files'], equals(<String, dynamic>{}));
    });
  });

  group('GET /request/body/form/urlencoded', () {
    test('responds with a 405', () async {
      when(() => request.method).thenReturn(HttpMethod.get);

      final response = await route.onRequest(context);
      expect(response.statusCode, equals(HttpStatus.methodNotAllowed));
    });
  });
}
