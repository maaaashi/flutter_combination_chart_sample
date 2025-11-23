import 'package:flutter/material.dart';
import 'package:flutter_combination_chart_sample/pages/fl_chart.dart';
import 'package:flutter_combination_chart_sample/pages/graphic.dart';
import 'package:flutter_combination_chart_sample/pages/syncfusion_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<StatefulWidget> createState() => NavigateState();
}

class NavigateState extends State<RootPage> {
  int _selectedIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Navigator(
            key: _navigatorKeys[0],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (context) => GraphicPage()),
          ),
          Navigator(
            key: _navigatorKeys[1],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (context) => FlChartPage()),
          ),
          Navigator(
            key: _navigatorKeys[2],
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => SyncfusionFlutterChartPage(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'graphic',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_axis),
            label: 'fl_chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'syncfusion_chart',
          ),
        ],
      ),
    );
  }
}
