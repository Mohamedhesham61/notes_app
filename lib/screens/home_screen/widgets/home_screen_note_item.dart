part of 'home_screen_widgets_imports.dart';

class HomeScreenNoteItem extends StatelessWidget {
  final NoteModel note;

  const HomeScreenNoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditScreenView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.only(left: 16.w, top: 24.h, bottom: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: TextStyle(
                  fontSize: 26.sp,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  customAlertDialog(
                    context: context,
                    title: "Discard Note",
                    desc: "Are you sure you want to discard this note..?",
                    rightButtonTitle: "Discard",
                    rightButtonOnTap: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                      Navigator.pop(context);
                    },
                    leftButtonTitle: "Cancel",
                    leftButtonOnTap: () => Navigator.pop(context),
                  );
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
