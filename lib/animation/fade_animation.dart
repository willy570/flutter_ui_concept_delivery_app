import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final MovieTween tween = MovieTween()
      ..scene(duration: const Duration(milliseconds: 500))
          .tween('opacity', Tween(begin: 0.0, end: 1.0))
      ..scene(duration: const Duration(microseconds: 500)).tween(
          'translateX', Tween(begin: 120.0, end: 0.0),
          curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      builder: (context, value, child) => Opacity(
        opacity: value.get('opacity'),
        child: Transform.translate(
          offset: Offset(value.get('translateX'), 0),
          child: child,
        ),
      ),
      child: child,
    );
  }
}
