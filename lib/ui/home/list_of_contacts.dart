import 'package:flutter/material.dart';
import 'package:task/route/rtn_routes.dart';
import 'package:task/util/style/style.dart';

/// list of contacts which is used to display searched contacts
class ListOfContactsWidget extends StatelessWidget {
  final List<dynamic> contacts;

  ListOfContactsWidget(this.contacts);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: contacts.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return index == 0
              ? Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, TaskRoutes.detail,
                              arguments: contacts.elementAt(index));
                        },
                        child: Row(
                          children: [
                            Expanded(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Text(
                                      contacts.elementAt(index),
                                      style: textStyle12BlackNormal,
                                    ),
                                  ],
                                )
                              ],
                            )),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, TaskRoutes.detail);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  contacts.elementAt(index),
                                  style: textStyle12BlackNormal,
                                ),
                              ],
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                );
        });
  }
}
