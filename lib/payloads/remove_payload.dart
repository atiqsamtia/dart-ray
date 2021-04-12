import 'package:ray/payloads/payload.dart';

class RemovePayload extends Payload {
  @override
  String getType() {
    return "remove";
  }
}
