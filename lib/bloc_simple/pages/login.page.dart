import 'package:bloc_sample/bloc_simple/logic/auth/cubit/auth_cubit.dart';
import 'package:bloc_sample/bloc_simple/router/app_route.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width,
                height: height * 0.45,
                child: Image.asset(
                  'assets/images/Jalo Try.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                ' Wellcome ',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25.0,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  suffixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: const Icon(Icons.password),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('create new Account'),
                style: ElevatedButton.styleFrom(primary: Colors.teal),
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .signup(emailController.text, passwordController.text);
                },
              ),
              ElevatedButton(
                child: const Text('Log IN'),
                style: ElevatedButton.styleFrom(primary: Colors.teal),
                onPressed: () {
                  context
                      .read<AuthCubit>()
                      .login(emailController.text, passwordController.text)
                      .whenComplete(() => HomeRoute);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
