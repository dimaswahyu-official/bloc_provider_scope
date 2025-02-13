part of '../page_three.dart';

class EditForm extends StatelessWidget {
  const EditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTextBloc, String>(
      builder: (context, state) {
        return Container(
          width:
              MediaQuery.of(context).size.width > 380 ? 380 : double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: TextFormField(
            initialValue: state,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
