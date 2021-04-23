// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_viewmode.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MessageViewModel on _MessageViewModelBase, Store {
  final _$userAtom = Atom(name: '_MessageViewModelBase.user');

  @override
  List<User> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(List<User> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MessageViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$takeAllDataAsyncAction =
      AsyncAction('_MessageViewModelBase.takeAllData');

  @override
  Future<void> takeAllData() {
    return _$takeAllDataAsyncAction.run(() => super.takeAllData());
  }

  final _$_MessageViewModelBaseActionController =
      ActionController(name: '_MessageViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_MessageViewModelBaseActionController.startAction(
        name: '_MessageViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MessageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading}
    ''';
  }
}
