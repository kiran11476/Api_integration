import 'package:dartz/dartz.dart';
import 'package:flutter_application_delivery/src/model/model.dart';
import 'package:get/get.dart';

import '../service/api.dart';

class ProductController extends GetxController {
  final loading = false.obs;
  final statusList = Rxn<List<RestaurantModel>>();

  fetchStatus() async {
    loading.value = true;
    await Task(
      (() => ApiServices().fetchData()),
    ).run().then((value) {
      loading.value = false;
      value.fold((l) => null, (r) => statusList.value = r);
    });
  }

  @override
  void onReady() {
    fetchStatus();
    super.onReady();
  }

  @override
  void onInit() {
    fetchStatus();
    super.onInit();
  }
}
  // Future getRestaurantDataHandler() async {
  //   final jsonData = await ApiServices.fetchData();
  //   if (jsonData != null) {
  //     jsonData.;
  //     loading = false;
  //     update();
  //     log(restaurantData.toString());
  //   }
  // }
 
  // var isloading = true.obs;

  // final productList = <Restaurant>[].obs;
  // final _apiService = AuthServices();

  // Future<void> fetchUsers() async {
  //   try {
  //     final response = await _apiService.get();
  //     final List<dynamic> responseData = response.data;

  //     print(responseData);

  //     final List<Restaurant> userList =
  //         responseData.map((json) => Restaurant.fromJson(json)).toList();
  //     print(userList);

  //     productList.value = userList;
  //   } catch (e) {
  //     // Handle error
  //     print('Error fetching users: $e');
  //   }
  // }

  // @override
  // void onInit() {
  //   fetchUsers();
  //   super.onInit();
  // }