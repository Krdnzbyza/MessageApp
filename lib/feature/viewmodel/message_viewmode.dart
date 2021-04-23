import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:message_app/core/constants/apllication_constants.dart';
import 'package:message_app/feature/model/message_model.dart';
import 'package:mobx/mobx.dart';
part 'message_viewmode.g.dart';

class MessageViewModel = _MessageViewModelBase with _$MessageViewModel;

abstract class _MessageViewModelBase with Store {
  BuildContext? context;
  @observable
  List<User> user = [];

  final url = ApplicationConstant.instance.baseUrl;

  @observable
  bool isLoading = false;

  @action
  Future<void> takeAllData() async {
    changeLoading();
    final response = await Dio().get(url);
    if (response.statusCode == HttpStatus.ok) {
      final responseData = response.data as List;
      user = responseData.map((e) => User.fromMap(e)).toList();
      print(user);
    }
    changeLoading();
  }

  void setContext(BuildContext? context) {
    this.context = context;
    takeAllData();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }
}
