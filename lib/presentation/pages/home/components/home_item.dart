import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  final DecorationImage decorationImage;
  const HomeItem({Key? key, required this.decorationImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.shade300,
          boxShadow: const[
            BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(0 , 5)
            ),
            BoxShadow(
                color: Colors.transparent,
                offset: Offset(-5 , 0)
            ),
            BoxShadow(
                color: Colors.transparent,
                offset: Offset(5 , 0)
            )
          ],
          image: decorationImage
      ),
    );
  }
}
