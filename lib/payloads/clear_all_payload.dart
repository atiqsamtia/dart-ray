import 'package:ray/payloads/payload.dart';

class ClearAllPayload extends Payload {
  @override
  String getType() {
    return "clear_all";
  }
}
