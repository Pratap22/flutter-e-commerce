import 'package:e_commerce/constants/asset_images.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/screens/auth/login/login.dart';
import 'package:e_commerce/screens/auth/sigin_up/sign_up.dart';
import 'package:e_commerce/widgets/primary_button.dart';
import 'package:e_commerce/widgets/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TopTitle(
              title: "Welcome",
              subTitle: "Buy an item from online using the app"),
          Center(child: Image.asset(AssetsImages.instance.welcomeImage)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: const Icon(
                  Icons.facebook,
                  size: 35,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              CupertinoButton(
                onPressed: () {},
                padding: EdgeInsets.zero,
                child: Image.asset(
                  AssetsImages.instance.googleLogo,
                  scale: 28,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(
            onPressed: () {
              Routes.instance.push(widget: const Login(), context: context);
            },
            text: "Login",
          ),
          const SizedBox(
            height: 18,
          ),
          PrimaryButton(
            onPressed: () {
              Routes.instance.push(widget: const SignUp(), context: context);
            },
            text: "Sign Up",
          ),
        ]),
      ),
    );
  }
}
