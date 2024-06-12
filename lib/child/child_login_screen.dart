import 'package:flutter/material.dart';
import 'package:woman_safety_app/child/child_register_screen.dart';
import 'package:woman_safety_app/child/practice.dart';
import 'package:woman_safety_app/component/custom_textfield.dart';
import 'package:woman_safety_app/component/primary_button.dart';
import 'package:woman_safety_app/component/secondary_button.dart';
import 'package:woman_safety_app/parent/parent_child_screen.dart';

import 'package:woman_safety_app/utils/constants.dart';

class ChildLoginScreen extends StatefulWidget {
  @override
  State<ChildLoginScreen> createState() => _ChildLoginScreenState();
}

class _ChildLoginScreenState extends State<ChildLoginScreen> {
  bool isPasswordShown = false;
  final _formKey = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  onSubmit() {
    _formKey.currentState!.save();
    print(_formData['email']);
    print(_formData['password']);
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
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'User Login',
                        style: TextStyle(
                          fontSize: 40,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/w.png',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
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
                          hintText: "Enter Password",
                          isPasword: !isPasswordShown,
                          onSave: (password) {
                            _formData['password'] = password ?? "";
                          },
                          validate: (password) {
                            if (password!.isEmpty || password.length < 7) {
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
                                  : const Icon(Icons.visibility)),
                        ),
                        PrimaryButton(
                            onPressed: () {
                              progressIndicator(context);
                              // if (_formKey.currentState!.validate()) {
                              //   onSubmit();
                              // }
                            },
                            title: 'LOGIN'),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SecondaryButton(onPressed: () {}, title: "OnClick"),
                  ],
                ),
                SecondaryButton(
                    onPressed: () {
                      goto(context, ChildRegisterScreen());
                    },
                    title: "Register as child"),
                SecondaryButton(
                    onPressed: () {
                      goto(context, ParentRegisterScreen());
                    },
                    title: "Register as parent"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
