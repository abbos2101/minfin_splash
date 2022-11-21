import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'minfin_splash_model.dart';

class MinfinSplash extends StatefulWidget {
  final Future<MinfinSplashModel> Function(BuildContext context) setup;
  final Function(BuildContext context, MinfinSplashModel model) onNext;
  final WidgetBuilder builder;
  final Function()? dispose;
  final bool debugWaiting;
  final Duration duration;

  const MinfinSplash({
    Key? key,
    required this.setup,
    required this.onNext,
    required this.builder,
    this.dispose,
    this.debugWaiting = false,
    this.duration = const Duration(seconds: 2),
  }) : super(key: key);

  @override
  State<MinfinSplash> createState() => _MinfinSplashState();
}

class _MinfinSplashState extends State<MinfinSplash> {
  @override
  void initState() {
    load();
    super.initState();
  }

  Future<void> load() async {
    final start = DateTime.now();
    final model = await widget.setup(context);
    if (widget.debugWaiting || kReleaseMode) {
      final difference = DateTime.now().difference(start);
      if (difference < widget.duration) {
        await Future.delayed(widget.duration - difference);
      }
    }
    if (mounted) widget.onNext(context, model);
  }

  @override
  void dispose() {
    widget.dispose?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.builder(context);
}
