import 'package:ray/payloads/payload.dart';

class LogPayload extends Payload {
  String values;

  LogPayload(this.values);

  @override
  String getType() {
    return 'log';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'values': [this.values],
    };
  }
}
