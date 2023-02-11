import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        if (index == 1) {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/config');
        }
      },
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            left: 16,
            right: 16,
            top: 28,
          ),
          child: Text(
            'Opções',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        NavigationDrawerDestination(
          icon: const Icon(Icons.sync),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Sincronizar'),
              const SizedBox(width: 16),
              Text(
                '12/04/2023 às 13:30h',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        const NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Configurações'),
        ),
      ],
    );
  }
}
