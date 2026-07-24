import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:mmc/app/app.dart';
import 'package:mmc/providers/exercise_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ExerciseProvider(),
      child: const MMCApp(),
    ),
  );
}
