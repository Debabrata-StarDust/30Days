import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:product_app/view/homeView.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _animateButton = false;
  final _fromKey = GlobalKey<FormState>();
  String _name = '';

  moveToHome(BuildContext context) async {
    if (_fromKey.currentState!.validate()) {
      setState(() {
        _animateButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      // ignore: use_build_context_synchronously
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeView()));
      setState(() {
        _animateButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _fromKey,
          child: Column(
            children: [
              SizedBox(
                height: 350,
                child: SvgPicture.asset(
                  "assets/images/login.svg",
                ),
              ),
              Text(
                "Wellcome $_name",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onChanged: (value) {
                    _name = value;
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username shoud not empty";
                    }
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Enter UserName",
                      labelText: "User Name"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password shoud not empty";
                    }
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: "Enter Password",
                      labelText: "Password"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Material(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(_animateButton ? 50 : 5),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    alignment: Alignment.center,
                    height: 50,
                    width: _animateButton ? 50 : 350,
                    // decoration: BoxDecoration(
                    //   // shape:
                    //   //     _animateButton ? BoxShape.circle : BoxShape.rectangle,
                    //   borderRadius:
                    //       BorderRadius.circular(_animateButton ? 50 : 0),
                    //   color: Colors.deepPurpleAccent,
                    // ),
                    child: _animateButton
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
