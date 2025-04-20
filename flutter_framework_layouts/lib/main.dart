import 'package:flutter/material.dart';
import 'pages/gridview.dart';
import 'pages/themedata.dart';
import 'pages/themedatasubscribe.dart';
import 'pages/restriction.dart';
import 'pages/responsive.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Framework Layouts',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/gridview': (context) => const MyAppGridView(),
        '/themedata': (context) => const MyAppThemeData(),
        '/themedata_subscribe': (context) => const MyAppThemeDataSubscribe(),
        '/restriction': (context) => const MyAppRestriction(),
        '/responsive': (context) => const MyAppResponsive(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Framework Layouts')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text('GridView Example'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/gridview'),
          ),
          ListTile(
            title: const Text('ThemeData Example'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/themedata'),
          ),
          ListTile(
            title: const Text('ThemeData Override Example'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/themedata_subscribe'),
          ),
          ListTile(
            title: const Text('Layout Restrictions Example'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/restriction'),
          ),
          ListTile(
            title: const Text('Responsive Layout Example'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () => Navigator.pushNamed(context, '/responsive'),
          ),
        ],
      ),
    );
  }
}
