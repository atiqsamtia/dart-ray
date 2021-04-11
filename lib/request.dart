import 'dart:convert';

import 'package:ray/payloads/payload.dart';

class Request {
  String uuid;
  List<Payload> payloads;
  List meta = [];

  Request(this.uuid, this.payloads, {this.meta});

  Map<String, dynamic> toArray() {
    List<Map<String, dynamic>> _payloads = this.payloads.map((e) => e.toArray()).toList();

    return {'uuid': this.uuid, 'payloads': _payloads, 'meta': this.meta};
  }

  String toJson() {
    return jsonEncode(this.toArray());
  }
}
