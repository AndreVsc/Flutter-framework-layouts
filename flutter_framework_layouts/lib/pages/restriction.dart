import 'package:flutter/material.dart';

class MyAppRestriction extends StatelessWidget {
  const MyAppRestriction({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exercício 5 - Restrições de Layout',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ConstraintsDemo(),
    );
  }
}

class ConstraintsDemo extends StatelessWidget {
  const ConstraintsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Restrições de Layout')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Tight Constraints'),
            _buildTightConstraints(),
            const SizedBox(height: 30),
            _buildSectionTitle('Loose Constraints'),
            _buildLooseConstraints(),
            const SizedBox(height: 30),
            _buildSectionTitle('Diferentes Comportamentos'),
            _buildDifferentBehaviors(),
            const SizedBox(height: 30),
            _buildSectionTitle('Constraints no LayoutBuilder'),
            _buildLayoutBuilderExample(),
            const SizedBox(height: 30),
            _buildSectionTitle('Overflow e Constraints'),
            _buildOverflowExample(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTightConstraints() {
    return Container(
      color: Colors.blue[100],
      child: SizedBox(
        width: 200,
        height: 100,
        child: Container(
          color: Colors.red[300],
          child: const Center(child: Text('Tamanho Fixo 200x100')),
        ),
      ),
    );
  }

  Widget _buildLooseConstraints() {
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue[100],
      child: UnconstrainedBox(
        child: Container(
          width: 200,
          height: 50,
          color: Colors.green[300],
          child: const Center(child: Text('Sem Restrições do Pai')),
        ),
      ),
    );
  }

  Widget _buildDifferentBehaviors() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            color: Colors.orange,
            child: const Center(child: Text('Expanded')),
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          child: Container(
            height: 50,
            color: Colors.purple,
            child: const Center(child: Text('Flexible')),
          ),
        ),
      ],
    );
  }

  Widget _buildLayoutBuilderExample() {
    return Container(
      color: Colors.amber[100],
      width: double.infinity,
      height: 150,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Text(
              'Largura máxima: ${constraints.maxWidth.toStringAsFixed(1)}\n'
              'Altura máxima: ${constraints.maxHeight.toStringAsFixed(1)}\n'
              'Largura mínima: ${constraints.minWidth.toStringAsFixed(1)}\n'
              'Altura mínima: ${constraints.minHeight.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }

  Widget _buildOverflowExample() {
    return Column(
      children: [
        Container(
          width: 200,
          height: 50,
          color: Colors.blue[100],
          child: const Row(
            children: [
              Text(
                'Texto muito longo que vai extrapolar o container e causar overflow',
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 200,
          height: 50,
          color: Colors.green[100],
          child: const FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Texto longo mas com FittedBox'),
          ),
        ),
      ],
    );
  }
}
