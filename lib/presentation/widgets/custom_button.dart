import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final Color? background;
  final Color? borderColor;
  final double? radius;
  final Function()? onTap;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  height ?? double.infinity,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? Colors.transparent
          ),
          borderRadius: BorderRadius.circular(radius ?? 8)
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            minimumSize: Size(
                width ?? double.infinity,
                height ?? double.infinity
            ),
            backgroundColor: background ?? Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 8),
            ),
          ),
          onPressed: onTap ?? () {},
          child: child!
      ),
    );
  }
}