import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/helpers/firebase_auth.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/primary_button.dart';
import 'package:e_commerce/widgets/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopTitle(
              title: "Login",
              subTitle: "Welcome back to LWP",
              showBackButton: true,
            ),
            const SizedBox(
              height: 48,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  hintText: "E-mail",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  )),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              controller: password,
              obscureText: !isShowPassword,
              decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: const Icon(
                    Icons.password,
                  ),
                  suffixIcon: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: Icon(
                        isShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ))),
            ),
            const SizedBox(
              height: 36,
            ),
            PrimaryButton(
                onPressed: () async {
                  bool isValid = loginVaildation(email.text, password.text);
                  if (isValid) {
                    bool isLoggedIn = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);

                    if (isLoggedIn) {
                      Routes.instance
                          .pushAndRemoveUntil(widget: Home(), context: context);
                    }
                  }
                },
                text: "Login"),
            const SizedBox(
              height: 24,
            ),
            const Center(child: Text("Don't have an account?")),
            Center(
              child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    "Create an Account",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
