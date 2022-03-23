import 'package:design__patterns_prototype/model.dart';
import 'package:design__patterns_prototype/user1_model.dart';
import 'package:design__patterns_prototype/user2_model.dart';

void execute() {
  print('Baseado em: https://refactoring.guru/pt-br/design-patterns/prototype');
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

  print('====');
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
