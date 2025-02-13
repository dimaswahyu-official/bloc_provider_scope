import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/pages/page_two/bloc/counter_bloc.dart';
import 'package:tutorial_bloc/pages/page_three/page_three.dart';
import 'package:tutorial_bloc/widgets/theme_switcher.dart';

part './part/counter_view.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: PageTwoView(),
    );
  }
}

class PageTwoView extends StatelessWidget {
  const PageTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Two'), actions: [ThemeSwitcher()]),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder:
                            (_) => BlocProvider.value(
                              value: BlocProvider.of<CounterBloc>(context),
                              child: PageThree(),
                            ),
                      ),
                    );
                    // Navigator.of(context).pushNamed("/three");
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
