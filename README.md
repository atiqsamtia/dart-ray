# ray

Dart implementation of ray client for debugging dart apps faster on the fly.

## Installation
Add this package to your `pubspec.yaml` in `dependencies:` section
```yaml
dependencies: 
  ray: ^0.0.1
```
Update dependencies 
```
flutter pub get
```
Now in your `Dart` code, you can use: 
````dart
import 'package:ray/ray.dart';
````
Initialize `Ray` with your config
```dart
main(){
    Ray.init(
      enabled: true,
      host: '192.168.50.45'
    );
}
```
`host` is your development machine's IP where Ray App is running

## Usage

use `ray()` helper to send values
```dart
ray('Hello from Flutter');

ray('This is green message').green();

ray().notify('Notification content here');

ray().clearAll();

ray().newScreen();

ray().newScreen('Screen');

ray().showApp();

ray().hideApp();

```

## Meta

Atiq Samtia– [@AtiqSamtia](https://twitter.com/atiqsamtia) – hi@atiq.dev

Distributed under the MIT license.

[https://github.com/atiqsamtia/dart-ray](https://github.com/atiqsamtia/dart-ray)


## Contributing

1. Fork it (<https://github.com/atiqsamtia/dart-ray/fork>)
2. Clone it ( `git clone https://github.com/YOUR_GITHUB_USERNAME/dart-ray.git`)
3. Create your feature branch (`git checkout -b feature/fooBar`)
4. Commit your changes (`git commit -am 'Add some fooBar'`)
5. Push to the branch (`git push origin feature/fooBar`)
6. Create a new Pull Request