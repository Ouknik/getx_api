import 'package:getx/model/joke.dart';
import 'package:http/http.dart' as http;

class jokeRepository {
  static var client = http.Client();

  static Future<List<Joke>?> featcherJoke() async {
    var res = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var json = res.body;
    if (res.statusCode == 200) {
      return jokeFromJson(json);
    } else {
      return null;
    }
  }


  }

