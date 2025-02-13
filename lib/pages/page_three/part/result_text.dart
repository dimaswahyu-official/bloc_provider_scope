part of '../page_three.dart';

class ResultText extends StatelessWidget {
  const ResultText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTextBloc, String>(
      builder: (context, state) {
        return Container(
          width:
              MediaQuery.of(context).size.width > 380 ? 380 : double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Result Text",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              state.isEmpty
                  ? SizedBox()
                  : Text(
                    state,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
