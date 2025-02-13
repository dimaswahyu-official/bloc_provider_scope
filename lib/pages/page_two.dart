import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tutorial_bloc/pages/counter/counter_bloc.dart';
import 'package:tutorial_bloc/pages/page_three.dart';
import 'package:tutorial_bloc/theme_switcher.dart';

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

class RouteAccessPagewTwo extends StatelessWidget {
  const RouteAccessPagewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text("STATE BLOC 2"),
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text("$state", style: TextStyle(fontSize: 46));
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().decrement();
                },
                child: Text("DEC"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterBloc>().increment();
                },
                child: Text("INC"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
