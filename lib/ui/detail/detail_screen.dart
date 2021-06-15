import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  Object contactDetail;

  DetailScreen(this.contactDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${contactDetail}'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
          child: Container(
        child: Text('Detail Screen \n ${contactDetail}'),
      )),
    );
  }
}
