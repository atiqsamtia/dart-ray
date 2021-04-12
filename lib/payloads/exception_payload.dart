import 'package:ray/payloads/payload.dart';

class ExceptionPayload extends Payload {
  Exception exception;

  List meta = [];

  ExceptionPayload(this.exception, this.meta);

  @override
  String getType() {
    return 'exception';
  }

  @override
  Map<String, dynamic> getContent() {
    return {
      'class': this.exception,
      'meta': this.meta,
    };
  }
}
