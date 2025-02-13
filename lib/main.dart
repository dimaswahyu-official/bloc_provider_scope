import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/bloc/theme/theme_bloc.dart';
import 'package:tutorial_bloc/pages/page_one/page_one.dart';
import 'package:tutorial_bloc/pages/page_three/page_three.dart';
import 'package:tutorial_bloc/pages/page_two/page_two.dart';

GlobalKey<NavigatorState> globalContext = GlobalKey<NavigatorState>();

void main() {
  runApp(const Apps());
}

class Apps extends StatelessWidget {
  const Apps({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeBloc())],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          navigatorKey: globalContext,
          theme: state.isDark ? ThemeData.dark() : ThemeData.light(),
          routes: {
            '/': (context) => const PageOne(),
            '/two': (context) => const PageTwo(),
            '/three': (context) => const PageThree(),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
