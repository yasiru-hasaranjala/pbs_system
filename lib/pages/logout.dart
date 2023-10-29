import 'package:flutter/material.dart';
import 'package:pbs_admin/pages/login.dart';
import 'package:pbs_admin/shared/components/components.dart';

class Logout extends StatelessWidget {
  const Logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 150.0),
          ),
          commonButton(
            text: 'Log Out',
            function: () async {
              Navigator.pop(context);
            },
            fontsize: 25.0,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0), ),

        ],
      ),
    );
  }
}
