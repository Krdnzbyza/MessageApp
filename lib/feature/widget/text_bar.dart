import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/core/init/lang/locale_keys.g.dart';

class activitiesTextWidget extends StatelessWidget {
  const activitiesTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.firstpart_activitiees.tr(),
          style: context.textTheme.headline6,
        ),
      ],
    );
  }
}

class messageText extends StatelessWidget {
  const messageText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.firstpart_activitiees.tr(),
          style: context.textTheme.headline6,
        ),
      ],
    );
  }
}

class rightcardText extends StatelessWidget {
  const rightcardText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(LocaleKeys.time_clock.tr(), style: context.textTheme.bodyText2),
        CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            LocaleKeys.time_day.tr(),
            style: context.primaryTextTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
