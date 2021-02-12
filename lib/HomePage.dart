
import 'package:flutter/material.dart';
import 'package:gullak/auth.dart';
import 'package:gullak/database.dart';
import 'package:provider/provider.dart';

import 'balance.dart';
import 'package:gullak/myUser.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showingBal = false;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<myUser>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home Screen"),
        actions: <Widget>[
          FlatButton(onPressed: () async { _auth.signOut();}, child: Text("Sign Out"))
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              PrintBalance(uid: user.uId),
              AddBalance(uid : user.uId),
            ],
          )
        ],
      ),
    );
  }

}

class PrintBalance extends StatefulWidget {
  final String uid;
  bool showingBal;
  PrintBalance({Key key, this.uid,this.showingBal}) :super(key: key);
  @override
  _PrintBalanceState createState() => _PrintBalanceState();
}

class _PrintBalanceState extends State<PrintBalance> {


  double balance ;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: (show == false) ? Text("Click here to see balance") : Text("Balance is $balance") ,
      onPressed: () async {
        DatabaseServices _databaseServices = DatabaseServices(uid: widget.uid);
        // print(widget.uid);

        Balance bal = await _databaseServices.getBalance();
        setState(() {
          balance = bal.balance;
        });

      },
    );
  }
}

// To Add Balance.
class AddBalance extends StatefulWidget {
  final String uid;
  AddBalance({this.uid});
  @override
  _AddBalanceState createState() => _AddBalanceState();
}

class _AddBalanceState extends State<AddBalance> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Click to add balance."),
      onPressed: ()async{
        DatabaseServices _databaseServices = DatabaseServices(uid: widget.uid);
        double newbalance = 100;
        _databaseServices.updateBalance(newbalance);
        setState(() {

        });
      } ,);
  }
}


