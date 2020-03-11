import 'dart:convert';

getMap(dynamic obj) {
  if (obj == null) return Map<String, dynamic>();
  Map<String, dynamic> map;
  if (obj is String) {
    map = json.decode(obj);
  } else if (obj is Map<String, dynamic>) {
    map = obj;
  }
  return map;
}



decode(dynamic o) => json.decode(o);

encode(dynamic o) => json.encode(o);
