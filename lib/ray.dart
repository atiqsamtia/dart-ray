library ray;

import 'package:ray/payload_factory.dart';
import 'package:ray/payloads/clear_all_payload.dart';
import 'package:ray/payloads/color_payload.dart';
import 'package:ray/payloads/hide_app_payload.dart';
import 'package:ray/payloads/hide_payload.dart';
import 'package:ray/payloads/json_string_payload.dart';
import 'package:ray/payloads/new_screen_payload.dart';
import 'package:ray/payloads/notify_payload.dart';
import 'package:ray/payloads/remove_payload.dart';
import 'package:ray/payloads/show_app_payload.dart';
import 'package:ray/request.dart';
import 'package:uuid/uuid.dart';

import 'client.dart';

export 'package:ray/concerns/ray_colors.dart';

export 'helpers.dart';

class Ray {
  static Client client;

  String uuid;

  static bool enabled;
  static bool settingsEnabled;
  static String host;
  static int port;

  Ray() {
    client = Client(host: host, portNumber: port);
    uuid = Uuid().v1();
    enabled = enabled ?? settingsEnabled ?? true;
  }

  static void init({bool enabled, String host = 'localhost', int port = 23517}) {
    Ray.settingsEnabled = enabled;
    Ray.host = host;
    Ray.port = port;
  }

  Ray notify(String text) {
    print('in notify');
    var payload = NotifyPayload(text);
    return this.sendRequest([payload]);
  }

  Ray newScreen([String name = '']) {
    var payload = NewScreenPayload(name);
    return this.sendRequest([payload]);
  }

  Ray showApp() {
    var payload = ShowAppPayload();
    return this.sendRequest([payload]);
  }

  Ray hideApp() {
    var payload = HideAppPayLoad();
    return this.sendRequest([payload]);
  }

  Ray hide() {
    var payload = HidePayload();
    return this.sendRequest([payload]);
  }

  Ray remove() {
    var payload = RemovePayload();
    return this.sendRequest([payload]);
  }

  Ray color(String color) {
    var payload = ColorPayload(color);

    return this.sendRequest([payload]);
  }

  Ray toJson(var value) {
    var payload = JsonStringPayload(value);

    return this.sendRequest([payload]);
  }

  Ray clearAll() {
    var payload = new ClearAllPayload();

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
    if (!enabled) {
      return this;
    }
    var request = Request(this.uuid, payloads);
    client.send(request);
    return this;
  }
}
