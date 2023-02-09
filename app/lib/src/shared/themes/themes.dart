import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get darkTheme => ThemeData(
      colorScheme: _darkColorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
    );

ThemeData get lightTheme => ThemeData(
      colorScheme: _lightColorScheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
    );
