import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_bloc.dart';
import 'package:to_do_list/features/home/presentation/bloc/home_event.dart';
import '../../../../core/shared/widgets/custom_checkbox.dart';
import '../../../../core/shared/widgets/custom_text_field.dart';
import '../../../../core/shared/widgets/custom_date_picker.dart';
import '../bloc/home_state.dart';
import '../views/home_page.dart';

class AddPostWidget extends StatelessWidget {
  const AddPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Center(
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              LottieBuilder.asset('assets/Animation/Animation-2.json',
                  height: 200),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  CustomTextField(
                    txt: 'Title',
                    controller: bloc.title,
                  ),
                  CustomTextField(
                    maxLines: 3,
                    txt: 'Body',
                    controller: bloc.body,
                  ),
                  CustomDatePicker(
                    datePicker: DateTime.parse(
                        state.selectedDate ?? DateTime.now().toString()),
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));

                      if (picked != null) {
                        bloc.add(UpdateDate(pickedValue: picked));
                      }
                    },
                    txt: state.selectedDate ?? DateTime.now().toString(),
                  ),
                  CustomCheckbox(
                    fontSize: 24,
                    checkBoxValue: state.isChecked,
                    pad: 15,
                    onChanged: (bool? value) {
                      context
                          .read<HomeBloc>()
                          .add(UpdateCheckbox(isChecked: value ?? false));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (bloc.formKey.currentState!.validate()) {
                    context.read<HomeBloc>().add(AddPost());
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Add Post',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
