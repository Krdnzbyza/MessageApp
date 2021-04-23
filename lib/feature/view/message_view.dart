import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/core/init/lang/locale_keys.g.dart';
import 'package:message_app/feature/viewmodel/message_viewmode.dart';
import 'package:message_app/feature/widget/bottomNavigation.dart';
import 'package:message_app/core/constants/color_contants.dart';
import 'package:message_app/feature/widget/text_bar.dart';

class MessageView extends StatelessWidget {
  final colorConst = ColorTheme();
  final _viewmodel = MessageViewModel();

  @override
  Widget build(BuildContext context) {
    if (_viewmodel.context == null) {
      _viewmodel.setContext(context);
    }
    return Scaffold(
      appBar: buildAppBar(context),
      body: Column(
        children: <Widget>[
          Padding(
            padding: context.paddingNormal,
            child: activitiesTextWidget(),
          ),
          horizontalListView(context),
          Padding(padding: context.paddingNormal, child: messageText()),
          chatCardView(context),
        ],
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }

  Container horizontalListView(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.15),
      child: Observer(builder: (_) {
        if (_viewmodel.isLoading) {
          return Center(child: LinearProgressIndicator());
        } else {}
        return ListView.builder(
          padding: context.paddingNormal,
          scrollDirection: Axis.horizontal,
          itemCount: _viewmodel.user.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: context.horizontalPaddingNormal,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    // radius: context.normalRadius.y,
                    backgroundColor: colorConst.emerald,
                    child: CircleAvatar(
                      radius: 25,
                      // radius: context.normalRadius.x,
                      backgroundImage: NetworkImage(
                        _viewmodel.user[index].downloadUrl.toString(),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          _viewmodel.user[index].author.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  Container chatCardView(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.48),
      child: Observer(builder: (_) {
        if (_viewmodel.isLoading) {
          return Center(child: LinearProgressIndicator());
        } else {
          return cardListView(context);
        }
      }),
    );
  }

  ListView cardListView(BuildContext context) {
    return ListView.builder(
      padding: context.paddingNormal,
      scrollDirection: Axis.vertical,
      itemCount: _viewmodel.user.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: context.dynamicHeight(0.11),
          child: Card(
            elevation: 0,
            child: Row(
              children: [
                avatarCircle(index),
                SizedBox(width: context.dynamicWidth(0.04)),
                cardContainer(context, index),
                SizedBox(width: context.dynamicWidth(0.12)),
                rightcardText()
              ],
            ),
          ),
        );
      },
    );
  }

  CircleAvatar avatarCircle(int index) {
    return CircleAvatar(
      backgroundImage: NetworkImage(
        _viewmodel.user[index].downloadUrl.toString(),
      ),
    );
  }

  Container cardContainer(BuildContext context, int index) {
    return Container(
      width: context.dynamicWidth(0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: context.dynamicHeight(0.02)),
          Text(
            _viewmodel.user[index].author.toString(),
          ),
          SizedBox(height: context.dynamicHeight(0.01)),
          Text(
            _viewmodel.user[index].url.toString(),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: context.colorScheme.onSurface,
            ),
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
              color: context.colorScheme.onSurface,
            ),
          ],
        )
      ],
      title: Text(LocaleKeys.appBarMain_name.tr(),
          style: context.textTheme.headline5),
      centerTitle: false,
    );
  }
}
