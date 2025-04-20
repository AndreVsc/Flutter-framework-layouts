import 'package:flutter/material.dart';

class MyAppThemeDataSubscribe extends StatelessWidget {
  const MyAppThemeDataSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 3 - Sobrescrita de Tema',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
          surface: Colors.blue[50], // Substituindo background por surface
        ),
        scaffoldBackgroundColor: Colors.blue[50],
        cardColor: Colors.blue[100],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tema com Sobrescrita')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildDefaultThemeWidget(context),
            const SizedBox(height: 30),
            _buildOverriddenThemeWidget(),
          ],
        ),
      ),
    );
  }

  // Widget que usa o tema principal (azul)
  Widget _buildDefaultThemeWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Text(
        'Widget com Tema Azul',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }

  // Widget com tema sobrescrito (amarelo)
  Widget _buildOverriddenThemeWidget() {
    return Theme(
      // Sobrescrevendo o tema para amarelo
      data: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          brightness: Brightness.light,
          surface: Colors.yellow[50], // Substituindo background por surface
        ),
        scaffoldBackgroundColor: Colors.yellow[50],
        cardColor: Colors.yellow[100],
      ),
      child: Builder(
        builder: (context) {
          // É necessário usar Builder para acessar o tema correto
          return Container(
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                Text(
                  'Widget com Tema Amarelo',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                _buildYellowCard(context),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Botão Amarelo'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Card com tema amarelo
  Widget _buildYellowCard(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'Este card usa o tema amarelo',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
