import 'package:flutter/material.dart';

import 'package:mmc/app/router.dart';

class MMCApp extends StatelessWidget {
  const MMCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
