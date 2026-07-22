import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JournalPage extends StatelessWidget {
  const JournalPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: Column(
        children: [
          const Text('Journal'),
          ElevatedButton(
            onPressed: () => context.push('/journal/entry'),
            child: const Text("Add Entry"),
          ),
        ],
      ),
    ),
  );
}