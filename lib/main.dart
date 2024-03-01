import 'package:flutter/material.dart';
import 'package:pharm/app/app.locator.dart';
import 'package:pharm/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await setupLocator();
  runApp(MainApp(
    token: prefs.getString("token"),
  ));
}

class MainApp extends StatelessWidget {
  var token;
  MainApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.loginView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
