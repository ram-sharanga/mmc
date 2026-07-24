import 'package:flutter/material.dart';

import 'package:mmc/features/program/exercise.dart';

class ExerciseProvider extends ChangeNotifier {
  final List<Exercise> exercises = [
    Exercise(
      id: 1,
      name: 'Bench Press',
      primaryMuscle: 'Chest',
      equipment: 'Barbell',
    ),
    Exercise(
      id: 2,
      name: 'Shoulder Press',
      primaryMuscle: 'Shoulder',
      equipment: 'Dumbell',
    ),
  ];

  int _nextId = 1;

  void addExercise(Exercise exercise) {
    final exerciseWithId = exercise.copyWith(id: _nextId++);
    exercises.add(exerciseWithId);
    notifyListeners();
  }

  void updateExercise(Exercise exercise) {
    for (int i = 0; i < exercises.length; i++) {
      if (exercises[i].id == exercise.id) {
        exercises[i] = exercise;
      }
      notifyListeners();
    }
  }

  void removeExercise(Exercise exercise) {
    exercises.remove(exercise);
    notifyListeners();
  }
}
