import 'package:flutter/cupertino.dart';

enum WidgetType { page, dialog }

class MinfinSplashModel {
  final Widget widget;
  final WidgetType type;
  final bool checked;

  const MinfinSplashModel({
    required this.widget,
    this.type = WidgetType.page,
    this.checked = false,
  });
}
