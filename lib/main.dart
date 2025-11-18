import 'package:flutter/material.dart';
import 'package:newss_app/presentation/home_screen/home_screen.dart';
import 'package:newss_app/presentation/news_screen/news_view.dart';
import 'package:newss_app/presentation/providers/theme_provider.dart';
import 'package:newss_app/presentation/resources/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'News App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.getThemeMode,

      initialRoute: NewsView.routeName,
      routes: {
        NewsView.routeName: (context) =>  NewsView(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
