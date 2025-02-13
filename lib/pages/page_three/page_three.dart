import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/pages/page_three/bloc/editext_bloc.dart';
import 'package:tutorial_bloc/pages/page_two/page_two.dart';
import 'package:tutorial_bloc/widgets/theme_switcher.dart';

part './part/edit_form.dart';
part './part/result_text.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditTextBloc(),
      child: PageThreeView(),
    );
  }
}

class PageThreeView extends StatelessWidget {
  const PageThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Three'),
        actions: [ThemeSwitcher()],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ResultText(),
              EditForm(),
              SizedBox(height: 24),
              CounterView(),
              SizedBox(height: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Prev"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
