import 'package:flutter/material.dart';
import 'package:new_project/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Email must not be empty";
                      }
                      return null;
                    },
                    label: "E-mail",
                    prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Email must not be empty";
                        }
                        return null;
                      },
                      label: "Password",
                      prefix: Icons.lock,
                      isPassword: isPassword,
                      suffix:
                          isPassword ? Icons.visibility : Icons.visibility_off,
                      suffixPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      }),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    function: () {
                      if (formKey.currentState.validate()) {
                        print(emailController.text);
                        print(passwordController.text);
                      }
                    },
                    text: "login",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  defaultButton(
                      function: () {
                        print(emailController.text);
                        print(passwordController.text);
                      },
                      text: "register"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}