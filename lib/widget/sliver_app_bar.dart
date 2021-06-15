import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/util/style/style.dart';

class SliverAppBarWidget extends StatefulWidget {
  Function() _searchPressed;
  bool isSearchClicked;
  TextEditingController searchTextEditController;

  SliverAppBarWidget(
      this._searchPressed, this.isSearchClicked, this.searchTextEditController);

  @override
  State createState() => SliverAppBarWidgetState();
}

class SliverAppBarWidgetState extends State<SliverAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      actions: <Widget>[
        widget.isSearchClicked
            ? RawMaterialButton(
                elevation: 0.0,
                child: Icon(Icons.close),
                onPressed: () {
                  widget.isSearchClicked = false;
                  widget._searchPressed();
                  setState(() {});
                },
                shape: CircleBorder(),
              )
            : RawMaterialButton(
                elevation: 0.0,
                child: Icon(Icons.search),
                onPressed: () {
                  widget.isSearchClicked = true;
                  widget._searchPressed();
                  setState(() {});
                },
                shape: CircleBorder(),
              ),
      ],
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.only(bottom: 15),
          centerTitle: true,
          title: widget.isSearchClicked
              ? Container(
                  padding: EdgeInsets.only(bottom: 2, top: 10),
                  constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
                  // width: 220,
                  child: CupertinoTextField(
                    controller: widget.searchTextEditController,
                    keyboardType: TextInputType.text,
                    placeholder: "Search..",
                    placeholderStyle: textStyle14GreyNormal,
                    prefix: Padding(
                      padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                  ),
                )
              : Text(
                  "Contacts",
                  style: textStyleBlackNormal,
                ),
          background: Image.network(
            "https://image.shutterstock.com/shutterstock/photos/740444881/display_1500/stock-photo-contact-us-hand-of-businessman-holding-mobile-smartphone-with-mail-phone-email-icon-cutomer-740444881.jpg",
            fit: BoxFit.contain,
          )),
    );
  }
}
