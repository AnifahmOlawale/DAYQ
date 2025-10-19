import 'package:flutter/material.dart';

class ThemeColor extends ChangeNotifier {
  //Colour Theme
  final Color _primaryColour = Color.fromRGBO(152, 90, 254, 1);
  final Color _secondaryColour = Color.fromRGBO(4, 5, 35, 1);
  final Color _backgroundColour = Color.fromRGBO(4, 5, 35, 1);
  final Color _cardColour = Color.fromRGBO(4, 5, 35, 1);
  final Color _cardOutlineColour = Color.fromRGBO(152, 90, 254, 1);
  final Color _playerCardColour = Color.fromRGBO(255, 65, 128, 0.833);
  final Color _playerPageColour = Color.fromRGBO(4, 5, 35, 1);
  final Color _quranBackgroundColour = Color.fromRGBO(4, 5, 35, 1);
  final Color _quranTextColour = Colors.white;
  final Color _quranTransColour = Color.fromRGBO(152, 90, 254, 1);
  final Color _textColour = Colors.white;
  final Color _controlColour = Color.fromRGBO(152, 90, 254, 1);

  //ThemeData
  //ThemeData _theme = ThemeData.dark(useMaterial3: true);
  final ThemeData _theme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromRGBO(152, 90, 254, 1),
      primary: Color.fromRGBO(152, 90, 254, 1),
      secondary: Color.fromRGBO(4, 5, 35, 1),
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
  final ThemeMode _themeMode = ThemeMode.dark;

  final Color _themeDesign = Color.fromRGBO(152, 90, 254, 1);
  final Color _selectedCardColour = Color.fromRGBO(255, 65, 128, 1);
  final Color _selectedTextColour = Colors.white;

  late Color? _primary;
  late Color _secondary;
  late Color? _background;
  late Color? _card;
  late Color _cardOutline;
  late Color? _playerCard;
  late Color? _playerPage;
  late Color? _quranBackground;
  late Color _quranText;
  late Color _quranTrans;
  late Color _text;
  late Color _control;

  ThemeColor() {
    _primary = _primaryColour;
    _secondary = _secondaryColour;
    _background = _backgroundColour;
    _card = _cardColour;
    _cardOutline = _cardOutlineColour;
    _playerCard = _playerCardColour;
    _playerPage = _playerPageColour;
    _quranBackground = _quranBackgroundColour;
    _quranText = _quranTextColour;
    _quranTrans = _quranTransColour;
    _text = _textColour;
    _control = _controlColour;
  }

  Color? get primary => _primary;
  Color get secondary => _secondary;
  Color? get background => _background;
  Color? get card => _card;
  Color get cardOutline => _cardOutline;
  Color? get playerCard => _playerCard;
  Color? get playerPage => _playerPage;
  Color? get quranBackground => _quranBackground;
  Color get quranText => _quranText;
  Color get quranTrans => _quranTrans;
  Color get text => _text;
  Color get control => _control;
  Color get selectedCardColour => _selectedCardColour;
  Color get selectedTextColour => _selectedTextColour;

  ThemeData get theme => _theme;
  ThemeMode get themeMode => _themeMode;

  Color get themeDesign => _themeDesign;
}
