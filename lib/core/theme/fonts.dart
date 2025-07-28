part of 'app_theme.dart';

class _Fonts {
  final _mainFont = GoogleFonts.dmSans();

  TextTheme get defaultTextTheme {
    return TextTheme(
      headlineLarge: _mainFont.copyWith(
        fontSize: 27,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: _mainFont.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: _mainFont.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: _mainFont.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      // caption: _mainFont.copyWith(
      //   fontSize: 11,
      //   fontWeight: FontWeight.normal,
      // ),
    );
  }
}
