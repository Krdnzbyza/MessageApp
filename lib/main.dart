import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:message_app/core/constants/apllication_constants.dart';
import 'package:message_app/feature/view/message_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        path: ApplicationConstant.LANG_ASSET_PATH,
        supportedLocales: [Locale('en', 'US'), Locale('tr', 'TR')],
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Message App',
        debugShowCheckedModeBanner: false,
        home: MessageView());
  }
}
