import 'package:flutter/material.dart';

class SimpleListTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget leading;
  final Color tileColor;
  final Color circleColor;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final double circleDiameter;
  final Gradient? gradient;
  final VoidCallback? onTap;

  const SimpleListTile({
    required this.title,
    this.subtitle,
    this.trailing,
    this.tileColor = Colors.grey,
    this.circleColor = Colors.white,
    this.padding = const EdgeInsets.all(8),
    required this.borderRadius,
    required this.leading,
    this.circleDiameter = 80,
    this.gradient,
    required this.onTap,
    super.key
  });
  @override
  Widget build(BuildContext context) {
    final double _circleDiameter = circleDiameter > 100 ? 80 : circleDiameter;

    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          // color: Colors.blue,
          padding: EdgeInsets.only(right: 0),
          child: LayoutBuilder(builder: (context, constraints) {
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: _circleDiameter + 10,
                  margin: EdgeInsets.only(left: 40),
                  padding: padding,
                  decoration: BoxDecoration(
                    color: tileColor,
                    borderRadius: borderRadius,
                    gradient: gradient,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: _circleDiameter - 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              title,
                              SizedBox(
                                height: 5.0,
                              ),
                              subtitle ?? SizedBox.shrink(),
                            ],
                          ),
                        ),
                        trailing ?? SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: -constraints.maxWidth + _circleDiameter,
                  // top: 15,
                  right: 0,
                  // bottom: 40,
                  child: Container(
                    height: _circleDiameter,
                    width: _circleDiameter,
                    // clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: circleColor,
                      shape: BoxShape.circle,
                    ),
                    child: 
                    Align(
                      alignment: Alignment.center,
                      child:  leading,
                      // Text('1234567', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, ), )
                      ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
    return SafeArea(
      child: Container(
        // color: Colors.blue,
        padding: EdgeInsets.only(right: 0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: _circleDiameter + 10,
                margin: EdgeInsets.only(left: 40),
                padding: padding,
                decoration: BoxDecoration(
                  color: tileColor,
                  borderRadius: borderRadius,
                  gradient: gradient,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: _circleDiameter - 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            title,
                            SizedBox(
                              height: 5.0,
                            ),
                            subtitle ?? SizedBox.shrink(),
                          ],
                        ),
                      ),
                      trailing ?? SizedBox.shrink()
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -constraints.maxWidth + _circleDiameter,
                right: 0,
                child: Container(
                  height: _circleDiameter,
                  width: _circleDiameter,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                  ),
                  child: leading,
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}