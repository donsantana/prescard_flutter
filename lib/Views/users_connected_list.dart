
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/utils/responsive.dart';
import 'package:location/location.dart';
import 'package:prescard/widgets/user_cell.dart';

class UsersConnectedList extends StatefulWidget {
  @override
  _UsersConnectedListState createState() => _UsersConnectedListState();
}

class _UsersConnectedListState extends State<UsersConnectedList> {
  var _isFetching = true;

  Location location = new Location();
  final storage = new FlutterSecureStorage();
  bool _isSharedProfile;

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  List<User> usersConnectedList;
  List<User> usersSearchList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getUserCurrentLocation();
    this.shareProfileStatus();
    // ignore: unrelated_type_equality_checks
  }

  Future<void> shareProfileStatus() async{
    print("isShared ${await storage.read(key: "isSharedProfile")}");
    if(await storage.read(key: "isSharedProfile") == "1"){
      _isSharedProfile = true;
    }else{
      _isSharedProfile = false;
    }
  }

  Future<void> getUserCurrentLocation() async{
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    print(_locationData.latitude);
    await this.searchUserConnected();
    //_userCameraPosition = CameraPosition(target: LatLng(_locationData.latitude, _locationData.longitude),zoom: 5.0);
  }

  Future<void> searchUserConnected() async {
    this.usersConnectedList = [User(id: "1", firstName: "Aly", lastName: "Paez", profilePicture: "https://media-exp1.licdn.com/dms/image/C4E03AQGSHHY6LDAfVw/profile-displayphoto-shrink_100_100/0/1553067182887?e=1626307200&v=beta&t=ACb_Z63zD5qKlAHzmg55DLNqem2jcTFceYBNa9TJezM", mobilPhone: "mobilPhone", email: "paezvengas@gmail.com"),
      User(id: "2", firstName: "Donelkys", lastName: "Santana", profilePicture: "https://media-exp1.licdn.com/dms/image/C4E03AQEo6joVEbtrdA/profile-displayphoto-shrink_800_800/0/1517639024090?e=1627516800&v=beta&t=aHLASQ3bkd_U3wdlIS3eCZXBUj6lCMWfiL0k7eof08A", mobilPhone: "mobilPhone2", email: "dsantana@gmail.com")];
    this.usersSearchList = [User(id: "1", firstName: "Aly", lastName: "Paez", profilePicture: "https://media-exp1.licdn.com/dms/image/C4E03AQGSHHY6LDAfVw/profile-displayphoto-shrink_100_100/0/1553067182887?e=1626307200&v=beta&t=ACb_Z63zD5qKlAHzmg55DLNqem2jcTFceYBNa9TJezM", mobilPhone: "mobilPhone", email: "paezvengas@gmail.com"),
      User(id: "2", firstName: "Donelkys", lastName: "Santana", profilePicture: "https://media-exp1.licdn.com/dms/image/C4E03AQEo6joVEbtrdA/profile-displayphoto-shrink_800_800/0/1517639024090?e=1627516800&v=beta&t=aHLASQ3bkd_U3wdlIS3eCZXBUj6lCMWfiL0k7eof08A", mobilPhone: "mobilPhone2", email: "dsantana@gmail.com")];

    this.setState(() {
      _isFetching = false;
    });
  }
  
  void onSearchAsset(String value){
    setState(() => {
      this.usersSearchList = value == "" ? this.usersConnectedList : this.usersConnectedList.where((element) => element.firstName.toLowerCase().contains(value.toLowerCase())).toList()
    });
  }

  Future<void> updateStorageValue() async{
    await storage.write(key: "isSharedProfile", value: "1");
    setState(() {
      _isSharedProfile = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return _isFetching ? Positioned.fill(child: Container(
      color: Colors.black45,
      child: Center(
        child: CupertinoActivityIndicator(radius: 15),
      ),
    )) :
    !_isSharedProfile ?
    AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      title: new Text("Share your profile"),
      content: new Text("You must share your profile to see others users connected."),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new TextButton(
          child: new Text("Share my profile",textAlign: TextAlign.center),
          onPressed: updateStorageValue,
        ),
      ],
    ) :
    SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 10, right: 10, top: 2, bottom: 2),
            child: Container(
                height: responsive.heightPercent(5),
                child: Stack(
                  children: [
                    TextField(
                      obscureText: false,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10))),
                        labelText: 'Search asset',
                      ),
                      onChanged: onSearchAsset,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () => {},
                          icon: Icon(Icons.search)),
                    )
                  ],
                )),
          ),
          this.usersSearchList.length == 0 ? Container(child: Text("Users not found"),) :
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: this.usersSearchList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: ()=> {},
                  child: UserConnectedCell(user: this.usersSearchList[index])
                );
              })
        ],
      ),
    );

  }
}
