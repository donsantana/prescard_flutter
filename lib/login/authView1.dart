import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prescard/model/user.dart';

class AuthWidget extends StatefulWidget {
  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final String redirectUrl = 'https://app.carde.de';
  final String clientId = '78el5r2y1dwp4j';
  final String clientSecret = 'RnyXiCNz3cahNx1g';
  final storage = new FlutterSecureStorage();
  User user = User();

  @override
  void initState() {
    LinkedInLogin.initialize(context,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUrl);
    super.initState();
  }

  void storeToken(String accessToken) async{
    await storage.write(key: "authToken", value: accessToken);
    this.getUserProfile();
  }

  void getUserProfile(){
    LinkedInLogin.getProfile(
        destroySession: true,
        forceLogin: true)
        .then((profile) => {
          print(profile),
          //this.user = User.fromJson(profile),
        })
        .catchError((error) {
      print(error.errorDescription);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("widget.title"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          RaisedButton(
            onPressed: () {
              LinkedInLogin.loginForAccessToken(
                  destroySession: true,
                  appBar: AppBar(
                    title: Text('Demo Login Page'),
                  ))
                  .then((accessToken) => this.storeToken(accessToken))
                  .catchError((error) {
                print(error.errorDescription);
              });
            },
            child: Text('Get AccessToken'),
          ),
          // RaisedButton(
          //   onPressed: () {
          //     LinkedInLogin.getProfile(
          //         destroySession: true,
          //         forceLogin: true,
          //         appBar: AppBar(
          //           title: Text('Demo Login Page'),
          //         ))
          //         .then((profile) => print(profile.toJson().toString()))
          //         .catchError((error) {
          //       print(error.errorDescription);
          //     });
          //   },
          //   child: Text('Get Profile'),
          // ),
          RaisedButton(
            onPressed: () {
              LinkedInLogin.getEmail(destroySession: true)
                  .then((email) => print(email.toJson().toString()))
                  .catchError((error) {
                print(error.errorDescription);
              });
            },
            child: Text('Get Email'),
          ),
        ]),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
