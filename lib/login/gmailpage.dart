import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../homepage.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( const GoogleSignInPage());
}
class GoogleSignInPage extends StatelessWidget {
  const GoogleSignInPage({super.key});

  get user => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
              children: [
                const SizedBox(height: 50,),
          Center(
          child: ClipRRect(
          borderRadius: BorderRadius.circular(25), // Image border
          child: Image.asset('assets/images/icon.png',
            height: 75,
            width: 75,
          ),
        ),
      ),
       const SizedBox(height: 50,),
            const Text(" Welcome \n ",
              style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,
              color:Color(0xFF0D47A1),
            ),),
          const Text("Your Google Credentials  Will Automatically Redirect to Google SignIn Page...! ",
           style: TextStyle(
           fontSize: 18,fontWeight: FontWeight.bold, color:Colors.black,
    ),),
          const SizedBox(height: 100,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              padding: const EdgeInsets.only(top: 3, left: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
              ),
              child:MaterialButton(
                minWidth: double.infinity,
                height: 50,
                onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLoginIn();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(user)));

                },
                color: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)
                ),
                child: const Text("Login With Google ", style: TextStyle(
                  fontSize: 20, color: Colors.white,fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 150),
          Container(
            alignment: Alignment.bottomCenter,
            child: const Text('  from \n B.M.H.',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey,fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),
    ),
      ),
    );
  }
}


// this is the page for google sign up  button will performance the actions with a fire base credentials and google sign in


class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  Future googleLoginIn() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,

      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e){
      (e.toString());

    }
    notifyListeners();
  }
  Future signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();

  }
}