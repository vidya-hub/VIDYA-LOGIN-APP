// To parse this JSON data, do
//
//     final imgjson = imgjsonFromJson(jsonString);

import 'dart:convert';

List<Imgjson> imgjsonFromJson(String str) => List<Imgjson>.from(json.decode(str).map((x) => Imgjson.fromJson(x)));

String imgjsonToJson(List<Imgjson> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Imgjson {
    Imgjson({
        this.id,
        this.author,
        this.width,
        this.height,
        this.url,
        this.downloadUrl,
    });

    String id;
    String author;
    int width;
    int height;
    String url;
    String downloadUrl;

    factory Imgjson.fromJson(Map<String, dynamic> json) => Imgjson(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
