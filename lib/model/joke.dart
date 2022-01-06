// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

List<Joke> jokeFromJson(String str) =>
    List<Joke>.from(json.decode(str).map((x) => Joke.fromJson(x)));

String jokeToJson(List<Joke> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Joke {
  Joke({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Joke.fromJson(Map<String, dynamic> json) => Joke(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
