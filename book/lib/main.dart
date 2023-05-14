import 'package:flutter/material.dart';

import 'package:book/chapter1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book to App: Introduction to Algorithms Third Edition',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // flutter run -d chrome
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title: 'Book to App: Introduction to Algorithms Third Edition'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedIndex = 0;
  var _countHolder = <int>[];
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        print('hit case 0');
        page = CoverPage();
        break;
      case 1:
        print('hit case 1');
        page = Test(
          countHolder: _countHolder,
        );
        break;
      case 2:
        print('hit case 2');
        page = HeldPage(
          countHolder: _countHolder,
        );
        break;
      case 3:
        print('hit case 3');
        page = Chapter1();
        break;
      default:
        throw UnimplementedError('not implemented: $_selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth > 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.star),
                    label: Text('Tutorial Remains'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.workspaces_rounded),
                    label: Text('What numbers did you star?'),
                  ),
                  NavigationRailDestination(
                      icon: Icon(Icons.book), label: Text('Chapter 1'))
                ],
                selectedIndex: _selectedIndex,
                onDestinationSelected: (val) {
                  setState(() {
                    _selectedIndex = val;
                  });
                  print('val: $val  _selectedIndex: $_selectedIndex');
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CoverPage extends StatefulWidget {
  const CoverPage({super.key});
  @override
  State<CoverPage> createState() => _CoverPageState();
}

class _CoverPageState extends State<CoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Cover Page'),
      ),
    );
  }
}

class Test extends StatefulWidget {
  const Test({super.key, required this.countHolder});
  final List<int> countHolder;
  @override
  State<Test> createState() => _TestState();

  final String title = 'Book to App: Introduction to Algorithms Third Edition';
}

class _TestState extends State<Test> {
  int _counter = 0;
  // var _countHolder = <int>[];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  void toggleHolder() {
    setState(() {
      if (widget.countHolder.contains(_counter)) {
        widget.countHolder.remove(_counter);
      } else {
        widget.countHolder.add(_counter);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    IconData icon;
    if (widget.countHolder.contains(_counter)) {
      icon = Icons.star;
    } else {
      icon = Icons.star_border;
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Tmp(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: const Text('Go back!'),
                ),
                ElevatedButton.icon(
                  onPressed: toggleHolder,
                  icon: Icon(icon),
                  label: const Text('Hold'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Tmp extends StatelessWidget {
  const Tmp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text('Lets see if this works', style: style),
      ),
    );
  }
}

class HeldPage extends StatelessWidget {
  final List<int> countHolder;
  const HeldPage({super.key, required this.countHolder});

  @override
  Widget build(BuildContext context) {
    if (countHolder.isEmpty) {
      return const Text('No numbers held');
    }

    // print(countHolder);
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(' Here is a total of '
              '${countHolder.length} numbers held'),
        ),
        for (var i in countHolder)
          ListTile(
            leading: Icon(Icons.star),
            title: Text('$i'),
          ),
      ],
    );
  }
}
