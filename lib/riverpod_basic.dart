import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => "RiverPod Basisc");
final textProvider =
    Provider<String>((ref) => 'You have pushed the button this many times:');
final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
            //CounterText(incrementer: _counter),
            CounterText()
          ],
        ),
      ),
      floatingActionButton: MyIncrementer(
          /* onIncrement: () {
          _counter++;
          setState(() {});
        },*/
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

class CounterText extends ConsumerWidget {
  //final int incrementer;
  const CounterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterStateProvider);
    return Text(
      "$counter",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}

class MyIncrementer extends ConsumerWidget {
  //VoidCallback onIncrement;
  MyIncrementer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        ref.read(counterStateProvider.notifier).state++;
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}
