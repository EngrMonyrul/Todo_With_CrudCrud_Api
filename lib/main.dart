import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/helper/navigator.dart';
import 'package:untitled3/src/view/homepage/home_page_view.dart';
import 'package:untitled3/src/viewmodel/home_page_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvider>(
            create: (_) =>
                HomePageProvider(navigatorHelper: NavigatorHelper.instance)),
      ],
      child: MaterialApp(
        navigatorKey: NavigatorHelper.instance.navigationKey,
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        home: const HomePageView(),
        theme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
