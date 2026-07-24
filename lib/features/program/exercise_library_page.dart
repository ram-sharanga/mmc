import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:mmc/features/program/exercise.dart';
import 'package:mmc/providers/exercise_provider.dart';

class ExerciseLibraryPage extends StatefulWidget {
  const ExerciseLibraryPage({super.key});

  @override
  State<ExerciseLibraryPage> createState() => _ExerciseLibraryPageState();
}

class _ExerciseLibraryPageState extends State<ExerciseLibraryPage> {
  @override
  Widget build(BuildContext context) {
    final exerciseProvider = context.watch<ExerciseProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Exercise Library')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Exercises',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: exerciseProvider.exercises.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(exerciseProvider.exercises[index].name),
                    subtitle: Text(
                      exerciseProvider.exercises[index].primaryMuscle,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () async {
                            final exercise = await context.push<Exercise>(
                              '/exercise_library/edit_exercise',
                              extra: exerciseProvider.exercises[index],
                            );

                            if (exercise != null) {
                              exerciseProvider.updateExercise(exercise);
                            }
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            exerciseProvider.removeExercise(
                              exerciseProvider.exercises[index],
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final exercise = await context.push<Exercise>(
            '/exercise_library/create_exercise',
          );

          if (exercise != null) {
            exerciseProvider.addExercise(exercise);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
