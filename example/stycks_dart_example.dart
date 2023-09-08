import 'package:stycks_dart/stycks_dart.dart';

void main() {
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
}
