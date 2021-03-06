import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/utils/responsive.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    User userProfile = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: EdgeInsets.all(50),
      child: Center(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: responsive.widthPercent(25),
                    width: responsive.widthPercent(25),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      //borderRadius: BorderRadius.circular(responsive.widthPercent(25)),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 25)],
                      image: DecorationImage(
                        image: NetworkImage(
                          userProfile.profilePicture,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text("${userProfile.firstName} ${userProfile.lastName}",style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("${userProfile.email}",style: TextStyle(fontWeight: FontWeight.bold)),
                ])
        )
    ));
  }
}
