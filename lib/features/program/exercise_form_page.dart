import 'package:flutter/material.dart';

import 'package:mmc/features/program/exercise.dart';

class ExerciseFormPage extends StatefulWidget {
  const ExerciseFormPage({super.key, required this.titleText, this.exercise});
  final String titleText;
  final Exercise? exercise;

  @override
  State<ExerciseFormPage> createState() => _ExerciseFormPageState();
}

class _ExerciseFormPageState extends State<ExerciseFormPage> {
  late final TextEditingController nameController;
  late final TextEditingController primaryMuscleController;
  late final TextEditingController equipmentController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.exercise?.name ?? '');
    primaryMuscleController = TextEditingController(
      text: widget.exercise?.primaryMuscle ?? '',
    );
    equipmentController = TextEditingController(
      text: widget.exercise?.equipment ?? '',
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    primaryMuscleController.dispose();
    equipmentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.titleText)),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(labelText: 'Exercise name'),
          ),
          TextField(
            controller: primaryMuscleController,
            decoration: const InputDecoration(labelText: 'Primary Muscle'),
          ),
          TextField(
            controller: equipmentController,
            decoration: const InputDecoration(labelText: 'Equipment'),
          ),
          Spacer(),
          FilledButton(
            onPressed: () {
              if (nameController.text.trim().isEmpty) {
                return;
              }

              if (primaryMuscleController.text.trim().isEmpty) {
                return;
              }

              final exercise = Exercise(
                id: widget.exercise?.id ?? -1,
                name: nameController.text.trim(),
                primaryMuscle: primaryMuscleController.text.trim(),
                equipment: equipmentController.text.trim().isEmpty
                    ? null
                    : equipmentController.text.trim(),
              );

              Navigator.pop(context, exercise);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
