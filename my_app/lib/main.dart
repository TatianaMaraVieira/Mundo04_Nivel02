import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Classe principal 
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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

/// Página inicial do App
class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: 4, // Número de guias (links)
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Viajar é mudar a roupa da alma.'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Destinos'),
              Tab(text: 'Pacotes de Viagem'),
              Tab(text: 'Contato'),
              Tab(text: 'Sobre Nós'),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Digite seu destino',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Conteúdo da guia Destinos
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/top.jpg', // Caminho da imagem
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                        Text('Seu destino perfeito está aqui!'),
                      ],
                    ),
                  ),
                  // Conteúdo da guia Pacotes de Viagem
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/pacotes.jpg', // Caminho da imagem
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                        Text('Temos diversos pacotes disponíveis e também podemos montar um exclusivo.'),
                      ],
                    ),
                  ),
                  // Conteúdo da guia Contato
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/contato.jpg', //Caminho da imagem 
                          width: MediaQuery.of(context).size.width,
                          height: 240,
                          fit: BoxFit.cover,
                        ),
                        Text('Entre em contato conosco.'),
                      ],
                    ), 
                  ),
                  // Conteúdo da guia Sobre Nós
                  Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'images/sobre.jpg', // Caminho da imagem
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Text('Sua agência  de viagens para qualquer momento.'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: <Widget>[
                  Icon(Icons.call),
                  Text('Ligue'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.directions),
                  Text('Rota'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.share),
                  Text('Compartilhe'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Classe que define o delegado de pesquisa personalizado.
class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Lógica para exibir resultados da pesquisa
    return Center(
      child: Text('Resultados para: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugestões de pesquisa 
    final List<String> suggestions = [
      'Destino 1',
      'Destino 2',
      'Destino 3',
      'Destino 4',
    ];

    final List<String> filteredSuggestions = query.isEmpty
        ? suggestions
        : suggestions.where((destino) => destino.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            // Ação ao clicar na sugestão
            close(context, filteredSuggestions[index]);
          },
        );
      },
    );
  }
}
