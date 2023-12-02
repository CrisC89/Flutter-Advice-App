import 'package:advice_app/application/pages/advice/advice.page.dart';
import 'package:advice_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dependency-injection.dart' as di;

import 'application/core/services/theme.service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicePageWrapperProvider(),
      );
    });
  }
}
