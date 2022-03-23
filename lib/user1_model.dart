import 'dart:convert';

class User1Model {
  final String name;
  String _lastName = 'a';
  User1Model({
    required this.name,
  });
  set lastName(String a) {
    _lastName = a;
  }

  User1Model copyWith({
    String? name,
  }) {
    return User1Model(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      '_lastName': _lastName,
    };
  }

  factory User1Model.fromMap(Map<String, dynamic> map) {
    return User1Model(
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User1Model.fromJson(String source) =>
      User1Model.fromMap(json.decode(source));

  @override
  String toString() => 'User1Model(name: $name, _lastName: $_lastName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User1Model &&
        other.name == name &&
        other._lastName == _lastName;
  }

  @override
  int get hashCode => name.hashCode ^ _lastName.hashCode;
}
