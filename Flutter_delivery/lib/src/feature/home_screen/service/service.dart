// import 'package:either_dart/either.dart';

// class BusinessSnapshotServices {
//   Future<Either<dynamic, BusinessSnapshotModel>> businessSnapshotServices(
//       {required int id, required String dateFrom, required String dateTo}) {
//     return BaseRepo()
//         .post(
//             doTokenRequired: true,
//             doFormUrlEncode: false,
//             options: Options(),
//             apiURL: ApiEndPoints.businessSnapshot,
//             data: BusinessSnapshotModel(
//                     serviceId: id, dateFrom: dateFrom, dateTo: dateTo)
//                 .toJson())
//         .then((value) {
//       try {
//         if (value != null) {
//           BaseModel response = BaseModel.fromMap(value);
//           if (response.status != codeSuccess) {
//             return left({
//               paramStatusCode: response.status,
//               paramMessage: response.message
//             });
//           }
//           return right(BusinessSnapshotModel.fromMap(response.model));
//         }
//       } catch (_) {
//         return left(value);
//       }
//       throw UnimplementedError();
//     });
//   }
// }
