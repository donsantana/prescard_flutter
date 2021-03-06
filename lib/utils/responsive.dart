import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive{

  double width, height, inch;

  Responsive(BuildContext context){
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    // c2 = a2+b2
    inch = math.sqrt(math.pow(width, 2)+math.pow(height, 2));
  }


  //width percent value
  double widthPercent(double percent) {
    return width * percent / 100;
  }

  //height percent value
  double heightPercent(double percent){
    return height * percent / 100;
  }

  //inch percent value
  double inchPercent(double percent){
    return inch * percent / 100;
  }

}