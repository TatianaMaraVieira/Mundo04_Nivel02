import "package:flutter/material.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veja o Mundo!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
    );
  }
}

class BuildContext {
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Viajar é mudar a roupa da alma.'),
      ),
      body: ListView(
        children: [
          Image.asset('images/top.jpg',
            width: MediaQuery.of(context).size.width,
            height: 240,
            fit: BoxFit.cover,
          ),
          const TitleSection(),
          ButtonSection(color: color),
          const TextSection(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  final Color color;

  const ButtonSection({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'Call'),
        _buildButtonColumn(color, Icons.near_me, 'Route'),
        _buildButtonColumn(color, Icons.share, 'Share'),
      ],
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dolomitas, Itália',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.star,
            color: Colors.yellow,
            size: 24,
          ),
          const Text('682'),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        'As Dolomitas, na Itália, garantem alguns dos cenários naturais mais espetaculares do mundo. Não à toa, a famosa cadeia de montanhas nos alpes italianos é considerada Patrimônio Mundial da UNESCO. Mas, afinal, o que fazer nas Dolomitas? Fato é que as Dolomitas mudam muito de acordo com a estação. O cenário branquinho de inverno é lindo, mas é no verão que elas se tornam incomparáveis. Não importa se você vai fazer uma trilha, escalar um montanha ou simplesmen
