import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:gullak/balance.dart';

class DatabaseServices{

  String uid;
  CollectionReference userscollection = FirebaseFirestore.instance.collection('Users');

  DatabaseServices({this.uid});

  Future<void> updateData(String name,double balance) async{
    return await userscollection.doc(uid).set({
      'Name' : name,
      "Balance" : balance,
    }) ;
  }

  Balance _convertDataToBalance(DocumentSnapshot snap){
    Balance myBal = Balance(name: snap.data()["Name"],balance: snap.data()["Balance"]);
    return myBal;
  }

  Future<Balance> getBalance(){
    return userscollection.doc(uid).get().then((value) => _convertDataToBalance(value));

  }

  void updateBalance(double newbalance){
    userscollection.doc(uid).update({"Balance":newbalance});
  }

}