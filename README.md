Segunda o padrão Prototype de https://refactoring.guru/pt-br/design-patterns/prototype
Nosso copyWith esta errado ?

Pois ele nao copia campos privados da classe.

Teriamos que usar um abstract clone ?

Vejamos...
# usando o copyWith

## A implementação
```Dart
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
}
```
## testando o copyWith
```Dart
void main() {
  User1Model user1model = User1Model(name: 'user1');
  print('user1model.hashCode: ${user1model.hashCode}');
  print('user1model.toString(): ${user1model.toString()}');
  print('... editando user1model: name, _lastName');
  user1model = user1model.copyWith(name: 'user1a');
  user1model.lastName = 'aa';
  print('user1model.toString(): ${user1model.toString()}');
  print('... user1modelCopy = user1model.copyWith()');
  User1Model user1modelCopy = user1model.copyWith();
  print('user1modelCopy.hashCode: ${user1modelCopy.hashCode}');
  print('user1modelCopy.toString(): ${user1modelCopy.toString()}');
}
```
## saida com copyWith
Como podemos ver ele não copia corretamente os campos privados.
```
user1model.hashCode: 42292417
user1model.toString(): User1Model(name: user1, _lastName: a)
... editando user1model: name, _lastName
user1model.toString(): User1Model(name: user1a, _lastName: aa)
... user1modelCopy = user1model.copyWith()
user1modelCopy.hashCode: 528466425
user1modelCopy.toString(): User1Model(name: user1a, _lastName: a)
```

# Usando o clone
## A abstração
```Dart
abstract class Model {
  Model();
  Model clone();
}
```
## A implementação
```Dart
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
```
# testando o clone
```Dart
void main() {
  User2Model user2model = User2Model(name: 'user2');
  print('user2model.hashCode: ${user2model.hashCode}');
  print('user2model.toString(): ${user2model.toString()}');
  print('... editando user1model: name, _lastName');
  user2model = user2model.copyWith(name: 'user2a');
  user2model.lastName = 'aa';
  print('user2model.toString(): ${user2model.toString()}');
  print('... user2modelClone = user2model.clone()');
  User2Model user2modelClone = user2model.clone() as User2Model;
  print('user2modelClone.hashCode: ${user2modelClone.hashCode}');
  print('user2modelClone.toString(): ${user2modelClone.toString()}');
}
```

# saida com copyWith
Como podemos ver ele faz uma copia profunda ate em campos privados.
```
user2model.hashCode: 654966079
user2model.toString(): User2Model(name: user2, _lastName: a)
... editando user1model: name, _lastName
user2model.toString(): User2Model(name: user2a, _lastName: aa)
... user2modelClone = user2model.clone()
user2modelClone.hashCode: 1063824195
user2modelClone.toString(): User2Model(name: user2a, _lastName: aa)
```