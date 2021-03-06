import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prescard/utils/borders.dart';
import 'package:prescard/utils/colors.dart';
import 'package:prescard/utils/fonts.dart';
import 'package:prescard/utils/radii.dart';
import 'package:prescard/utils/responsive.dart';
import 'package:prescard/utils/shadows.dart';


// class UserConnectedCell extends StatefulWidget {
//
//   UserConnectedCell({Key key,
//     @required this.alert,
//   }): super(key: key);
//
//   @override
//   _UserConnectedCellState createState() => _UserConnectedCellState();
// }
//
// class _UserConnectedCellState extends State<UserConnectedCell> {
//   @override
//   Widget build(BuildContext context) {
//     final responsive = Responsive(context);
//     return Container(
//         height: responsive.heightPercent(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.fromBorderSide(Borders.primaryBorder),
//           boxShadow: [
//             Shadows.primaryShadow,
//           ],
//           borderRadius: Radii.k8pxRadius,
//         ),
//         child: Column(
//           children: [
//             Expanded(
//                 flex: 1,
//                 child:  Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(child: Container(
//                       width: responsive.widthPercent(16),
//                       margin: EdgeInsets.only(left: 10, top: 10,right: 10),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "${widget.alert.date}",
//                           textAlign: TextAlign.right,
//                           style: TextStyle(
//                             color: AppColors.primaryText,
//                             fontFamily: "Helvetica",
//                             fontWeight: FontWeight.w400,
//                             fontSize: responsive.heightPercent(AppFontSize.normalTextSize),
//                           ),
//                         ),
//                       ),
//                     )),
//                   ],
//                 )),
//             Spacer(flex: 1),
//             Expanded(
//                 flex: 2,
//                 child: Container(
//                   padding: EdgeInsets.only(left: 10,right: 10, bottom: 10),
//                   width: responsive.widthPercent(95),
//                   child: Text(
//                     "${widget.alert.text}",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: widget.alert.level == 'hh' ? Color.fromARGB(255, 207, 46, 46) : Colors.orangeAccent,
//                       fontFamily: "Helvetica",
//                       fontWeight: FontWeight.w700,
//                       fontSize: responsive.heightPercent(AppFontSize.normalTextSize),
//                     ),
//                   ),
//                 )),
//           ],
//         )
//     );
//   }
// }
