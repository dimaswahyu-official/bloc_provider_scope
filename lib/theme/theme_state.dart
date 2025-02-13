part of 'theme_bloc.dart';

class ThemeState {
  final bool isDark;
  ThemeState({required this.isDark});

  ThemeState copyWith({bool? isDark}) {
    return ThemeState(isDark: isDark ?? this.isDark);
  }
}
