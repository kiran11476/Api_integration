import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_delivery/src/feature/home_screen/service/api_params.dart';

import 'api_utilis.dart';

class BaseRepo<T> {
  final Dio _dio = Dio();
  Future<T> get() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return {
        paramStatusCode: codeNoInternet,
      } as T;
    }

    try {
      var result = await _dio.get(
        'https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a',
      );
      return result.data;
      // Response response;
      // response = await apiUtils.get(
      //   url: 'https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a',
      // ) as Response;

      // return response.body;
    } catch (e) {
      return {
        paramStatusCode: codeError,
        paramMessage: apiUtils.handleError(e),
      } as T;
    }
  }
}
