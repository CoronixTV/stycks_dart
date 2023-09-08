<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->


## Our Super Glue for everything
Stycks is a protocol to allow data transmission between various languages and frameworks. A string of encoded Stycks data can be sent over any transport protocol and decoded by any Stycks implementation. Stycks is designed to be simple, fast and easy to implement. It supports the following data types: `String`, `Int`, `Double/Float`, `Bool`, `List`,

## Getting started
Currently there is no straight forward way of handeling this package as we do not have a pub.dev package yet. You can however still use the package by managing it independently.
## Usage
This is a simple usage example:
```dart
  var name = asStycksString("Stycks");
  var age = asStycksInt(18);
  var height = asStycksFloat(1.8);
  StycksEncode data = StycksEncode();
  data.stStringAppend("name", name);
  data.stIntAppend("age", age);
  data.stFloatAppend("height", height);
  var decode = StycksDecode(data.stEncode());
  var name2 = decode.getEntry("name").nativeString;
  var age2 = decode.getEntry("age").nativeInt;
  var height2 = decode.getEntry("height").nativeFloat;
  print(name2);
  print(age2);
  print(height2);
```
It shows the use of the Stycks protocol to encode multiple primitive data types into a single string and decode it again. The output of this example is, as expected:
```
Stycks
18
1.8
```
## Additional information

NOTE: This software is an internal project may not recieve frequent updates or bug fixes. It is not recommended to use this package in production environments. If you have any questions or suggestions, feel free to open an issue or contact us directly.
