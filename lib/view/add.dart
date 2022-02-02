import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx/controller/controller.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JokeController>(
      builder: (controller)=> Scaffold(
        appBar: AppBar(title: Text('Add'),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Center(child: IconButton(onPressed: (){
  //controller.postdata();
}, icon: Icon(Icons.add)))
        ],),
      ),
    );
  }
}
