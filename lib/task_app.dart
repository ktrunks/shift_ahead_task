import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/route/rtn_routes.dart';
import 'package:task/ui/application/application_bloc.dart';
import 'package:task/ui/application/application_event.dart';
import 'package:task/util/color/colors.dart';

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  void initState() {
    super.initState();
    final router = FluroRouter();
    TaskRoutes.router = router;
    TaskRoutes.configureRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ApplicationBloc>(
            create: (_) => ApplicationBloc()..add(ApplicationInitialEvent()),
          ),
        ],
        child: MaterialApp(
            initialRoute: TaskRoutes.root,
            debugShowCheckedModeBanner: false,
            title: 'Task',
            onGenerateRoute: TaskRoutes.router.generator,
            theme: ThemeData(
              primaryColor: primaryColor,
              backgroundColor: white,
              buttonColor: primaryColor,
              accentColor: accentColor,
              primarySwatch: MaterialColor(0xff000000, primarySwatchColor),
              unselectedWidgetColor: primaryColor,
              primaryIconTheme: IconThemeData(
                color: primaryColor,
              ),
              errorColor: errorColor,
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
