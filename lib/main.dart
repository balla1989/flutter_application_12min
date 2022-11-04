import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

// basic stateless widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

// kitten class with basic parameters
class Kitten {
  const Kitten(
      {required this.name,
      required this.description,
      required this.age,
      required this.imageUrl});
  final String name;
  final String description;
  final int age;
  final String imageUrl;
}

// Global strings for android and ios
final String server =
    defaultTargetPlatform == TargetPlatform.android ? "10.0.2." : "localhost";

// created a list of 4 kittens.
final List<Kitten> kittens = <Kitten>[
  Kitten(
      name: "Mittens",
      description:
          'The pinnacle of cats. When Mittens sit in your lap, you feel like royalty.',
      age: 11,
      imageUrl: 'http://$server:8000/Kitten0.jpeg'),
  Kitten(
      name: "Fluffy",
      description: 'World\'s cutest kitten. Serioulsy, we did the research.',
      age: 3,
      imageUrl: 'http://$server:8000/Kitten1.jpeg'),
  Kitten(
      name: "Scooter",
      description: 'Chases string faster than 9/10 competing kittens.',
      age: 2,
      imageUrl: 'http://$server:8000/Kitten2.jpeg'),
  Kitten(
      name: "Steve",
      description: 'Steve is cool and just kin of hangs out.',
      age: 4,
      imageUrl: 'http://$server:8000/Kitten3.jpeg')
];

// Home page screen
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _dialogBuilder(BuildContext context, Kitten kitten) {
    return SimpleDialog(contentPadding: EdgeInsets.zero, children: [
      Image.network(kitten.imageUrl, fit: BoxFit.fill),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(kitten.name),
              Text('${kitten.age} months old'),
              Text(kitten.description),
            ],
          ))
    ]);
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (context) => _dialogBuilder(context, kittens[index])),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          kittens[index].name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Available Kittens'),
        ),
        body: ListView.builder(
          itemCount: kittens.length,
          itemExtent: 60.0,
          itemBuilder: _listItemBuilder,
        ));
  }
}
