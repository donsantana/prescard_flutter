
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/model/user.dart';
import 'package:prescard/utils/responsive.dart';

class UsersConnectedList extends StatefulWidget {
  @override
  _UsersConnectedListState createState() => _UsersConnectedListState();
}

class _UsersConnectedListState extends State<UsersConnectedList> {
  List<User> usersConnectedList = [];
  List<User> usersConnectedSearch = [];
  
  void onSearchAsset(String value){
    setState(() => {
      this.usersConnectedSearch = value == "" ? [] : []git
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 5, right: 5, top: 2, bottom: 2),
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
          this.usersConnectedSearch.length > 0 ? Container(): Container(),
        ],
      ),
    );
  }
}
