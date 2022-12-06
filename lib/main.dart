import 'package:flutter/material.dart';
import 'package:flutter_redux_state_management/riverpod_basic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RiverPodBasics()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyText(),
            CounterText(incrementer: _counter),
          ],
        ),
      ),
      floatingActionButton: MyIncrementer(
        onIncrement: () {
          _counter++;
          setState(() {});
        },
      ),
    );
  }
}

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You have pushed the button this many times:',
    );
  }
}

class CounterText extends StatelessWidget {
  final int incrementer;
  const CounterText({Key? key, required this.incrementer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '$incrementer',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyIncrementer extends StatelessWidget {
  VoidCallback onIncrement;
  MyIncrementer({Key? key, required this.onIncrement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onIncrement();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
