// TODO: Put public facing types in this file.

/// Checks if you are awesome. Spoiler: you are.
void main(List<String> arguments) {
  var data = StycksEncode();
  data.stStringAppend("name", asStycksString("Stycks"));
  data.stIntAppend("age", asStycksInt(18));
  data.stFloatAppend("height", asStycksFloat(1.8));
  data.stBoolAppend("height", asStycksBool(true));
  data.stListAppend("hobbies", asStycksList(["coding", "gaming", "sleeping"]));
  var decode = StycksDecode(data.stEncode());
  var name = decode.getEntry("hobbies");
  print(name.nativeList);
}

class StycksData {
  var nativeString;
  var nativeInt;
  var nativeFloat;
  var nativeBool;
  var nativeList;
  StycksData(this.nativeString, this.nativeInt, this.nativeFloat,
      this.nativeBool, this.nativeList);
}

class StycksString {
  late String stString;
}

StycksString asStycksString(String stString) {
  return StycksString()..stString = stString;
}

class StycksInt {
  late String stInt;
}

StycksInt asStycksInt(int stInt) {
  return StycksInt()..stInt = stInt.toString();
}

class StycksFloat {
  late String stFloat;
}

StycksFloat asStycksFloat(double stFloat) {
  return StycksFloat()..stFloat = stFloat.toString();
}

class StycksBool {
  late String stBool;
}

StycksBool asStycksBool(bool stBool) {
  return StycksBool()..stBool = stBool.toString();
}

class StycksList {
  late String stList;
}

StycksList asStycksList(List stList) {
  String stl = stList.join('␟');
  stl = "[$stl]";
  return StycksList()..stList = stl;
}

class StycksEncode {
  String _stcode = "";
  String _stmeta = 0.toString();
  List names = [];
  stStringAppend(String name, StycksString stString) {
    if (names.contains(name)) {
      return null;
    }
    if (name == "meta") {
      return null;
    }
    _stcode = '$_stcode"$name":"${stString.stString}",';
    var tempMetaAmount = int.parse(_stmeta[0]) + 1;
    _stmeta = _stmeta.substring(1, _stmeta.length);
    _stmeta = tempMetaAmount.toString() + _stmeta;
    _stmeta = '$_stmeta␟str';
    names.add(name);
  }

  stIntAppend(String name, StycksInt stInt) {
    if (name == "meta") {
      return null;
    }
    if (names.contains(name)) {
      return null;
    }
    _stcode = '$_stcode"$name":"${stInt.stInt}",';
    var tempMetaAmount = int.parse(_stmeta[0]) + 1;
    _stmeta = _stmeta.substring(1, _stmeta.length);
    _stmeta = tempMetaAmount.toString() + _stmeta;
    _stmeta = '$_stmeta␟int';
    names.add(name);
  }

  stFloatAppend(String name, StycksFloat stFloat) {
    if (name == "meta") {
      return null;
    }
    if (names.contains(name)) {
      return null;
    }
    _stcode = '$_stcode"$name":"${stFloat.stFloat}",';
    var tempMetaAmount = int.parse(_stmeta[0]) + 1;
    _stmeta = _stmeta.substring(1, _stmeta.length);
    _stmeta = tempMetaAmount.toString() + _stmeta;
    _stmeta = '$_stmeta␟flt';
    names.add(name);
  }

  stBoolAppend(String name, StycksBool stBool) {
    if (name == "meta") {
      return null;
    }
    if (names.contains(name)) {
      return null;
    }
    _stcode = '$_stcode"$name":"${stBool.stBool}",';
    var tempMetaAmount = int.parse(_stmeta[0]) + 1;
    _stmeta = _stmeta.substring(1, _stmeta.length);
    _stmeta = tempMetaAmount.toString() + _stmeta;
    _stmeta = '$_stmeta␟bln';
    names.add(name);
  }

  stListAppend(String name, StycksList stList) {
    if (name == "meta") {
      return null;
    }
    if (names.contains(name)) {
      return null;
    }
    _stcode = '$_stcode"$name":"${stList.stList}",';
    var tempMetaAmount = int.parse(_stmeta[0]) + 1;
    _stmeta = _stmeta.substring(1, _stmeta.length);
    _stmeta = tempMetaAmount.toString() + _stmeta;
    _stmeta = '$_stmeta␟lst';
    names.add(name);
  }

  stEncode() {
    _stcode = _stcode.substring(0, _stcode.length - 1);
    _stcode = '{"meta":"$_stmeta", $_stcode}';
    return _stcode;
  }
}

class StycksDecode {
  String stycksdata;
  late List _names = _getNames();
  late Map _types = getTypes();
  late List _values = _getValues();
  StycksDecode(this.stycksdata);
  int count() {
    return int.parse(stycksdata[9]);
  }

  _getNames() {
    var stycksdataClean = stycksdata.substring(1, stycksdata.length - 1);
    var items = stycksdataClean.split(",");
    items.removeAt(0);
    var names = [];
    items.forEach((element) {
      var name = element.split(":")[0];
      name = name.substring(1, name.length - 1);
      names.add(name);
    });

    names[0] = names[0].substring(1, names[0].length);
    return names;
  }

  _getValues() {
    var stycksdataClean = stycksdata.substring(1, stycksdata.length - 1);
    var items = stycksdataClean.split(",");
    items.removeAt(0);
    var values = [];
    items.forEach((element) {
      var value = element.split(":")[1];
      value = value.substring(1, value.length - 1);
      values.add(value);
    });
    //values.removeAt(0);
    values[0] = values[0].substring(1, values[0].length);
    return values;
  }

  getTypes() {
    var names = _getNames();
    List types = [];
    var stycksdataClean = stycksdata.substring(1, stycksdata.length - 1);
    var items = stycksdataClean.split(",");
    var meta = items[0].split(":")[1];
    meta = meta.substring(1, meta.length - 1);
    types = meta.split("␟");
    types.removeAt(0);
    Map typesMap = {};
    print(types);
    print(names);
    types.forEach((element) {
      typesMap[names[types.indexOf(element)]] = element;
    });
    return typesMap;
  }

  StycksData getEntry(String name) {
    print(_names);
    print(_values);
    print(_types);
    if (_names.contains(name)) {
      Type type = typeOf(name);
      print(type);
      var value = _values[_names.indexOf(name)];
      print(value);
      if (type == String) {
        return StycksData(value, null, null, null, null);
      } else if (type == int) {
        return StycksData(null, int.parse(value), null, null, null);
      } else if (type == double) {
        return StycksData(null, null, double.parse(value), null, null);
      } else if (type == bool) {
        return StycksData(null, null, null, bool.fromEnvironment(value), null);
      } else if (type == List) {
        return StycksData(null, null, null, null,
            value.substring(1, value.length - 1).split("␟"));
      }
    }
    return StycksData(null, null, null, null, null);
  }

  Type typeOf(String name) {
    if (_names.contains(name)) {
      var type = _types[name];
      if (type == "str") {
        return String;
      } else if (type == "int") {
        return int;
      } else if (type == "flt") {
        return double;
      } else if (type == "bln") {
        return bool;
      } else if (type == "lst") {
        return List;
      }
      return type;
    }
    return Null;
  }
}
