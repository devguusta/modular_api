// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentsStore on _CommentsStoreBase, Store {
  final _$valueAtom = Atom(name: '_CommentsStoreBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_CommentsStoreBaseActionController =
      ActionController(name: '_CommentsStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_CommentsStoreBaseActionController.startAction(
        name: '_CommentsStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CommentsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
