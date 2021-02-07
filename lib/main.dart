import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_search/api/search_client.dart';
import 'package:test_app_search/api/search_repository.dart';
import 'package:test_app_search/bloc/search_bloc.dart';
import 'package:test_app_search/styles/custom_themes.dart';
import 'package:test_app_search/views/screens/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        searchRepository: SearchRepository(
          SearchClient(),
        ),
      ),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: kAppBarTheme,
          inputDecorationTheme: kInputDecorationTheme,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
