import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/pages/counter/editext.dart';
import 'package:tutorial_bloc/pages/page_two.dart';
import 'package:tutorial_bloc/theme_switcher.dart';

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            HasilEdit(),
            EditForm(),
            RouteAccessPagewTwo(),
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
    );
  }
}

class EditForm extends StatelessWidget {
  const EditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTextBloc, String>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: TextFormField(
            initialValue: state,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Input Text',
            ),
            onChanged: (value) {
              context.read<EditTextBloc>().edit(value);
            },
          ),
        );
      },
    );
  }
}

class HasilEdit extends StatelessWidget {
  const HasilEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTextBloc, String>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Text(
            state,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
