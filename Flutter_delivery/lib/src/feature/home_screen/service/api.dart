import 'package:dartz/dartz.dart';

import '../../../model/model.dart';
import 'api_params.dart';
import 'base_model.dart';
import 'base_repo.dart';

class ApiServices {
  Future<Either<dynamic, List<RestaurantModel>>> fetchData() async {
    return BaseRepo()
        .get(
      apiURL: 'https://run.mocky.io/v3/b91498e7-c7fd-48bc-b16a-5cb970a3af8a',
      doTokenRequired: true,
      doFormUrlEncode: false,
    )
        .then((value) {
      try {
        if (value != null) {
          BaseModel response = BaseModel.fromMap(value);
          if (response.status != codeSuccess) {
            return left({
              paramStatusCode: response.status,
              paramMessage: response.message
            });
          }
          List<RestaurantModel> services = List<RestaurantModel>.from(
              (response.model).map((e) => RestaurantModel.fromJson(e)));
          return right(services);
        }
      } catch (_) {
        return left(value);
      }
      throw UnimplementedError();
    });
  }
}
