import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/src/feature/home_screen/controller/controller.dart';

import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Obx(() => ListView.builder(
            itemCount: dataController.statusList.value!.length,
            itemBuilder: (BuildContext, index) {
              return ListTile(
                leading: Text(dataController
                            .statusList.value![index].items![index].name !=
                        null
                    ? dataController
                        .statusList.value![index].items![index].name!
                    : ''),
              );
            },
          )),
    );
  }
}
