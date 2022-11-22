import 'package:flutter/material.dart';

class MinfinSplash extends StatefulWidget {
  final Future<void> Function(BuildContext context) setup;
  final WidgetBuilder builder;

  const MinfinSplash({
    Key? key,
    required this.setup,
    required this.builder,
  }) : super(key: key);

  @override
  State<MinfinSplash> createState() => _MinfinSplashState();
}

class _MinfinSplashState extends State<MinfinSplash> {
  @override
  void initState() {
    widget.setup(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);
}
