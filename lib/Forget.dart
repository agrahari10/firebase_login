import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  String _email;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Rest Password'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 200.0,left: 10.0,right: 10.0),
                child: TextFormField(
                  // controller: _ConfirmPassword,
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    filled: true,
                    hintText: 'Email',

                    // border:
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              RaisedButton(
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Text('Reset Password'),
                  onPressed: (){
                    // _providerState.signOut();
                    auth.sendPasswordResetEmail(email: _email);
                    Navigator.of(context).pop();

                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
// });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
