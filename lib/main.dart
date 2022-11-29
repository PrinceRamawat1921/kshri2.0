import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kshri2/Screens/product_screen.dart';
import 'package:kshri2/Screens/results_screen.dart';
import 'package:kshri2/Screens/sign_in_screen.dart';
import 'package:kshri2/layout/screen_layout.dart';
import 'package:kshri2/model/product_model.dart';
import 'package:kshri2/utils/color_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyBrJGeYTFwoG6c5PvCf85EeLrCYk1Hl1I0",
      authDomain: "kshriapp.firebaseapp.com",
      projectId: "kshriapp",
      storageBucket: "kshriapp.appspot.com",
      messagingSenderId: "364508896914",
      appId: "1:364508896914:web:b8fbae669c0295163a904b",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const Kshri());
}

class Kshri extends StatelessWidget {
  const Kshri({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kshri",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> user) {
          if (user.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          } else if (user.hasData) {
            //return const ScreenLayout();
            return ProductScreen(
              productModel: ProductModel(
                url:
                    "https://th.bing.com/th/id/R.6ecfcb4758fc8601eacf6cb9e02d9c7a?rik=cFXCxmmk%2fkjHoQ&riu=http%3a%2f%2feachdesk.com%2fgallery3%2f30%2ff4%2f74628%2f074628-1-02.jpg&ehk=Epf%2bO%2b27tTuK5GogqBZJP%2b1Gx6845ugFgYMQ15oHMtU%3d&risl=&pid=ImgRaw&r=0",
                productName: "Red Hoodie",
                cost: 1099,
                discount: 0,
                uid: "sdadas",
                sellerName: "kshri",
                sellerUid: "esfeds",
                rating: 1,
                noOfRating: 1,
              ),
            );
          } else {
            return const SignInScreen();
          }
        },
      ),
    );
  }
}
