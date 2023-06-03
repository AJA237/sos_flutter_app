import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/Cubit/cubit/navigation_cubit.dart';

class TextReuse extends StatefulWidget {
  final prefixIcon;
  final suffixIcon;
  final bool obscureText;
  final String? hintText;
  final TextEditingController? controller;

  TextReuse({
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.controller,
  });

  @override
  State<TextReuse> createState() => _TextReuseState();
}

class _TextReuseState extends State<TextReuse> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
          labelStyle: const TextStyle(color: Color(0xffeceaea)),
          filled: true,
          fillColor: const Color(0xffF5F4F4),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Color(0xFFD31919),
          suffixIcon: widget.suffixIcon,
          suffixIconColor: Color(0xFFD31919),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none),
          )),
    );
  }
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        gradient: const LinearGradient(
            colors: [Color(0xffD31919), Color(0xffEE3434)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: const ButtonStyle(),
      child: Text(isLogin ? 'LOGIN' : 'REGISTER',
          style: const TextStyle(color: Color(0xfffefefe))),
    ),
  );
}

Row signOption(
    BuildContext context, String text, String nameTextButton, final page) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<NavigationCubit>(context),
                        child: page,
                      )));
        },
        child: Text(
          nameTextButton,
          style: const TextStyle(color: Color(0xffD31919)),
        ),
      ),
    ],
  );
}
