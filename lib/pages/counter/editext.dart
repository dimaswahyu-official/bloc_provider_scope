import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/main.dart';
import 'package:tutorial_bloc/theme/theme_bloc.dart';

class EditTextBloc extends Cubit<String> {
  EditTextBloc() : super("");
  void edit(String newText) {
    emit(newText);
    globalContext.currentContext!.read<ThemeBloc>().add(
      ThemeSetIsDark(isDark: newText.length > 5),
    );
  }
}
