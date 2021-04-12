import 'package:ray/ray.dart';

Ray ray([dynamic data = null]) {
  return Ray()..send(data);
}
