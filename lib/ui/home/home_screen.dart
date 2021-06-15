import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/ui/application/application_bloc.dart';
import 'package:task/ui/application/application_state.dart';
import 'package:task/ui/home/list_of_contacts.dart';
import 'package:task/ui/home/list_of_contacts_group_widget.dart';
import 'package:task/widget/progress_widget.dart';
import 'package:task/widget/sliver_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() {
    return _HomeScreeState();
  }
}

class _HomeScreeState extends State<HomeScreen> {
  ApplicationBloc applicationBloc;

  @override
  Widget build(BuildContext context) {
    applicationBloc = BlocProvider.of<ApplicationBloc>(context);
    return Scaffold(
      key: applicationBloc.scaffoldKey,
      body: NestedScrollView(
        controller: applicationBloc.contactsScrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverAppBarWidget(applicationBloc.searchedPressed,
                applicationBloc.isSearchClicked, applicationBloc.searchText)
          ];
        },
        body: BlocBuilder<ApplicationBloc, ApplicationBlocState>(
          builder: (context, state) {
            Widget homeWidget;
            if (state is ApplicationInitialState) {
              homeWidget = ProgressWidget();
            } else if (state is ApplicationDataState) {
              homeWidget = ListOfContactsGroupWidget(
                  state.contacts,
                  applicationBloc.tags,
                  applicationBloc.onClickOfTag,
                  applicationBloc.contactsScrollController);
            } else if (state is SearchContactState) {
              homeWidget = ListOfContactsWidget(state.contacts);
            } else if (state is ApplicationDateErrorState) {
              homeWidget = Container();
            }
            return homeWidget;
          },
        ),
      ),
    );
  }
}
