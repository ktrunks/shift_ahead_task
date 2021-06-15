import 'package:flutter/material.dart';
import 'package:task/route/rtn_routes.dart';
import 'package:task/util/style/style.dart';

/// home screen which is used display grouped contact
/// according to first letter
class ListOfContactsGroupWidget extends StatelessWidget {
  final Map<String, dynamic> contacts;
  final List<dynamic> tags;
  final void Function(String tag) onClickOfTag;
  final ScrollController _scrollController;

  ListOfContactsGroupWidget(
      this.contacts, this.tags, this.onClickOfTag, this._scrollController);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          primary: false,
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          children: groupContact(contacts, context),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: tags.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => onClickOfTag(tags.elementAt(index)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            tags.elementAt(index),
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        )
      ],
    );
  }

  List<Widget> groupContact(Map<String, dynamic> contacts, context) {
    List<Widget> groupWidget = [];
    contacts.forEach((key, value) {
      groupWidget.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              key,
              style: textStyle12BlackNormal,
            ),
          ),
          Column(
            children: getContact(value, context),
          )
        ],
      ));
    });

    return groupWidget;
  }

  List<Widget> getContact(List<dynamic> contacts, context) {
    List<Widget> contactWidget = [];
    for (String contact in contacts) {
      contactWidget.add(Container(
        height: contactItemHeight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              debugPrint('on click of contact');
              Navigator.pushNamed(context, TaskRoutes.detail,
                  arguments: contact);
            },
            child: Text(
              '$contact',
              style: textStyle12BlackNormal,
            ),
          ),
        ),
      ));
    }

    return contactWidget;
  }
}
