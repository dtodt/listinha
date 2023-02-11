import 'package:flutter/material.dart';

import 'package:listinha/src/shared/widgets/user_image_button.dart';

import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: UserImageButton(),
          )
        ],
        title: const Text('LISTINHA'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: SegmentedButton<int>(
                segments: const [
                  ButtonSegment(value: 0, label: Text('Todos')),
                  ButtonSegment(value: 1, label: Text('Pendentes')),
                  ButtonSegment(value: 2, label: Text('Concluídas')),
                  ButtonSegment(value: 3, label: Text('Desativadas')),
                ],
                selected: const {1},
                onSelectionChanged: (values) {},
              ),
            ),
          ],
        ),
      ),
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.edit),
        label: const Text('Nova Lista'),
        onPressed: () {
          Navigator.of(context).pushNamed('./edit');
        },
      ),
    );
  }
}
