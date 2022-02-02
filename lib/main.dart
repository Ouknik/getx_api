import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/view/joke_view.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';



late Box box; 
Future<void> main() async {
 ///final documentDirectory = await getApplicationDocumentsDirectory();
   // Hive.init(documentDirectory.path);
//await Hive.openBox('db');

    await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: JokesView(),
    );
  }
}
