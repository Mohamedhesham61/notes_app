part of 'home_screen_widgets_imports.dart';

class HomeScreenBody extends StatelessWidget {
  bool status = false;

  HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children:  [
            SizedBox(height: 50.h),
            const CustomAppBar(
              backButton: false,
              title: 'Notes',
              widget: SizedBox(),
            ),
            const Expanded(
              child: HomeScreenNotes(),
            ),
          ],
        ),
      ),
    );
  }
}
