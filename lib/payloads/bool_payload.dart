import 'package:ray/payloads/payload.dart';

class BoolPayload extends Payload {
  bool value;

  BoolPayload(this.value);

  @override
  String getType() {
    return 'custom';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'content': this.value,
      'label': 'Boolean',
    };
  }
}
