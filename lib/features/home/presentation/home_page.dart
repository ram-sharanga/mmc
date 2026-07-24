import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push('/exercise_library'),
          child: const Text('Go To Program'),
        ),
      ),
    );
  }
}

class ProgramPage extends StatelessWidget {
  const ProgramPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Program: $id')));
  }
}