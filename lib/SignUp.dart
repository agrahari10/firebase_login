import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Login.dart';
import 'Provide.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _fullnamecontroller = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _Passsword = TextEditingController();
  TextEditingController _ConfirmPassword = TextEditingController();


  void _signUp(String email,String password,BuildContext context) async{
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    try{
      if(await _providerState.signUpUser(email, password)){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      }
    }catch(e)
    {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 70.0,left: 30.0,right: 30.0),
              child: Column(
                children: [Text('Registration Page',style: TextStyle(
                  fontSize: 30.0,fontWeight: FontWeight.bold,
                ),),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    controller: _fullnamecontroller,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      // filled: true,
                      hintText: 'Name',

                      // border:
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _email,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      filled: true,
                      hintText: 'Email',

                      // border:
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _Passsword,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      filled: true,
                      hintText: 'Password',

                      // border:
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _ConfirmPassword,
                    // obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      filled: true,
                      hintText: 'Confirm Password',

                      // border:
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text('Sign UP'),
                          onPressed: () {
                            if(_Passsword.text == _ConfirmPassword.text){
                              _signUp(_email.text,_Passsword.text,context);
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Password not Match'),
                                    duration: Duration(
                                        seconds: 2
                                    ),)

                              );
                            }
                            // setState(() {
                            // });
                          }),
                      RaisedButton(
                          color: Colors.black,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text('Back'),
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));

                          }),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

