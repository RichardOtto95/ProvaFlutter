// ignore_for_file: depreecated_member_use

import 'package:flutter/material.dart';

const primaryLight = Color(0xff1B4D64);
const primaryVariantLight = Color(0xff1363DF);
const secondaryLight = Color(0xff2E978D);
const secondaryVariantLight = Color(0xffDFF6FF);
const tertiaryLight = Color(0xff06283D);

const surfaceLight = Color(0xfffcfcfc);
const backgroundLight = Color(0xfffcfcfc);
const onBackgroundLight = Color(0xff4B4B4B);
const onSurfaceLight = Color(0xff848484);

const primaryContainerLight = Color(0xffd9d9d9);
const onPrimaryContainerLight = Color(0xffD3D3D3);
const onSurfaceVariantLight = Color(0xffEFEFEF);
const secondaryContainerLight = Color(0xff676767);

const shadowLight = Color.fromRGBO(0, 0, 0, 0.16);

ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      primary: primaryLight,
      onPrimary: Colors.white,
      secondary: secondaryLight,
      onSecondary: Colors.white,
      tertiary: tertiaryLight,
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.white,
      background: backgroundLight,
      onBackground: onBackgroundLight,
      surfaceVariant: const Color(0x00EEEEEE),
      outline: onBackgroundLight.withOpacity(.6),
      surface: surfaceLight,
      onSurface: onSurfaceLight,
      shadow: shadowLight,
      onSurfaceVariant: onSurfaceVariantLight,
      primaryContainer: primaryContainerLight,
      onPrimaryContainer: onPrimaryContainerLight,
      secondaryContainer: secondaryContainerLight,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: surfaceLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 47,
          ),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xff016EAF),
      centerTitle: true,
      // toolbarHeight: 57,
      shadowColor: Color(0x1E000000),
      elevation: 3,
    ),
    buttonTheme: const ButtonThemeData(
      minWidth: 200,
      buttonColor: Color(0xff44BD6E),
    ),
    iconTheme: const IconThemeData(
      opacity: 1,
      color: Colors.white,
      size: 30.0,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: primaryLight,
        fontSize: 16,
      ),
      bodyLarge: TextStyle(
        color: primaryLight,
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 15,
      ),
      displaySmall: TextStyle(
        color: onSurfaceLight,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
        color: onSurfaceLight,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      displayLarge: TextStyle(
        color: onBackgroundLight,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      labelLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      labelMedium: TextStyle(
        color: primaryLight,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      titleSmall: TextStyle(
        color: primaryLight,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      titleLarge: TextStyle(
        color: primaryLight,
        fontWeight: FontWeight.w500,
        fontSize: 23,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isCollapsed: true,
      hintStyle: TextStyle(
        fontSize: 14,
        color: primaryContainerLight,
      ),
      border: InputBorder.none,
      isDense: true,
    ),
    actionIconTheme: const ActionIconThemeData());

const primaryDark = Color(0xFF1B4D64);
const onPrimaryDark = Color(0xFFFFFFFF);
const primaryVariantDark = Color(0xFF00314E);
const secondaryDark = Color(0xFF2E978D);
const secondaryVariantDark = Color.fromARGB(255, 0, 41, 58);
const tertiaryDark = Color(0xff06283D);

const backgroundDark = Color.fromARGB(255, 32, 32, 32);
const onBackgroundDark = Color.fromARGB(255, 219, 219, 219);
const surfaceDark = Color.fromARGB(255, 48, 48, 48);
const onSurfaceDark = Color.fromARGB(255, 187, 187, 187);

const primaryContainerDark = Color.fromARGB(255, 73, 73, 73);
const onPrimaryContainerDark = Color.fromARGB(255, 134, 134, 134);
const onSurfaceVariantDark = Color.fromARGB(255, 56, 56, 56);
const secondaryContainerDark = Color(0xFFA3A3A3);

const shadowDark = Color(0x28FFFFFF);

ThemeData darkTheme() => ThemeData(
      brightness: Brightness.dark,
      colorScheme: ColorScheme(
        primary: primaryDark,
        onPrimary: onPrimaryDark,
        secondary: secondaryDark,
        onSecondary: Colors.white,
        tertiary: tertiaryDark,
        brightness: Brightness.dark,
        error: Colors.red,
        onError: Colors.white,
        background: backgroundDark,
        onBackground: onBackgroundDark,
        surfaceVariant: const Color(0x00EEEEEE),
        outline: onBackgroundDark.withOpacity(.6),
        surface: surfaceDark,
        onSurface: onSurfaceDark,
        shadow: shadowDark,
        onSurfaceVariant: onSurfaceVariantDark,
        primaryContainer: primaryContainerDark,
        onPrimaryContainer: onPrimaryContainerDark,
        secondaryContainer: secondaryContainerDark,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: surfaceDark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 47,
            ),
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff016EAF),
        centerTitle: true,
        // toolbarHeight: 57,
        shadowColor: Color(0x1E000000),
        elevation: 3,
      ),
      buttonTheme: const ButtonThemeData(),
      iconTheme: const IconThemeData(
        opacity: 1,
        color: Colors.white,
        size: 30.0,
      ),
      tabBarTheme: const TabBarTheme(
        labelColor: onPrimaryDark,
        indicatorColor: Colors.white,
        dividerColor: onPrimaryDark,
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: primaryDark,
          fontSize: 16,
        ),
        bodyLarge: TextStyle(
          color: primaryDark,
          fontSize: 18,
        ),
        bodySmall: TextStyle(
          color: onBackgroundDark,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        displaySmall: TextStyle(
          color: onSurfaceDark,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        displayMedium: TextStyle(
          color: onSurfaceDark,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        displayLarge: TextStyle(
          color: onBackgroundDark,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        labelLarge: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        labelMedium: TextStyle(
          color: onSurfaceDark,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        titleSmall: TextStyle(
          color: primaryDark,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        titleMedium: TextStyle(
          color: onPrimaryDark,
          fontWeight: FontWeight.w500,
          fontSize: 22,
        ),
        titleLarge: TextStyle(
          color: primaryDark,
          fontWeight: FontWeight.w500,
          fontSize: 23,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        isCollapsed: true,
        hintStyle: TextStyle(
          fontSize: 14,
          color: primaryContainerDark,
        ),
        border: InputBorder.none,
        isDense: true,
      ),
    );
