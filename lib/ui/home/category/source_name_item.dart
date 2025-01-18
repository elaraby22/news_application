import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';

class SourceNameItem extends StatelessWidget {
  Source source;
  bool isSelected;

  SourceNameItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Text(
      source.name ?? '',
      style:
          isSelected ? theme.textTheme.labelLarge : theme.textTheme.labelMedium,
    );
  }
}
