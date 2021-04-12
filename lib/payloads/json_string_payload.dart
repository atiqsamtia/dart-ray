import 'package:ray/payloads/payload.dart';

class JsonStringPayload extends Payload {
  var value;

  JsonStringPayload(this.value);

  @override
  String getType() {
    return 'json_string';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'value': this.value,
    };
  }
}
