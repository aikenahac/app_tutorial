import 'package:flutter/material.dart';
import 'package:app_tutorial/app_tutorial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Tutorial Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'App Tutorial Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<TutorialItem> items = [];

  final incrementKey = GlobalKey();
  final avatarKey = GlobalKey();
  final textKey = GlobalKey();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void initItems() {
    items.addAll({
      TutorialItem(
        globalKey: incrementKey,
        top: 200,
        left: 50,
        right: 50,
        color: Colors.black.withOpacity(0.6),
        borderRadius: const Radius.circular(15.0),
        shapeFocus: ShapeFocus.roundedSquare,
        children: const [
          Text(
            'This is the increment button',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
      TutorialItem(
        globalKey: textKey,
        top: 200,
        left: 50,
        right: 50,
        shapeFocus: ShapeFocus.square,
        borderRadius: const Radius.circular(15.0),
        children: const [
          Text(
            'This is the text that displays the status of the counter',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
      TutorialItem(
        globalKey: avatarKey,
        top: 200,
        left: 50,
        right: 50,
        color: Colors.black.withOpacity(0.6),
        shapeFocus: ShapeFocus.oval,
        children: const [
          Text(
            'This is the avatar that displays something',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            'Next',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    });
  }

  @override
  void initState() {
    initItems();
    Future.delayed(const Duration(microseconds: 200)).then((value) {
      Tutorial.showTutorial(context, items);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Icon(
          Icons.add_circle_outline_rounded,
          key: avatarKey,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: textKey,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: incrementKey,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
