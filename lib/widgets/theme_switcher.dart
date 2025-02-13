import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/bloc/theme/theme_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Switch(
          value: state.isDark,
          onChanged: (value) {
            context.read<ThemeBloc>().add(ThemeSetIsDark(isDark: value));
          },
        );
      },
    );
  }
}
