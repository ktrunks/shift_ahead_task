import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/util/style/style.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationBlocEvent, ApplicationBlocState> {
  ApplicationBloc() : super(ApplicationInitialState()) {
    searchText.addListener(onSearchListener);
  }

  ApplicationBlocState get initialState => ApplicationInitialState();

  /// scaffold which is used for toast or context
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  /// list of contacts
  List<dynamic> _contacts = [];

  Map<String, dynamic> groupedContacts = {};

  /// list of tags
  List<dynamic> _tags = [];

  /// height of each item
  double susItemHeight = 40;

  /// list of tags (names first letter)
  List<dynamic> get tags => _tags;

  /// indicates whether search is enabled or not
  bool isSearchClicked = false;

  /// get list view scroll controller
  ScrollController get contactsScrollController => _scrollController;

  /// search text field controller
  final TextEditingController searchText = new TextEditingController();

  /// list view scroll controller
  ScrollController _scrollController = ScrollController();

  @override
  Stream<ApplicationBlocState> mapEventToState(
      ApplicationBlocEvent event) async* {
    if (event is ApplicationDataState) {
    } else if (event is ApplicationInitialEvent) {
      loadData();
    } else if (event is ApplicationLoadSuccess) {
      yield ApplicationDataState(event.contacts, _tags);
    } else if (event is SearchContact) {
      yield SearchContactState(
        event.contacts,
      );
    } else if (event is ApplicationErrorEvent) {}
  }

  /// reading contact from assets file
  void loadData() async {
    rootBundle.loadString('assets/contacts.json').then((value) {
      _contacts = json.decode(value);
      _contacts.sort((a, b) {
        return a.toLowerCase().compareTo(b.toLowerCase());
      });
      _handleList(_contacts);
    });
  }

  /// handling list of contacts
  void _handleList(List<dynamic> list) {
    if (list.isEmpty) return;
    for (int i = 0, length = list.length; i < length; i++) {
      String name = list[i];
      String tag = name.substring(0, 1).toUpperCase();
      if (RegExp("[A-Z]").hasMatch(tag)) {
        if (!groupedContacts.containsKey(tag)) {
          _tags.add(tag);
          groupedContacts[tag] = ['${list.elementAt(i)}'];
        } else {
          List<dynamic> contacts = groupedContacts[tag];
          contacts.add(list.elementAt(i));
          groupedContacts[tag] = contacts;
        }
      } else {
        list[i] = "#";
      }
    }
    this.add(ApplicationLoadSuccess(groupedContacts));
  }

  /// search text change listener
  void onSearchListener() {
    if (searchText.text.isNotEmpty) {
      List<String> searchContact = [];
      for (String contact in _contacts) {
        if (contact
            .toLowerCase()
            .contains(searchText.text.trim().toLowerCase())) {
          searchContact.add(contact);
        }
      }
      this.add(SearchContact(searchContact));
    } else {
      this.add(ApplicationLoadSuccess(groupedContacts));
    }
  }

  /// on click of tag
  void onClickOfTag(String tag) {
    debugPrint('on click of tag --- $tag');
    int index = tags.indexOf(tag);
    double scrollTo = 0.0;
    for (int i = 0; i < index; i++) {
      int gorupContact = (groupedContacts[tags.elementAt(i)] as List).length;
      scrollTo = scrollTo + gorupContact * contactItemHeight;
    }
    _scrollController.animateTo((scrollTo),
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  /// updating search status
  void searchedPressed() {
    isSearchClicked = !isSearchClicked;
    if (!isSearchClicked) {
      searchText.clear();
      this.add(ApplicationLoadSuccess(groupedContacts));
    }
  }
}
