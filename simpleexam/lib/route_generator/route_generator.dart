import 'package:flutter/material.dart';
import 'package:simpleexam/route_generator/error_route.dart';
import 'package:simpleexam/screen/create_user.dart';
import 'package:simpleexam/screen/crud_home.dart';

/// This class is used to navigate around screens in a way suitable for larger apps.
/// By creating a RouteGenerator which can encapsulate all of the routing logic - sparing code duplication.
/// 
/// As creating many smaller classes with a certain purpose is always a good way to simplify code,
/// and when it comes to routing, this principle still holds true.
///
/// URL: https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/
/// ## Example
/// ```dart
/// // Pushing a named route
/// Navigator.of(context).pushNamed(
///   '/secondscreen',
///   arguments: 'Hello there from the first page!',
/// );
/// ```
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const CRUDHome());
      case '/createuser':
        // Validation of correct data type
        // if (args is String) {
        return MaterialPageRoute(
          builder: (_) => const CreateUser(
              // data: args,
              ),
        );
      // }
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.
      // return errorRoute();
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return errorRoute();
    }
  }
}
