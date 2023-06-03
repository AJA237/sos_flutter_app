import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/common_widget/reusable.dart';
import '../../logic/Cubit/cubit/navigation_cubit.dart';
import 'login.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  List<Color> colors = [const Color(0xffA20E0E), const Color(0xffD31919)];
  bool obscureText = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(100))),
          title: const Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text('Register', style: TextStyle(color: Color(0xfffefefe))),
          ),
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
                20, MediaQuery.of(context).size.height * 0.1, 20, 0),
            child: Column(
              children: [
                TextReuse(
                  controller: userNameController,
                  hintText: 'Full name',
                  prefixIcon: const Icon(Icons.person, size: 40),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextReuse(
                  controller: phoneController,
                  hintText: 'Phone',
                  prefixIcon: const Icon(Icons.phone, size: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
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
                      size: 30,
                    ),
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
                signInSignUpButton(context, false, () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => BlocProvider.value(
                                    value: BlocProvider.of<NavigationCubit>(
                                        context),
                                    child: const LoginScreen(),
                                  )))))
                      .onError((error, stackTrace) =>
                          print('Error ${error.toString()}'));
                }),
                signOption(context, 'Have an Account already? ', 'Login Now',
                    const LoginScreen())
              ],
            ),
          ),
        ));
  }
}
