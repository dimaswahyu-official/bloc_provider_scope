part of '../page_two.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

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
          Text("Counter Bloc"),
          BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text(
                "$state",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              );
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
