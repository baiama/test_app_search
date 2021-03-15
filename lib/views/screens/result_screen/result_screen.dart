import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_search/models/search_result_item.dart';
import 'package:test_app_search/styles/custom_colors.dart';
import 'package:test_app_search/styles/text_styles.dart';
import 'package:test_app_search/views/components/components.dart';
import 'package:test_app_search/views/screens/home/bloc/search_bloc.dart';
import 'package:test_app_search/views/screens/home/bloc/search_event.dart';
import 'package:test_app_search/views/screens/home/bloc/search_state.dart';

class ResultScreen extends StatefulWidget {
  final String query;

  ResultScreen(this.query);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = BlocProvider.of<SearchBloc>(context, listen: false);
    _searchBloc.add(OnSearch(text: widget.query));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('РЕЗУЛЬТАТ ПОИСКА'),
        bottom: kAppBarDivider,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (BuildContext context, state) {
          if (state is SearchStateEmpty) {
            return ResultCountItem(
              query: widget.query,
              count: 0,
            );
          }
          if (state is SearchStateLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SearchStateError) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is SearchStateSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) {
                if (index == 0) {
                  return ResultCountItem(
                    query: widget.query,
                    count: state.items.length,
                  );
                }
                return SearchResultListItem(state.items[index - 1]);
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 16);
              },
              itemCount: state.items.length + 1,
            );
          }
          return Container();
        },
      ),
    );
  }
}

class SearchResultListItem extends StatelessWidget {
  final SearchResultItem item;

  SearchResultListItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: kColorDFDFDF,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          item.fullName,
                          style: kSFSemiBold12ColorBlack,
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item.owner.avatarUrl),
                                  fit: BoxFit.cover,
                                ),
                                color: Colors.green,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                item.owner.login,
                                style: kSFReg10ColorBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                    decoration: BoxDecoration(
                        color: kColorA6A6A6,
                        borderRadius: BorderRadius.circular(50)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star_outline,
                          color: Colors.white,
                          size: 16,
                        ),
                        SizedBox(width: 4),
                        Text(
                          '${item.stargazersCount}',
                          style: kSFSemiBold10ColorWhite,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Divider(
                color: kColorDFDFDF,
                thickness: 1,
              ),
              RichText(
                text: TextSpan(
                  text: 'Обновлено: ',
                  style: kSFReg10ColorA6A6A6,
                  children: [
                    TextSpan(
                      text: item.date,
                      style: kSFReg10ColorBlack,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ResultCountItem extends StatelessWidget {
  final String query;
  final int count;

  ResultCountItem({this.query, this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 19),
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'по запросу: ',
          style: kSFSemiBold10ColorA6A6A6,
          children: [
            TextSpan(
              text: '“$query”',
              style: kSFSemiBold10Color58AFFF,
            ),
            TextSpan(
              text: '\n\nНайдено: $count',
            ),
          ],
        ),
      ),
    );
  }
}
