import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppResponsive());
}

class MyAppResponsive extends StatelessWidget {
  const MyAppResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 4 - App Responsivo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
          headlineMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.indigo,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: const ResponsiveHomePage(),
    );
  }
}

class ResponsiveHomePage extends StatelessWidget {
  const ResponsiveHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Responsivo')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Verificamos se é modo paisagem ou retrato pelo LayoutBuilder
          // Usaremos 600 como breakpoint para layout diferente
          if (constraints.maxWidth > 600) {
            return _buildWideLayout(context);
          } else {
            return _buildNarrowLayout(context);
          }
        },
      ),
    );
  }

  // Layout para telas largas (tablet/desktop)
  Widget _buildWideLayout(BuildContext context) {
    return Row(
      children: [
        // Menu lateral
        Container(
          width: 240,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Menu', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),
              _buildMenuItem(context, 'Início', Icons.home),
              _buildMenuItem(context, 'Perfil', Icons.person),
              _buildMenuItem(context, 'Configurações', Icons.settings),
              _buildMenuItem(context, 'Ajuda', Icons.help),
            ],
          ),
        ),
        // Conteúdo principal
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Layout Responsivo',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 20),
                Text(
                  'Este é um exemplo de layout responsivo que usa ThemeData e LayoutBuilder',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 30),
                // Cards em grid para telas largas
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    _buildCard(context, 'Item 1', Icons.star),
                    _buildCard(context, 'Item 2', Icons.favorite),
                    _buildCard(context, 'Item 3', Icons.access_time),
                    _buildCard(context, 'Item 4', Icons.place),
                    _buildCard(context, 'Item 5', Icons.shopping_cart),
                    _buildCard(context, 'Item 6', Icons.event),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Layout para telas estreitas (celular)
  Widget _buildNarrowLayout(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Layout Responsivo',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Este é um exemplo de layout responsivo que usa ThemeData e LayoutBuilder',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),
          // Menu horizontal para celular
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(context, Icons.home),
                _buildIconButton(context, Icons.person),
                _buildIconButton(context, Icons.settings),
                _buildIconButton(context, Icons.help),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Cards em lista para celular
          _buildCard(context, 'Item 1', Icons.star),
          const SizedBox(height: 12),
          _buildCard(context, 'Item 2', Icons.favorite),
          const SizedBox(height: 12),
          _buildCard(context, 'Item 3', Icons.access_time),
          const SizedBox(height: 12),
          _buildCard(context, 'Item 4', Icons.place),
          const SizedBox(height: 12),
          _buildCard(context, 'Item 5', Icons.shopping_cart),
          const SizedBox(height: 12),
          _buildCard(context, 'Item 6', Icons.event),
        ],
      ),
    );
  }

  // Widget para item do menu lateral
  Widget _buildMenuItem(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  // Widget para botão de ícone no menu de celular
  Widget _buildIconButton(BuildContext context, IconData icon) {
    return IconButton(
      icon: Icon(icon, color: Theme.of(context).colorScheme.primary),
      onPressed: () {},
    );
  }

  // Widget para card
  Widget _buildCard(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 32, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text(
              'Descrição do item com informações relevantes.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
