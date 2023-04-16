import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:letmegrab/common/commonpopup.dart';
import 'package:letmegrab/logics/email_auth.dart';
import 'package:letmegrab/model/api/api_service.dart';
import 'package:letmegrab/view/homscreen.dart';
import 'package:letmegrab/view/sign_up_page.dart';
import 'package:provider/provider.dart';
import '../model/provider/datanotifier.dart';

class Login_page extends StatefulWidget {
  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final _emailctrl = TextEditingController();
  final _passwordctrl = TextEditingController();
  final apiservice = new ApiService();
  double? screenWidth;

  bool isEmail(String input) => EmailValidator.validate(input);
  Future<bool> _isBack() {
    return Popup().ExitAlert(context);
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.macOS) {
      screenWidth = MediaQuery.of(context).size.width / 2.5;
    } else {
      screenWidth = MediaQuery.of(context).size.width;
    }
    return SafeArea(
      child: WillPopScope(
        onWillPop: _isBack,
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Container(
                width: screenWidth,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50,
                        child: Image(
                          image: AssetImage('asset/letmegrab.jpg'),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    width: screenWidth! * 0.8,
                                    child: TextFormField(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      controller: _emailctrl,
                                      decoration: InputDecoration(
                                          hintText: "Enter Email",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                              width: 5,
                                            ),
                                          ),
                                          prefixIcon: Icon(Icons.email)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter emailID";
                                        }
                                        if (!isEmail(value)) {
                                          return "Enter valid Email";
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    width: screenWidth! * 0.8,
                                    child: TextFormField(
                                      controller: _passwordctrl,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                          hintText: "Enter password",
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                              width: 5,
                                            ),
                                          ),
                                          prefixIcon: const Icon(Icons.lock)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Please Enter Password";
                                        }
                                        if (value.length < 8) {
                                          return "Password must have 8 characters";
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10),
                              child: Container(
                                width: screenWidth! * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.green,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: MaterialButton(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        var user_data = await AuthService.instance?.logIn(_emailctrl.text, _passwordctrl.text);
                                        if (user_data != null) {
                                          Navigator.of(context).push(MaterialPageRoute(
                                              builder: (BuildContext context) => ChangeNotifierProvider(
                                                    create: (context) => DataNotifier(),
                                                    child: HomeScreen(_emailctrl.text),
                                                  )));
                                        } else {
                                          final snackBar = SnackBar(
                                              content: Row(
                                                children: const [
                                                  Flexible(
                                                    child: Text(
                                                      "You are not a registered User, Please create an Account for Login",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily: 'Poppins',
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              duration: const Duration(seconds: 3),
                                              backgroundColor: Colors.red);
                                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                        }
                                      }
                                    },
                                    child: const Text(
                                      'Log in',
                                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Colors.black, fontSize: 30),
                            children: <TextSpan>[
                              const TextSpan(text: "Don't have an account?  ", style: TextStyle(color: Colors.black)),
                              TextSpan(
                                  text: 'Create Account',
                                  style: const TextStyle(decoration: TextDecoration.underline, color: Colors.green),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _formkey.currentState?.reset();
                                      _emailctrl.clear();
                                      _passwordctrl.clear();
                                      //navigate to desired screen
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => SignUpUser()),
                                      );
                                    }),
                            ],
                          ),
                          textScaleFactor: 0.5,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
