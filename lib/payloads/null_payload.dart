import 'package:ray/payloads/payload.dart';

class NullPayload extends Payload {
  NullPayload();

  @override
  String getType() {
    return 'custom';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'content': null,
      'label': 'Null',
    };
  }
}
