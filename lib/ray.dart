library ray;

import 'package:ray/payload_factory.dart';
import 'package:ray/payloads/notify_payload.dart';
import 'package:ray/request.dart';
import 'package:uuid/uuid.dart';

import 'client.dart';

export 'helpers.dart';

class Ray {
  static Client client;

  String uuid;

  static bool enabled;

  Ray() {
//    TODO Settings
    client = Client(host: '192.168.50.45');
    uuid = Uuid().v1();
    enabled = true;
  }

  Ray notify(String text) {
    print('in notify');
    var payload = NotifyPayload(text);
    return this.sendRequest([payload]);
  }

  Ray send([dynamic data = null]) {
    if (data == null) {
      return this;
    }
    var payload = PayloadFactory.createForvalue(data);
    return this.sendRequest([payload]);
  }

  Ray sendRequest(payloads, {meta = const {}}) {
    var request = Request(this.uuid, payloads);
    client.send(request);
    return this;
  }
}
