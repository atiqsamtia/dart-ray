import 'package:http/http.dart' as http;
import 'package:ray/request.dart';

class Client {
  static Map<String, List> cache = {};
  int portNumber;
  String host;
  String fingerprint;
  RayClient _http = RayClient();

  Client({this.portNumber = 23517, this.host = 'localhost'}) {
    fingerprint = '$host:$portNumber';
  }

  Future<bool> serverIsAvailable() async {
//    TODO Purge expired cache

    if (!cache.containsKey(fingerprint)) {
      await this.performAvailabilityCheck();
    }

    return cache[fingerprint][0] ?? true;
  }

  Future<bool> performAvailabilityCheck() async {
    bool success = false;
    try {
      var response = await _http.get(getUrl('_availability_check'));
      success = response.statusCode == 404;
//      Expires after 30 seconds
      cache[fingerprint] = [success, DateTime.now().millisecondsSinceEpoch + 30];
    } finally {
      return success;
    }
  }

  Future<void> send(Request request) async {
    bool isAvailable = await serverIsAvailable();
    if (!isAvailable) {
      print('server not available');
      return;
    }

    try {
      await _http.post(getUrl(''), body: request.toJson());
    } catch (e) {
      print(e);
    }
  }

  String getUrl(String path) {
    return 'http://$host:$portNumber/$path';
  }
}

class RayClient extends http.BaseClient {
  final http.Client _client = http.Client();

  RayClient();

  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['user-agent'] = 'Ray';
    request.headers['Accept'] = 'application/json';
    request.headers['Content-Type'] = 'application/json';
    return _client.send(request);
  }
}
