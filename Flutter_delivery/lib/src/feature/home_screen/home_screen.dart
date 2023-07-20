import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/src/feature/home_screen/controller/controller.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController dataController = Get.put(ProductController());
    return Scaffold(
        appBar: AppBar(
            actions: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.login)),
                  const Text('Log out'),
                  const SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
            backgroundColor: Colors.deepOrange,
            title: const Text('RESTAURANTS'),
            automaticallyImplyLeading: false),
        body: GetBuilder<ProductController>(
          builder: (_) {
            return _.loading == true
                ? const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : ListView.builder(
                    itemCount: dataController.statusList.value!.length,
                    itemBuilder: (BuildContext, index) {
                      return ListTile(
                        leading: Text(dataController
                            .statusList.value![index].items![index].name
                            .toString()),
                      );
                    },
                  );
          },
        ));
  }
}
