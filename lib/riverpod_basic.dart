import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => "RiverPod Basisc");
final textProvider =
    Provider<String>((ref) => 'You have pushed the button this many times:');

class RiverPodBasics extends StatelessWidget {
  const RiverPodBasics({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /////////////// 1. YÖNTEM //////////////
        title: Consumer(
          builder: ((context, ref, child) {
            var title = ref.watch(titleProvider);
            return Text(title);
          }),
        ),
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

class MyText extends ConsumerWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /////////// 2. YÖNTEM //////////////
    return Text(ref.watch(textProvider));
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
