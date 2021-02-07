import 'package:flutter/material.dart';
import 'package:test_app_search/styles/custom_colors.dart';
import 'package:test_app_search/styles/text_styles.dart';
import 'package:test_app_search/views/components/components.dart';
import 'package:test_app_search/views/screens/result_screen/result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ПОИСК'),
        bottom: kAppBarDivider,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, top: 135),
        child: TextField(
          onChanged: (value) {
            _query = value;
          },
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultScreen(_query != null ? _query : ''),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(right: 4),
                height: 42,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kColor58AFFF,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  'Найти'.toUpperCase(),
                  style: kSFSemiBold12ColorWhite,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
