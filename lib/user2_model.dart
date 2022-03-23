import 'dart:convert';

import 'package:design__patterns_prototype/model.dart';

class User2Model extends Model {
  String name;
  String _lastName = 'a';

  User2Model({
    required this.name,
  });
  set lastName(String a) {
    _lastName = a;
  }

  @override
  Model clone() {
    return this;
  }

  User2Model copyWith({
    String? name,
  }) {
    return User2Model(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory User2Model.fromMap(Map<String, dynamic> map) {
    return User2Model(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User2Model.fromJson(String source) =>
      User2Model.fromMap(json.decode(source));

  @override
  String toString() => 'User2Model(name: $name, _lastName: $_lastName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User2Model && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
