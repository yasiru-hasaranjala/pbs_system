import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pbs_admin/pages/sidebar.dart';
import 'package:pbs_admin/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ref = FirebaseDatabase.instance.ref();
  var email = TextEditingController();

  var test = TextEditingController();

  String password = '';
  var pass = TextEditingController();
  bool isPasswordVisible = true;

  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    email.addListener(() => setState(() {}));
  }

  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PBS',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              ' ',
              style: TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Sri Lanka',
              style: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 0,
          left: 20,
          right: 20,
          bottom: 0,
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Image(
                height: 200,
                width: 200,
                image: AssetImage('images/logo.png'),
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Admin Log in',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              /*email*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                hinttext: 'Admin Email',
                suffixIcon: email.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                  icon: const Icon(Icons.close, size: 20.0, color: Colors.black),
                  onPressed: () => email.clear(),
                ),
              ),
              const SizedBox(height: 10),
              /*password*/ textField(
                keyboardType: TextInputType.emailAddress,
                controller: pass,
                hinttext: 'Password',
                isPassword: true,
                suffixIcon: pass.text.isEmpty
                    ? Container(width: 0)
                    : IconButton(
                  icon: isPasswordVisible
                      ? const Icon(Icons.visibility_off, size: 20.0, color: Colors.black)
                      : const Icon(Icons.visibility, size: 20.0, color: Colors.black),
                  onPressed: () => setState(
                        () => isPasswordVisible = !isPasswordVisible,
                  ),
                ),
                onChange: (value) => setState(() => password = value),
                isPasswordVisible: isPasswordVisible,
              ),
              const SizedBox(height: 20),
              /*login*/ commonButton(
                text: 'Log In',
                function: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      showSpinner = true;
                    });
                    try {
                      ref.child("Admin").onValue.listen((DatabaseEvent event) {
                        final em = event.snapshot.child("email").value;
                        final pw = event.snapshot.child("pw").value;
                        if(em.toString() == email.text && pw.toString() == password){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SideBar()));
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(child: Text("Invalid Credentials. Please try again!")),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      });
                    } catch (e) {
                      if (kDebugMode) {
                        print(e);
                      }
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  }
                },
                fontsize: 25.0,
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  Text('Please login using Admin Credentials'),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
