import 'package:flutter/material.dart';

import 'package:app3/widgets/expenses.dart';
import 'package:flutter/services.dart';


var kcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 9, 99, 125));

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  /*SystemChrome.setPreferredOrientations(
    [
        DeviceOrientation.portraitUp
    ]
  ).then((fn) {

  });*/
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
            color: kDarkColorScheme.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColorScheme.primaryContainer,
                foregroundColor: kDarkColorScheme.onPrimaryContainer
            )
        ),),
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolorScheme,
          appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kcolorScheme.onPrimaryContainer,
              foregroundColor: kcolorScheme.primaryContainer
          ),
          cardTheme: const CardTheme().copyWith(
              color: kcolorScheme.secondaryContainer,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: kcolorScheme.primaryContainer
              )
          ),
          textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kcolorScheme.onSecondaryContainer,

              )
          )
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );

}