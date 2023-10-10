part of 'home_screen_widgets_imports.dart';

class HomeScreenNoteForm extends StatefulWidget {
  const HomeScreenNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreenNoteForm> createState() => _HomeScreenNoteFormState();
}

class _HomeScreenNoteFormState extends State<HomeScreenNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          SizedBox(height: 32.h),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            label: "Title",
            hint: "Add title here....",
          ),
          SizedBox(height: 16.h),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            label: "Content",
            hint: 'Add content here....',
            maxLines: 5,
          ),
          SizedBox(height: 32.h),
          const ColorsListView(),
          SizedBox(height: 32.h),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate = DateFormat('dd-MM-yyyy').format(currentDate);
                    var noteModel =
                        NoteModel(title: title!, subTitle: subTitle!, date: formattedCurrentDate, color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
