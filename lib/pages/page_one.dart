import 'package:flutter/material.dart';
import 'package:tutorial_bloc/theme_switcher.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page One'), actions: [ThemeSwitcher()]),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/two");
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}
