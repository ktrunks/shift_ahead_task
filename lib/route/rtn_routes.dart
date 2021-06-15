import 'package:fluro/fluro.dart';

import 'rtn_route_handlers.dart';

///
class TaskRoutes {
  ///
  static FluroRouter router;

  /// root end point
  static const String root = '/';

  static const String detail = '/details';


  /// configuring routes
  static void configureRoutes(FluroRouter router) {
    router.define(root,
        handler: rootHandler, transitionType: TransitionType.inFromRight);
    router.define(detail,
        handler: detailHandler, transitionType: TransitionType.inFromRight);
  }
}
