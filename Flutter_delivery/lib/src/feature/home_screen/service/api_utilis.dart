import 'package:dio/dio.dart';

import 'custom_log_interceptor.dart';
import 'log_util.dart';

const title = "CustomLogInterceptor";
ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static final ApiUtils _apiUtils = ApiUtils._i();
  final Dio _dio = Dio();

  Options optionsWithTokenAndEncodedBody = Options(
    contentType: Headers.formUrlEncodedContentType,
    responseType: ResponseType.json,
  );
  Options optionsWithTokenOnly = Options(
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );
  Options optionWithNoToken = Options(headers: {"requiresToken": false});
  factory ApiUtils() {
    return _apiUtils;
  }
  ApiUtils._i() {
    _dio.interceptors.addAll([
      CustomLogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      )
    ]);
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool doTokenRequired = false,
    bool doFormUrlEncode = false,
  }) async {
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: picOption(options, doTokenRequired, doFormUrlEncode),
    );
    return result;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool doTokenRequired = false,
    bool doFormUrlEncode = false,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: picOption(options, doTokenRequired, doFormUrlEncode),
    );
    return result;
  }

  getFormattedError() {
    return {'error': 'Error'};
  }

  getNetworkError() {
    return "No Internet Connection.";
  }

  String handleError(dynamic error) {
    String errorDescription = "";

    Log.loga(title, "handleError:: error >> $error");

    if (error is DioError) {
      Log.loga(
          title, '************************ DioError ************************');

      DioError dioError = error;
      Log.loga(title, 'dioError:: $dioError');
      if (dioError.response != null) {
        Log.loga(title, "dioError:: response >> ${dioError.response}");
      }

      switch (dioError.type) {
        case DioErrorType.unknown:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectionTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.badResponse:
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;

        case DioErrorType.badCertificate:
          errorDescription = "Bad Certificate error";
          break;

        case DioErrorType.connectionError:
          errorDescription = "Connection error";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    Log.loga(title, "handleError:: errorDescription >> $errorDescription");
    return errorDescription;
  }

  Options picOption(options, bool doTokenRequired, bool doFormUrlEncode) {
    optionsWithTokenAndEncodedBody.headers = options?.headers;
    optionsWithTokenOnly.headers = options?.headers;
    optionWithNoToken.headers?.addAll(options?.headers ?? {});
    optionsWithTokenOnly.responseType = options?.responseType;
    return doTokenRequired
        ? doFormUrlEncode
            ? optionsWithTokenAndEncodedBody
            : optionsWithTokenOnly
        : optionWithNoToken;
  }

  Future<Response> post(
      {required String url,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool doTokenRequired = false,
      bool doFormUrlEncode = false}) async {
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: picOption(options, doTokenRequired, doFormUrlEncode),
    );
    return result;
  }

  Future<Response> postWithProgress(
      {required String url,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      ProgressCallback? onSendProgress,
      bool doTokenRequired = false,
      bool doFormUrlEncode = false}) async {
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: picOption(options, doTokenRequired, doFormUrlEncode),
      onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put(
      {required String url,
      data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      bool doTokenRequired = false,
      bool doFormUrlEncode = false}) async {
    var result = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: picOption(options, doTokenRequired, doFormUrlEncode),
    );
    return result;
  }
}
