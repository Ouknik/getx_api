import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx/model/joke.dart';
import 'package:getx/model/joke_repository.dart';
import 'package:http/http.dart' as http;
class JokeController extends GetxController {
  var allJokes = <Joke>[].obs;
  var isLoding = true.obs;
  var isError = false.obs;
  // var repo = jokeRepository();

  @override
  void onInit() {
    getJokeys();
    ever(isError, (value) {
      if (value == isError(true)) {
        Get.snackbar("problem", "issues in your internet conection",
            backgroundColor: Colors.black, colorText: Colors.white);
      }
    });
    super.onInit();
  }

  getJokeys() async {
    try {
      isLoding(true);

      var jokes = await jokeRepository.featcherJoke();
      if (jokes != null) {
        allJokes.value = jokes;
      }
    } catch (e) {
      isError(true);
    } finally {
      isLoding(false);
    }
  }

  postdata()async{
    try {


      var response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
          body: {
            json.encode({
              "userId": 10,
              "id": 100,
              "title": "aaaaaaaaaaaaaaaaa",
              "body": "bbbbbbbbbbbbbbbbbbbbbbbb",
            })

          }

      );

    }catch(e){
      print('error'+ e.toString());
    }
  }
}
