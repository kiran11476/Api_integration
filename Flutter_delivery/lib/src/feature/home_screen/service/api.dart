import 'package:dartz/dartz.dart';
import '../../../model/model.dart';
import 'api_params.dart';
import 'base_model.dart';
import 'base_repo.dart';

class ApiServices {
  Future<Either<dynamic, RestaurantModel>> fetchData() async {
    return BaseRepo().get().then((value) {
      try {
        if (value != null) {
          BaseModel response = BaseModel.fromMap(value);
          if (response.status != codeSuccess) {
            return left({
              paramStatusCode: response.status,
              paramMessage: response.message
            });
          }

          return right(RestaurantModel.fromJson(response.model));
        }
      } catch (_) {
        return left(value);
      }
      throw UnimplementedError();
    });
  }
}
