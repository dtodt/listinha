import 'package:flutter/material.dart';
import 'package:listinha/src/home/widgets/task_board_card.dart';
import 'package:listinha/src/shared/services/realm/models/task_board_model.dart';
import 'package:listinha/src/shared/widgets/user_image_button.dart';
import 'package:realm/realm.dart';

import 'widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedOption = 0;

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
        child: Stack(
          children: [
            ListView.separated(
              itemBuilder: _cardItemBuilder,
              itemCount: 5,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 100,
              ),
              separatorBuilder: _cardSeparatorBuilder,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SegmentedButton<int>(
                  showSelectedIcon: false,
                  segments: const [
                    ButtonSegment(
                      value: 0,
                      label: FittedBox(child: Text('Todos')),
                    ),
                    ButtonSegment(
                      value: 1,
                      label: FittedBox(child: Text('Pendentes')),
                    ),
                    ButtonSegment(
                      value: 2,
                      label: FittedBox(child: Text('Concluídas')),
                    ),
                    ButtonSegment(
                      value: 3,
                      label: FittedBox(child: Text('Desativadas')),
                    ),
                  ],
                  selected: {selectedOption},
                  onSelectionChanged: (values) => setState(() {
                    selectedOption = values.first;
                  }),
                ),
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

  Widget? _cardItemBuilder(BuildContext context, int index) {
    final board = TaskBoard(
      Uuid.v4(),
      'Nova lista de tarefas 1',
      tasks: [
        Task(Uuid.v4(), '', completed: true),
        Task(Uuid.v4(), '', completed: true),
        Task(Uuid.v4(), ''),
        Task(Uuid.v4(), ''),
      ],
    );

    return TaskBoardCard(board: board);
  }

  Widget _cardSeparatorBuilder(BuildContext context, int index) =>
      const SizedBox(height: 24);
}
