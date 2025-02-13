part of 'theme_bloc.dart';

@immutable
sealed class ThemeEvent {}

class ThemeSetIsDark extends ThemeEvent {
  final bool isDark;
  ThemeSetIsDark({required this.isDark});
}
