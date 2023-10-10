part of 'edit_screen_imports.dart';

class EditNoteData{
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  late int currentIndex;
  String? noteTitle;
  String? noteSubTitle;

  void controllersValue({required String title, required String subTitle}){
    titleController.text = title;
    contentController.text = subTitle;
  }
}