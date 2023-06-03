import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training_app/data/common_widget/reusable.dart';
import 'package:flutter_training_app/presentation/screens/registration.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/Cubit/cubit/navigation_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<Color> colors = [const Color(0xffA20E0E), const Color(0xffD31919)];
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text('Login', style: TextStyle(color: Color(0xfffefefe))),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(100))),
          flexibleSpace: Container(
              decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(100)),
            gradient: LinearGradient(
                colors: colors,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                10, MediaQuery.of(context).size.height * 0.2, 10, 0),
            child: Column(
              children: [
                TextReuse(
                  controller: emailController,
                  hintText: 'Enter email',
                  prefixIcon: const Icon(Icons.email, size: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextReuse(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: obscureText,
                  prefixIcon: Transform.flip(
                    flipX: true,
                    child: const Icon(Icons.key, size: 30),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 30),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                signInSignUpButton(context, true, () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((_) => BlocProvider.value(
                                      value: BlocProvider.of<NavigationCubit>(
                                          context),
                                      child: const RegistrationScreen(),
                                    ))),
                          ));
                }),
                signOption(context, "Don't Have Any Account? ", 'Register Now',
                    const RegistrationScreen()),
              ],
            ),
          ),
        ));
  }
}
