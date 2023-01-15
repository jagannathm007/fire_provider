import 'dart:convert';

Response? responseFromJson(String str) => Response.fromJson(json.decode(str));
String responseToJson(Response? data) => json.encode(data!.toJson());

class Response {
  Response({
    required this.type,
    required this.message,
    this.data
  });

  String type;
  String message;
  dynamic data;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    type: json["type"],
    message: json["message"],
    data: json["data"]
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": data
  };
}
