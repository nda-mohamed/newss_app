import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true, actions: actions),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Center(child: Text('News App'))),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/homeScreen');
              },
              child: ListTile(
                title: Text('Go To Home'),
                leading: Icon(Icons.home),
              ),
            ),
            Divider(),
            GestureDetector(
              onTap: () {
                themeProvider.isDarkMode
                    ? themeProvider.setThemeMode = ThemeMode.light
                    : themeProvider.setThemeMode = ThemeMode.dark;
              },
              child: ListTile(
                title: Text(themeProvider.isDarkMode ? 'Light Mode' : 'Dark Mode'),
                leading: Icon(Icons.light_mode),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
