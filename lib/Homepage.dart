import 'package:flutter/material.dart';
import 'Provide.dart';
import 'package:provider/provider.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('hello',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),),
            SizedBox(
              height: 20.0,
            ),

            RaisedButton(
                color: Colors.black,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text('Sign Out'),
                onPressed: (){
                  _providerState.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
// });
                }),
          ],
        ),
      ),
    );
  }
}

