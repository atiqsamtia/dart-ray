import 'package:ray/payloads/payload.dart';

class ColorPayload extends Payload {
  var color;

  ColorPayload(this.color);

  @override
  String getType() {
    return 'color';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'color': this.color,
    };
  }
}
