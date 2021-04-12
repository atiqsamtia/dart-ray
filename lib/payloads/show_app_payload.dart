import 'package:ray/payloads/payload.dart';

class ShowAppPayload extends Payload {
  @override
  String getType() {
    return "show_app";
  }
}
