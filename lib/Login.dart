import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'SignUp.dart';
import 'package:provider/provider.dart';
import 'Provide.dart';
import 'Forget.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  @override
  void initState(){
    super.initState();
    _email = TextEditingController(text: "");
    _password = TextEditingController(text: "");
  }

  Widget build(BuildContext context) {
    // MultiProvider(providers: [ChangeNotifierProvider(create: (_) => ProviderState())]);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.,
              children: [
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                      child: Text(
                        'Welcome to login Screen',
                        style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height * 0.2,
                //   child: Image.asset('images/login1.jpeg'),
                // ),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0,left: 13.0,right: 13.0),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) =>
                    (value.isEmpty) ?"Please enter Email": null,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      filled: true,
                      hintText: 'Enter your Email Id',

                      // border:
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0,right: 13.0),
                  child: TextFormField(
                    controller: _password,
                    validator: (value) =>
                    (value.isEmpty) ?"Please enter Password": null,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      filled: true,
                      hintText: 'Enter Your Password',

                      // border:
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                        color: Colors.black54,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text('Log In'),
                        onPressed: () {

                          _loginUser(_email.text,_password.text,context);


                        }),
                    RaisedButton(
                        color: Colors.black54,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Text('Registration'),
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUp()));

                        }),
                    GestureDetector(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => ResetScreen(),),);


                        },
                        child: Text(
                          'Forget Password ',
                          style: TextStyle(fontSize: 16),
                        ))
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                SignInButton(
                  Buttons.Google,
                  onPressed: ()async {
                    final res = Provider.of<ProviderState>(context,listen: false);

                    bool islogin = await res.googlesignIn();
                    if (islogin){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid'),
                            duration: Duration(
                                seconds: 2
                            ),)
                      );
                    }
                  },
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}


void _loginUser(String email, String password, BuildContext context) async{
  ProviderState _currentUser =  Provider.of<ProviderState>(context,listen: false);
  try{
    if (await _currentUser.LoginUser(email, password)){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid Login'),
            duration: Duration(
                seconds: 2
            ),)
      );
    }
  }
  catch(e){
    print(e);
  }
}


void login()async{
  try{

  }
  catch(e){

  }

}




