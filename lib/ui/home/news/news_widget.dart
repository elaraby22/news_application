import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/di/di.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/cubit/news_view_model.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/utils/app_colors.dart';
import 'cubit/news_states.dart';

class NewsWidget extends StatefulWidget {
  Source source;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsViewModel viewModel =
      NewsViewModel(newsRepository: injectNewsRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id ?? '');
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        BlocProvider(
          create: (context) => viewModel,
          child: BlocBuilder<NewsViewModel, NewsState>(
              buildWhen: (previous, current) => current is! NewsFromPagination,
              builder: (context, state) {
                if (state is NewsErrorState) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          state.errorMessage,
                          style: theme.textTheme.headlineLarge,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              viewModel
                                  .getNewsBySourceId(widget.source.id ?? '');
                            },
                            child: Text(
                              'Try Again',
                              style: theme.textTheme.headlineLarge,
                            ))
                      ],
                    ),
                  );
                } else if (state is NewsSuccessState) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification.metrics.pixels ==
                              notification.metrics.maxScrollExtent &&
                          notification is ScrollUpdateNotification) {
                        viewModel.getNewsBySourceId(widget.source.id ?? '',
                            fromLoading: true);
                      }
                      return true;
                    },
                    child: Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return NewsItem(news: viewModel.newsList![index]);
                        },
                        itemCount: viewModel.newsList!.length,
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.greyColor,
                    ),
                  );
                }
              }),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        BlocProvider(
          create: (context) => viewModel,
          child:
              BlocBuilder<NewsViewModel, NewsState>(builder: (context, state) {
            if (state is NewsFromPagination) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.greyColor,
                ),
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ),
        SizedBox(
          height: height * 0.02,
        )
      ],
    );
  }
}