import 'package:flutter_api/helpers/http_response.dart';
import 'package:flutter_api/utils/logs.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Http {
  Dio? _dio;

  bool? _logsEnabled;

  Http({
    required Dio dio,
    required Logger logger,
    required bool logsEnabled,
  }) {
    _dio = dio;

    _logsEnabled = logsEnabled;
  }

  Future<HttpResponse<T>> request<T>(
    String path, {
    String method = "GET",
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? formData,
    Map<String, String>? headers,
    T Function(dynamic data)? parser,
  }) async {
    try {
      final response = await _dio!.request(
        path,
        options: Options(
          method: method,
          headers: headers,
        ),
        queryParameters: queryParameters,
        data: formData != null ? FormData.fromMap(formData) : data,
      );

      if (parser != null) {
        return HttpResponse.success<T>(parser(response.data));
      }

      return HttpResponse.success<T>(response.data);
    } catch (e) {
      Logs.p.e(e);
      int? statusCode = 0;
      String? message = 'Unknown error';
      dynamic data;
      if (e is DioException) {
        statusCode = -1;
        message = e.message;
        if (e.response != null) {
          statusCode = e.response!.statusCode;
          message = e.response!.statusMessage;
          data = e.response!.data;
        }
      }
      return HttpResponse.failure(
        statusCode: statusCode!,
        message: message!,
        data: data,
      );
    }
  }
}
