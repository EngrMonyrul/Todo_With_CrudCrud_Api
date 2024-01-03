import 'package:flutter/material.dart';

class NavigatorHelper {
  late GlobalKey<NavigatorState> navigationKey;
  static NavigatorHelper instance = NavigatorHelper();

  NavigatorHelper() {
    navigationKey = GlobalKey<NavigatorState>();
  }

  pushNavigate({required Widget navigateState}) {
    return navigationKey.currentState!
        .push(MaterialPageRoute(builder: (context) => navigateState));
  }

  pushReplacementNavigator({required Widget navigateState}) {
    return navigationKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => navigateState));
  }

  pushRemoveUntil({required Widget navigateState}) {
    return navigationKey.currentState!.pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => navigateState),
        (route) => false);
  }

  goBack() {
    return navigationKey.currentState!.pop();
  }

  showLoader() {
    Future.delayed(Duration.zero, () {
      showDialog(
        context: navigationKey.currentContext!,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    });
  }
}
