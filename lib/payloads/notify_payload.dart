import 'package:ray/payloads/payload.dart';

class NotifyPayload extends Payload {
  String text;

  NotifyPayload(this.text);

  @override
  String getType() {
    return 'notify';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'value': this.text,
    };
  }
}
