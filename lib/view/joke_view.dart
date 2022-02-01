import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controller.dart';
import 'package:getx/view/add.dart';

import 'joke_details.dart';

class JokesView extends StatelessWidget {
  final controller = Get.put(JokeController());
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(JokeController());
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed:()=>Get.to(Add() , ), icon: Icon(Icons.add),)
          ],
        ),
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
                            trailing:  IconButton(
                                onPressed: ()=>Get.to(JokeDetailsView(data: controller.allJokes[i],)),
                                icon:Icon(Icons.arrow_forward)),
                            title: Text(
                              controller.allJokes[i].title,
                              style: const TextStyle(color: Colors.black),
                            ),
                            onTap: () {

                            },
                          )),
                    );
                  });
            }
          },
        ));
  }
}
