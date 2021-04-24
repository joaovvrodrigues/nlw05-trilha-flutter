import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/core.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final int score;
  const ChartWidget({Key? key, required this.score}) : super(key: key);
  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation =
        Tween(begin: 0.0, end: widget.score.toDouble()).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    _initAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => Stack(
          children: [
            Center(
              child: Container(
                height: 80,
                width: 80,
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                  value: (_animation.value / 100).abs(),
                  valueColor:
                      AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  backgroundColor: AppColors.chartSecondary,
                ),
              ),
            ),
            Center(
              child: Text(
                '${(_animation.value).toStringAsFixed(0)}%',
                style: AppTextStyles.heading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
