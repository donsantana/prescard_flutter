import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/services/api.dart';
import 'package:prescard/utils/fonts.dart';
import 'package:prescard/utils/responsive.dart';

class ProfileView extends StatefulWidget {
  final User userProfile;
  const ProfileView({Key key, @required this.userProfile}) : super(key: key);
  
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final storage = new FlutterSecureStorage();
  bool _isSharedProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.shareProfileStatus();
  }

  Future<void> shareProfileStatus() async{
    final sharedProfileStatus = await storage.read(key: "isSharedProfile");
    setState(() {
      if(sharedProfileStatus == "1"){
      _isSharedProfile = true;
      }else{
      _isSharedProfile = false;
      }
    });
  }

  void toggleSwitch(bool value) {
    print(value);
    this.updateStorageValue(value ? "1" : "0");
    setState(() {
      _isSharedProfile = value;
    });

    //
    //
    // if (isSwitched == false) {
    //   setState(() {
    //     isSwitched = true;
    //   });
    //   print('Switch Button is ON');
    // }
    // else {
    //   setState(() {
    //     isSwitched = false;
    //   });
    //   print('Switch Button is OFF');
    // }
  }

  Future<void> updateStorageValue(String isSharedProfile) async{
    await storage.write(key: "isSharedProfile", value: isSharedProfile);
  }

    @override
    Widget build(BuildContext context) {
      final responsive = Responsive(context);
      return Container(
          alignment: Alignment.topCenter,
          height: responsive.heightPercent(20),
          child: Column(
            children: [
              Container(
                  height: responsive.heightPercent(20),
                  width: responsive.widthPercent(95),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: responsive.widthPercent(25),
                            width: responsive.widthPercent(25),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              //borderRadius: BorderRadius.circular(responsive.widthPercent(25)),
                              boxShadow: [BoxShadow(
                                  color: Colors.black12, blurRadius: 25)
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                  widget.userProfile.profilePicture,
                                ),
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
                                //mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Text("${widget.userProfile.firstName} ${widget
                                      .userProfile.lastName}", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: responsive.heightPercent(
                                          AppFontSize.titleTextSize))),
                                  SizedBox(height: 5),
                                  Text("${widget.userProfile.email}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: responsive.heightPercent(
                                              AppFontSize.subtitleTextSize))),
                                ]),
                          )
                        ],
                      ),
                    ),
                  )
              ),
              Container(
                height: responsive.heightPercent(10),
                width: responsive.widthPercent(95),
                child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text("Share my Profile", style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: responsive.heightPercent(
                                  AppFontSize.normalTextSize))),
                          Spacer(),
                          Switch(
                            onChanged: toggleSwitch,
                            value: _isSharedProfile,
                            activeColor: Colors.blue,
                            activeTrackColor: Colors.green,
                            inactiveThumbColor: Colors.blueGrey,
                            inactiveTrackColor: Colors.grey,
                          )
                        ],
                      ),
                    )),
              )
            ],
          )
      );
    }
  }

