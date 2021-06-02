import 'package:flutter/material.dart';
//import 'package:flutter_linkedin/linkedloginflutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:prescard/model/user.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:prescard/services/api.dart';
import 'package:prescard/utils/responsive.dart';

class AuthView extends StatefulWidget {
  @override
  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  APIService apiService = APIService();
  final String redirectUrl = 'https://app.carde.de';
  final String clientId = '78el5r2y1dwp4j';
  final String clientSecret = 'RnyXiCNz3cahNx1g';
  final storage = new FlutterSecureStorage();
  AuthCodeObject authorizationCode;
  bool logoutUser = false;
  User user = User();

  @override
  void initState() {
    // LinkedInLogin.initialize(context,
    //     clientId: clientId,
    //     clientSecret: clientSecret,
    //     redirectUri: redirectUrl);
    super.initState();
  }


  Future<void> getUserProfile(){
    apiService.getUserInfo();
  }

  void storeToken(String accessToken) async{
    await storage.write(key: "authToken", value: accessToken);
    this.getUserProfile();
  }

  void createUserProfile(LinkedInUserModel linkedInUser) async{
    this.user = await User.fromJson(linkedInUser);
    this.user.loginUser();
    this.gotToProfile(this.user);
  }

  void gotToProfile(User userProfile){
    Navigator.pushNamed(context,"/home",arguments: userProfile);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);
    return
       Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: responsive.widthPercent(25),
                  width: responsive.widthPercent(25),
                  margin: EdgeInsets.only(bottom: 40),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 25)
                      ]),
                  child: Image.asset(
                    "assets/images/logo.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                LinkedInButtonStandardWidget(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => LinkedInUserWidget(
                          appBar: AppBar(
                            title: Text('OAuth User'),
                          ),
                          destroySession: logoutUser,
                          redirectUrl: redirectUrl,
                          clientId: clientId,
                          clientSecret: clientSecret,
                          projection:  [
                            ProjectionParameters.id,
                            ProjectionParameters.localizedFirstName,
                            ProjectionParameters.localizedLastName,
                            ProjectionParameters.firstName,
                            ProjectionParameters.lastName,
                            ProjectionParameters.profilePicture,
                          ],
                          onGetUserProfile: (LinkedInUserModel linkedInUser) {
                            this.storeToken(linkedInUser.token.accessToken);
                            this.createUserProfile(linkedInUser);

                            print('Access token ${linkedInUser.token.accessToken}');

                            print('User: ${linkedInUser.toString()}');

                            setState(() {
                              logoutUser = false;
                            });

                            //Navigator.pushNamed(context,"/profile");
                            //Navigator.pop(context);
                          },
                          catchError: (LinkedInErrorObject error) {
                            print('Error description: ${error.description},'
                                ' Error code: ${error.statusCode.toString()}');
                            Navigator.pop(context);
                          },
                        ),
                        fullscreenDialog: true,
                      ),
                    );
                  },
                ),
                // Container(
                //   child: Column(
                //     mainAxisSize: MainAxisSize.max,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Text('First: ${user?.firstName} '),
                //       Text('Last: ${user?.lastName} '),
                //       Text('Email: ${user?.email}'),
                //       Text('Profile image: ${user?.profileImageUrl}'),
                //     ],
                //   ),
                // ),
              ]),
        ),
      );
  }
}

class AuthCodeObject {
  String code, state;

  AuthCodeObject({this.code, this.state});
}