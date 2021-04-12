import 'package:ray/payloads/payload.dart';

class HideAppPayLoad extends Payload {
  @override
  String getType() {
    return 'hide_app';
  }
}
