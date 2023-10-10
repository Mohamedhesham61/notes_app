part of 'home_screen_widgets_imports.dart';

class HomeScreenBottomSheet extends StatelessWidget {
  const HomeScreenBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: BlocProvider(
        create: (context) => AddNoteCubit(),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {}

            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.h, bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const SingleChildScrollView(
                  child: HomeScreenNoteForm(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
