import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/di/di.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/model/category_model.dart';
import 'package:news/ui/home/category/cubit/source_states.dart';
import 'package:news/ui/home/category/cubit/source_view_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:news/utils/app_colors.dart';

class CategoryDetails extends StatefulWidget {
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  SourceViewModel viewModel =
      SourceViewModel(sourceRepository: injectSourceRepository());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourceState>(
        bloc: viewModel,
        builder: (context, state) {
          if (state is SourceErrorState) {
            return Column(
              children: [
                Text(state.errorMessage),
                ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category.id);
                    },
                    child: const Text('Try again'))
              ],
            );
          } else if (state is SourceSuccessState) {
            return SourceTabWidget(sourcesList: state.sourcesList);
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          }
        });
  }
}