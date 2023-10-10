part of 'edit_screen_imports.dart';

class EditScreenView extends StatefulWidget {
  final NoteModel note;

  const EditScreenView({Key? key, required this.note}) : super(key: key);

  @override
  State<EditScreenView> createState() => _EditScreenViewState();
}

class _EditScreenViewState extends State<EditScreenView> {
  EditNoteData editNoteData = EditNoteData();

  @override
  void initState() {
    editNoteData.controllersValue(title: widget.note.title, subTitle: widget.note.subTitle);
    editNoteData.currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteBody(
        note: widget.note,
        editNoteData: editNoteData,
      ),
    );
  }
}
