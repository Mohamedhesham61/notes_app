part of 'edit_screen_widgets_imports.dart';

class EditScreenColorsList extends StatefulWidget {
  final NoteModel note;
  final EditNoteData editNoteData;

  const EditScreenColorsList({super.key, required this.note, required this.editNoteData});

  @override
  State<EditScreenColorsList> createState() => _EditScreenColorsListState();
}

class _EditScreenColorsListState extends State<EditScreenColorsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.h * 2,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: GestureDetector(
              onTap: () {
                widget.editNoteData.currentIndex = index;
                widget.note.color = kColors[index].value;
                setState(() {});
              },
              child: CustomColorsList(
                color: kColors[index],
                isActive: widget.editNoteData.currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
