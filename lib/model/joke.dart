// To parse this JSON data, do
//
//     final joke = jokeFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'joke.g.dart';
List<Joke> jokeFromJson(String str) =>
    List<Joke>.from(json.decode(str).map((x) => Joke.fromJson(x)));

String jokeToJson(List<Joke> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


@HiveType(typeId: 1)
class Joke {
  Joke({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @HiveField(0)
  int userId;

  @HiveField(1)
  int id;
  @HiveField(2)
  String title;

  @HiveField(3)
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
