import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:message_app/feature/viewmodel/message_viewmode.dart';
import 'package:message_app/feature/widget/bottomNavigation.dart';
import 'package:message_app/core/constants/color_contants.dart';

class MessageView extends StatelessWidget {
  final _viewmodel = MessageViewModel();

  @override
  Widget build(BuildContext context) {
    if (_viewmodel.context == null) {
      _viewmodel.setContext(context);
    }
    return Scaffold(
      appBar: AppBar(
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
        title: Text(' CHAT ', style: context.textTheme.headline5),
        centerTitle: false,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: context.paddingNormal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Activities',
                  style: context.textTheme.headline6,
                ),
              ],
            ),
          ),
          Container(
            height: context.dynamicHeight(0.19),
            // color: Colors.red,
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
                          radius: 40,
                          backgroundImage: NetworkImage(
                            _viewmodel.user[index].downloadUrl.toString(),
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
          ),
          Divider(),
          Padding(
            padding: context.paddingNormal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Messages',
                  style: context.textTheme.headline6,
                ),
              ],
            ),
          ),
          Container(
            height: context.dynamicHeight(0.40),
            child: Observer(builder: (_) {
              if (_viewmodel.isLoading) {
                return Center(child: LinearProgressIndicator());
              } else {
                return ListView.builder(
                  padding: context.paddingNormal,
                  scrollDirection: Axis.vertical,
                  itemCount: _viewmodel.user.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      // width: 50,
                      decoration: BoxDecoration(
                          //  gradient: ,
                          ),
                      height: context.dynamicHeight(0.12),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                _viewmodel.user[index].downloadUrl.toString(),
                              ),
                            ),
                            SizedBox(width: context.dynamicWidth(0.04)),
                            Container(
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
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('24 min',
                                    style: context.textTheme.bodyText2),
                                CircleAvatar(
                                  backgroundColor: Colors.green,
                                  child: Text(
                                    '1',
                                    style: context.primaryTextTheme.bodyText1,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: bottomNavigation(),
    );
  }
}
