import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSplash extends StatelessWidget {
  const AppSplash(
      {super.key,
      this.backgroundColor,
      this.centerWidget,
      this.backgroundWidget,
      this.bottomWidget,
      this.centerWidgetPadding = 0,
      this.bottomWidgetPadding = 0,
      this.seconds = 2,
      required this.onEnd});

  final Color? backgroundColor;
  final Widget? centerWidget;
  final Widget? backgroundWidget;
  final Widget? bottomWidget;
  final double centerWidgetPadding;
  final double bottomWidgetPadding;
  final int seconds;
  final Function() onEnd;

  _splash() async {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    await Future.delayed(Duration(seconds: seconds));
    onEnd();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
  }

  @override
  Widget build(BuildContext context) {
    _splash();
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      body: Stack(
        children: [
          backgroundWidget ?? const SizedBox(),
          bottomWidget == null
              ? const SizedBox()
              : SafeArea(
                  child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: bottomWidgetPadding),
                    child: bottomWidget,
                  ),
                )),
          centerWidget == null
              ? const SizedBox()
              : Center(
                  child: Padding(
                  padding: EdgeInsets.only(bottom: centerWidgetPadding),
                  child: centerWidget,
                ))
        ],
      ),
    );
  }
}
