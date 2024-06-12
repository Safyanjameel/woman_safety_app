import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:woman_safety_app/component/custom_textfield.dart';
import 'package:woman_safety_app/component/primary_button.dart';
import 'package:woman_safety_app/component/secondary_button.dart';
import 'package:woman_safety_app/model/user_model.dart';
import 'package:woman_safety_app/utils/constants.dart';

import 'child_login_screen.dart';

class ChildRegisterScreen extends StatefulWidget {
  @override
  State<ChildRegisterScreen> createState() => _ChildRegisterScreenState();
}

class _ChildRegisterScreenState extends State<ChildRegisterScreen> {
  bool isPasswordShown = false;
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  onSubmit() async {
    if (_formData['password'] != _formData['retypepassword']) {
      dialogBox(context, 'password and retype password should be equal');
    } else {
      progressIndicator(context);
      try {
        FirebaseAuth auth = FirebaseAuth.instance;
        await auth
            .createUserWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passController.text.trim(),
            )
            .whenComplete(
              () => goto(
                context,
                ChildLoginScreen(),
              ),
            );
      } on FirebaseAuthException catch (e) {
        dialogBox(context, e.toString());
      } catch (e) {
        dialogBox(
          context,
          e.toString(),
        );
      }
    }
    _formKey.currentState!.save();
    print(_formData['email']);
    print(_formData['password']
    );
    print(_formData['phone']
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text(
                            'Register As',
                            style: TextStyle(
                              fontSize: 40,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Child',
                            style: TextStyle(
                              fontSize: 40,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        'assets/w.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomTextfield(
                          hintText: "Enter Name",
                          prefix: const Icon(Icons.person),
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          onSave: (name) {
                            _formData['name'] = name ?? "";
                          },
                          validate: (name) {
                            if (name!.isEmpty || name.length < 3) {
                              return "enter correct name";
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          hintText: "Enter Phone",
                          prefix: const Icon(Icons.phone),
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          onSave: (phone) {
                            _formData['phone'] = phone ?? "";
                          },
                          validate: (phone) {
                            if (phone!.isEmpty || phone.length < 3) {
                              return "enter correct phone number";
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          controller: _emailController,
                          hintText: "Enter Email",
                          prefix: const Icon(Icons.person),
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          onSave: (email) {
                            _formData['email'] = email ?? "";
                          },
                          validate: (email) {
                            if (email!.isEmpty ||
                                email.length < 3 ||
                                !email.contains("@")) {
                              return "enter correct email";
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          hintText: "Enter gardian email",
                          prefix: const Icon(Icons.person),
                          textInputAction: TextInputAction.next,
                          keyboardtype: TextInputType.emailAddress,
                          onSave: (gemail) {
                            _formData['gemail'] = gemail ?? "";
                          },
                          validate: (gemail) {
                            if (gemail!.isEmpty ||
                                gemail.length < 3 ||
                                !gemail.contains("@")) {
                              return "enter correct email";
                            }
                            return null;
                          },
                        ),
                        CustomTextfield(
                          controller: _passController,
                          hintText: "Enter Password",
                          isPasword: !isPasswordShown,
                          onSave: (password) {
                            _formData['password'] = password ?? "";
                          },
                          validate: (password) {
                            if (password!.isEmpty || password.length < 3) {
                              return "enter correct password";
                            }
                            return null;
                          },
                          prefix: const Icon(Icons.vpn_key_rounded),
                          suffix: IconButton(
                            visualDensity: VisualDensity.compact,
                            iconSize: 22,
                            onPressed: () {
                              setState(() {
                                isPasswordShown = !isPasswordShown;
                              });
                            },
                            icon: isPasswordShown
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                        CustomTextfield(
                          hintText: "Retype Password",
                          isPasword: !isPasswordShown,
                          onSave: (retypepassword) {
                            _formData['retypepassword'] = retypepassword ?? "";
                          },
                          validate: (retypepassword) {
                            if (retypepassword!.isEmpty ||
                                retypepassword.length < 3) {
                              return "confirm retype password";
                            }
                            return null;
                          },
                          prefix: const Icon(Icons.vpn_key_rounded),
                          suffix: IconButton(
                              visualDensity: VisualDensity.compact,
                              iconSize: 22,
                              onPressed: () {
                                setState(() {
                                  isPasswordShown = !isPasswordShown;
                                });
                              },
                              icon: isPasswordShown
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility)),
                        ),
                        PrimaryButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              onSubmit();
                            }
                          },
                          title: 'REGISTER',
                        ),
                      ],
                    ),
                  ),
                ),
                SecondaryButton(
                  onPressed: () {},
                  title: "Login with your account",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
