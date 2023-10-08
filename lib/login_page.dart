import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String screenName = '/login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  bool isPasswordHidden = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isButtonPressed = false;

  void moveToHomePage() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isButtonPressed = true;
      });
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context, HomePage.screenName);
        setState(() {
          isButtonPressed = false;
        });
      });
      //print('Enter pressed');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Here'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: const AssetImage('Images/login.png'),
                  width: size.width * .75,
                ),
                const SizedBox(height: 12),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),

                ///=== name controller ===///
                TextFormField(
                  decoration: buildInputDecoration(),
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.isValidName() == true) {
                        return null;
                      } else {
                        return 'Can\'t leave a space between first name and last name\nEither right first name only\nOR both with a single space';
                      }
                    } else {
                      return 'Enter something';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),

                ///=== email controller ===///
                TextFormField(
                  decoration: buildInputDecoration().copyWith(
                      hintText: 'Enter email', label: const Icon(Icons.email)),
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.isValidEmail() == true) {
                        return null;
                      } else {
                        return 'enter valid format only';
                      }
                    } else {
                      return 'Please Enter some email';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),

                ///===password controller===///
                TextFormField(
                  decoration: buildInputDecoration().copyWith(
                    hintText: 'Enter password',
                    label: const Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      icon: isPasswordHidden
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  ),
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        value.length >= 6) {
                      return null;
                    } else {
                      return 'Enter a password longer than 6 digits';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  obscureText: isPasswordHidden,
                ),
                const SizedBox(height: 50),
                isButtonPressed
                    ? const CircularProgressIndicator(
                        color: CupertinoColors.systemRed,
                      )
                    : ElevatedButton(
                        onPressed: moveToHomePage,
                        child: const Text('Enter'),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
      hintText: 'Enter your name',
      label: const Icon(CupertinoIcons.person),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

//todo: extension for validation to be created. Once
//todo: the project ui is completed.
//done
extension ValidAlphabet on String {
  bool isValidName() {
    return RegExp(r'^([a-zA-Z]+)(([\s]?)([a-zA-Z]+))$').hasMatch(this);
  }
}

extension ValidEmail on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\_\-]*)([a-zA-Z0-9]*)([@])([a-zA-Z]+)([\.])([a-zA-Z]{2,4})$')
        .hasMatch(this);
  }
}
