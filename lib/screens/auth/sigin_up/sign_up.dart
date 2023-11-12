import 'package:e_commerce/constants/constants.dart';
import 'package:e_commerce/constants/routes.dart';
import 'package:e_commerce/helpers/firebase_auth.dart';
import 'package:e_commerce/screens/home/home.dart';
import 'package:e_commerce/widgets/primary_button.dart';
import 'package:e_commerce/widgets/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = false;
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopTitle(
                title: "Create Account",
                subTitle: "Welcome to LWP",
                showBackButton: true,
              ),
              const SizedBox(
                height: 48,
              ),
              TextFormField(
                controller: name,
                decoration: const InputDecoration(
                    hintText: "Name",
                    prefixIcon: Icon(
                      Icons.person_outline,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
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
                controller: phone,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                    hintText: "Phone",
                    prefixIcon: Icon(
                      Icons.call_outlined,
                    )),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                controller: password,
                obscureText: !isShowPassword,
                decoration: InputDecoration(
                    hintText: "Create Password",
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
                    bool isValid = signUpVaildation(
                        email.text, password.text, name.text, phone.text);
                    if (isValid) {
                      bool isLoggedIn = await FirebaseAuthHelper.instance
                          .signUp(email.text, password.text, context);

                      if (isLoggedIn) {
                        Routes.instance.pushAndRemoveUntil(
                            widget: Home(), context: context);
                      }
                    }
                  },
                  text: "Create Account"),
              const SizedBox(
                height: 24,
              ),
              const Center(child: Text("Already have an account?")),
              Center(
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
