import 'package:ray/payloads/payload.dart';

class NewScreenPayload extends Payload {
  String name;

  NewScreenPayload(this.name);

  @override
  String getType() {
    return 'new screen';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'name': this.name,
    };
  }
}
