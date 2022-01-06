import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';

import 'joke_details.dart';

class JokesView extends StatelessWidget {
  final controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(JokeController());
    return Scaffold(
        appBar: AppBar(),
        body: GetX<JokeController>(
          builder: (controller) {
            if (controller.isLoding.value == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: controller.allJokes.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 5,
                      child: Container(
                          color: Colors.amber,
                          child: ListTile(
                            leading: const Icon(Icons.agriculture),
                            trailing: const Icon(Icons.arrow_forward),
                            title: Text(
                              controller.allJokes[i].title,
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {
                              Get.to(JokeDetailsView(), arguments: [
                                controller.allJokes[i].id,
                                controller.allJokes[i].title,
                                controller.allJokes[i].body
                              ]);
                            },
                          )),
                    );
                  });
            }
          },
        ));
  }
}
