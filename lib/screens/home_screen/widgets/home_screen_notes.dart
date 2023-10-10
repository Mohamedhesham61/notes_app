part of 'home_screen_widgets_imports.dart';

class HomeScreenNotes extends StatelessWidget {
  const HomeScreenNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return notes.isNotEmpty
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: ListView.builder(
                    itemCount: notes.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: HomeScreenNoteItem(
                          note: notes[index],
                        ),
                      );
                    }),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/noNotes.png",
                    scale: 1.5,
                  ),
                  const Text("Create your first note!"),
                ],
              );
      },
    );
  }
}
