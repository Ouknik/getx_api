import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:getx/model/joke.dart';
import 'package:getx/model/joke_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

    

class JokeController extends GetxController {
  var allJokes = [].obs;
  var todos = [].obs;
  var done = [].obs;
  var remaining = [].obs;
  var isLoding = true.obs;
  var isError = false.obs;
  onInit() {

    try {
      Hive.registerAdapter(JokeAdapter());
    } catch (e) {
      print(e);
    }
    getJokeys();
    ever(isError, (value) {
 if (value == isError(true)) {
    getTodos();
 //   Get.snackbar("problem", "issues in your internet conection",
 //       backgroundColor: Colors.black, colorText: Colors.white);
 }
});
    super.onInit();
  }
getJokeys() async {
  try {
    isLoding(false);
    var jokes = await jokeRepository.featcherJoke();
    if (jokes != null) {
      allJokes.value = jokes;
    for(int i=0;i<allJokes.length;i++){
      addTodo(allJokes[i]); 
    }
    getTodos();
     
    }
  } catch (e) {
    isError(true);
  } finally {
    isLoding(false);
  }
}
  addTodo(Joke todo) async {
    todos.add(todo);
    var box = await Hive.openBox('db');
    box.put('todos', todos.toList());
    print("To Do Object added $todos");
  }

  Future getTodos() async {
    Box box;
      box = await Hive.openBox('db');
    try {  box = await Hive.openBox('db');
      box = Hive.box('db');
    } catch (error) {
      box = await Hive.openBox('db');
      print(error);
    }  box = await Hive.openBox('db');
    var tds = box.get('todos');
    print("TODOS $tds");
    if (tds != null) todos.value = tds;
    for (Joke todo in todos) {
        remaining.add(todo);
    }
  }

}

/*
class JokeController extends GetxController {
  var allJoke = <Joke>[].obs;
  var allJokes = [].obs;
 var remaining = [].obs;
  var isLoding = true.obs;
  var isError = false.obs;
  // var repo = jokeRepository();

  @override
  void onInit() {
    try {
      Hive.registerAdapter(JokeAdapter());
    } catch (e) {
      print('eeerroorree :  '+ e.toString());
    }
    getJokeys();
    ever(isError, (value) {
      if (value == isError(true)) {
        Get.snackbar("problem", "issues in your internet conection",
            backgroundColor: Colors.black, colorText: Colors.white);
      }
    });
    super.onInit();
  }

  addTodo(Joke todo) async {
    
    allJokes.add(todo);
    var box = await Hive.openBox('db');
    box.put('todos', allJokes.toList());
    
  }




Future getTodos() async {
    Box box;
    print("Getting todos");
    try {
      box = await Hive.box('db');
    } catch (error) {
      
        print("zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");

      print(error);
    }
box = await Hive.openBox('db');
    var tds = box.get('todos');
    print("TODOS $tds");
    if (tds != null) allJokes.value = tds;
    for (Joke todo in allJokes) {
      
        remaining.add(todo);
      
      
    }
  }











  getJokeys() async {
    try {
      isLoding(false);
      var jokes = await jokeRepository.featcherJoke();
      if (jokes != null) {
        allJoke.value = jokes;
      for(int i=0;i<allJoke.length;i++){
        addTodo(allJoke[i]); 
      }
      getTodos();
       
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

              "userId": '10',

              "title": "aaaaaaaaaaaaaaaaa",
              "body": "bbbbbbbbbbbbbbbbbbbbbbbb",


          }

      );
          print(response.body);

    }catch(e){
      print('error'+ e.toString());
    }
  }
}
*/