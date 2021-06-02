import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prescard/Views/profileView.dart';
import 'package:prescard/Views/users_connected_list.dart';
import 'package:prescard/utils/responsive.dart';

import 'model/user.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    User userProfile = ModalRoute.of(context).settings.arguments;
    print(userProfile.lastName);
    return OrientationBuilder(builder: (context, orientation){
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:  Size.fromHeight(orientation == Orientation.portrait ? responsive.heightPercent(8) : responsive.widthPercent(8)),
            // 44 is the height
            child: AppBar(
              //backgroundColor: Colors.wi,
              automaticallyImplyLeading: false,
              //title: Text("PRESCARD"),
              toolbarHeight: orientation == Orientation.portrait ? responsive.heightPercent(5) : responsive.widthPercent(5),
              bottom: TabBar(
                //indicatorColor: AppColors.novenSecondaryColor,
                tabs: <Widget>[
                  // Tab(icon: Image.asset("assets/icons/well.png",fit: BoxFit.cover, color: AppColors.novenSecondaryColor)),
                  // Tab(icon: Image.asset("assets/icons/tank.png",fit: BoxFit.cover, color: AppColors.novenSecondaryColor)),
                  Tab(child: Text("LIST",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400))),
                  Tab(child: Text("PROFILE",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400))),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              UsersConnectedList(),
              ProfileView(userProfile: userProfile),
            ],
          ),
        ),
      );
    });
  }
}
