import 'package:flutter/material.dart';
import 'package:test_app_search/styles/custom_colors.dart';
import 'package:test_app_search/styles/text_styles.dart';

const kAppBarTheme = AppBarTheme(
  color: Colors.white,
  elevation: 0,
  textTheme: TextTheme(headline6: kAppBarTitleStyle),
  iconTheme: IconThemeData(color: Colors.black),
);

const kInputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: Colors.white,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorDFDFDF,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: kColorDFDFDF,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(50),
    ),
  ),
);
