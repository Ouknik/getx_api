import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx/model/joke.dart';
import 'package:getx/model/joke_repository.dart';

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
}
