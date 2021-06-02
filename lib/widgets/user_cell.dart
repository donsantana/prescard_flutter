import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/utils/borders.dart';
import 'package:prescard/utils/colors.dart';
import 'package:prescard/utils/fonts.dart';
import 'package:prescard/utils/radii.dart';
import 'package:prescard/utils/responsive.dart';
import 'package:prescard/utils/shadows.dart';

class  UserConnectedCell extends StatelessWidget {
  final User user;
  UserConnectedCell({Key key,
  @required this.user,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return Center(
      child: Container(
          height: responsive.heightPercent(15),
          width: responsive.widthPercent(95),
          // decoration: BoxDecoration(
          //   //color: Colors.white,
          //   border: Border.fromBorderSide(Borders.primaryBorder),
          //   // boxShadow: [
          //   //   Shadows.primaryShadow,
          //   // ],
          //   borderRadius: Radii.k8pxRadius,
          // ),
          child: GestureDetector(
              onTap: ()=> {
                print("test")
              },//this.sentConnectionRequest(index, context),
              child: Card(
                shadowColor: Borders.primaryBorder.color,
                child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: responsive.widthPercent(25),
                    width: responsive.widthPercent(25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      //borderRadius: BorderRadius.circular(responsive.widthPercent(25)),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25)],
                      image: DecorationImage(
                        image: user.firstName != "Aly" ? NetworkImage(
                          this.user.profilePicture,
                        ) : Image.asset(
                          "assets/images/alyprofile.png",
                          fit: BoxFit.fitHeight,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${this.user.firstName} ${this.user.lastName}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.bold,
                              fontSize: responsive.heightPercent(AppFontSize.titleTextSize),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${this.user.email}",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Helvetica",
                              fontWeight: FontWeight.w500,
                              fontSize: responsive.heightPercent(AppFontSize.subtitleTextSize),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            ),
          ))
      ),
    );
  }
}


// class UserConnectedCell extends StatefulWidget {
//   User user;
//   UserConnectedCell({Key key,
//     @required this.user,
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
//                           "${widget.user.firstName}",
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
//                     "${widget.user.email}",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                       color: Colors.black,
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
