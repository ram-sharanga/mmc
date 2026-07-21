import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomePage()),
    GoRoute(
      name: 'program',
      path: '/program/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return ProgramPage(id: id);
      },
    ),
  ],
);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          onPressed: () =>
              context.pushNamed('program', pathParameters: {'id': '96'}),
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
