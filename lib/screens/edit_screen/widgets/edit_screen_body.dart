part of 'edit_screen_widgets_imports.dart';

class EditNoteBody extends StatelessWidget {
  final NoteModel note;
  final EditNoteData editNoteData;

  const EditNoteBody({Key? key, required this.note, required this.editNoteData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: editNoteData.formKey,
      autovalidateMode: editNoteData.autoValidateMode,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            CustomAppBar(
              backButton: true,
              title: 'Edit Note',
              widget: Container(
                height: 46.h,
                width: 46.h,
                decoration: BoxDecoration(color: Colors.white.withOpacity(.05), borderRadius: BorderRadius.circular(16)),
                child: IconButton(
                  onPressed: () {
                    note.title = editNoteData.noteTitle ?? note.title;
                    note.subTitle = editNoteData.noteSubTitle ?? note.subTitle;
                    note.save();
                    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.save,
                    size: 28.h,
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.h),
            CustomTextField(
              onChanged: (value) {
                editNoteData.noteTitle = value;
              },
              label: "Title",
              hint: note.title,
              controller: editNoteData.titleController,
            ),
            SizedBox(height: 16.h),
            CustomTextField(
              onChanged: (value) {
                editNoteData.noteSubTitle = value;
              },
              label: "Content",
              hint: note.subTitle,
              controller: editNoteData.contentController,
              maxLines: 5,
            ),
            SizedBox(height: 16.h),
            EditScreenColorsList(
              note: note,
              editNoteData: editNoteData,
            ),
          ],
        ),
      ),
    );
  }
}
