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
        color: Colors.black.withOpacity(0.6),
        borderRadius: const Radius.circular(15.0),
        shapeFocus: ShapeFocus.roundedSquare,
        child: const TutorialItemContent(
          title: 'Increment button',
          content: 'This is the increment button',
        ),
      ),
      TutorialItem(
        globalKey: textKey,
        shapeFocus: ShapeFocus.square,
        borderRadius: const Radius.circular(15.0),
        child: const TutorialItemContent(
          title: 'Counter text',
          content: 'This is the text that displays the status of the counter',
        ),
      ),
      TutorialItem(
        globalKey: avatarKey,
        color: Colors.black.withOpacity(0.6),
        shapeFocus: ShapeFocus.oval,
        child: const TutorialItemContent(
          title: 'Avatar',
          content: 'This is the avatar that displays something',
        ),
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

class TutorialItemContent extends StatelessWidget {
  const TutorialItemContent({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.1),
          child: Column(
            children: [
              Text(
                title,
              ),
              const SizedBox(height: 10.0),
              Text(
                content,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                    onPressed: () => Tutorial.skipAll(context),
                    child: const Text('Skip onboarding'),
                  ),
                  const Spacer(),
                  const TextButton(
                    onPressed: null,
                    child: Text('Skip onboarding'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
