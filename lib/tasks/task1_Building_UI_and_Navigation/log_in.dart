// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'tab_bar.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisable = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Sign in", style: TextStyle(fontSize: 24)),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(33.0),
          child: SingleChildScrollView(
            child: Column(children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: "Enter Your Email : ",
                  suffixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  contentPadding: EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 33),
              TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.text,
                obscureText: isVisable ? false : true,
                decoration: InputDecoration(
                  hintText: "Enter Your Password : ",
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisable = !isVisable;
                        });
                      },
                      icon: isVisable
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  filled: true,
                  contentPadding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(height: 33),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  await Future.delayed(const Duration(seconds: 2));
                  setState(() {
                    isLoading = true;
                  });
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 900),
                      pageBuilder: (context, animation, secondAnimation) =>
                          const MyTabBar(),
                      transitionsBuilder:
                          (context, animation, secondAnimation, child) {
                        var begin = const Offset(-1.0, 0.0);
                        var end = Offset.zero;
                        var curve = Curves.ease;
                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Welcome To Home Page'),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.brown,
                  ));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.brown),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        "Sign in",
                        style: TextStyle(fontSize: 19),
                      ),
              ),
            ]),
          ),
        )));
  }
}
