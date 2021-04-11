import 'package:ray/payloads/bool_payload.dart';
import 'package:ray/payloads/log_payload.dart';
import 'package:ray/payloads/null_payload.dart';

import 'payloads/payload.dart';

class PayloadFactory {
  static Payload createForvalue(dynamic data) {
    return PayloadFactory().getPayload(data);
  }

  Payload getPayload(dynamic data) {
    if (data == null) {
      return NullPayload();
    }
    if (data is bool) {
      return BoolPayload(data);
    }
    return LogPayload(data.toString());
  }
}
