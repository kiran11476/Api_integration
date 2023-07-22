import 'package:dartz/dartz.dart';
import '../../../model/model.dart';
import 'api_params.dart';
import 'base_model.dart';
import 'base_repo.dart';

class ApiServices {
  Future<Either<dynamic, List<RestaurantModel>>> fetchData() async {
    return BaseRepo().get().then((value) {
      try {
        if (value != null) {
          BaseModel response = BaseModel.fromMap(value);
          if (value == null) {
            return left({
              paramStatusCode: response.status,
              paramMessage: response.message
            });
          }
          List<RestaurantModel> data = List<RestaurantModel>.from(
              (response.model).map((e) => RestaurantModel.fromMap(e)));
          return right(data);
        }
      } catch (_) {
        return left(value);
      }
      throw UnimplementedError();
    });
  }
}
