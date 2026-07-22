import 'package:go_router/go_router.dart';

import 'package:mmc/app/navigation_shell.dart';
import 'package:mmc/features/home/presentation/home_page.dart';
import 'package:mmc/features/journal/presentation/journal_page.dart';
import 'package:mmc/features/journal/presentation/entry_page.dart';
import 'package:mmc/features/roadmap/presentation/roadmap_page.dart';

final router = GoRouter(
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          NavigationShellPage(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/', builder: (_, _) => const HomePage())],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/journal',
              builder: (_, _) => const JournalPage(),
              routes: [
                GoRoute(path: 'entry', builder: (_, _) => const EntryPage()),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(path: '/roadmap', builder: (_, _) => const RoadmapPage()),
          ],
        ),
      ],
    ),
  ],
);


