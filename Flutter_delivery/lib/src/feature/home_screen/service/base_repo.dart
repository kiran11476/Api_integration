import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_application_delivery/src/feature/home_screen/service/api_params.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import 'api_utilis.dart';

class BaseRepo<T> {
  Future<T> get({
    required String apiURL,
    String? baseUri,
    Map<String, dynamic>? queryParameters,
    bool doTokenRequired = false,
    bool doFormUrlEncode = false,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return {
        paramStatusCode: codeNoInternet,
      } as T;
    }

    try {
      Response response;
      response = (await apiUtils.get(
        url: baseUri!,
      )) as Response;

      return response.body;
    } catch (e) {
      return {
        paramStatusCode: codeError,
        paramMessage: apiUtils.handleError(e),
      } as T;
    }
  }
}
