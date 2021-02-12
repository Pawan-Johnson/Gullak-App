import 'package:firebase_auth/firebase_auth.dart';

class myUser {
  String uId;
  myUser({this.uId});
}

myUser myUserfromfUser(User fUser) {
  if(fUser==null)
    return null;
  return myUser(uId: fUser.uid);
}
