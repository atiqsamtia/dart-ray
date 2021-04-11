import 'dart:convert';

abstract class Payload {
  String getType();

  String remotePath = null;
  String $localPath = null;

  Map<String, dynamic> getContent() {
    return {};
  }

  Map<String, dynamic> toArray() {
    return {
      'type': this.getType(),
      'content': this.getContent(),
      'origin': {'file': '', 'line_number': 1, 'hostname': 'localhost'}
    };
  }

  String toJson() {
    return jsonEncode(this.toArray());
  }
}
