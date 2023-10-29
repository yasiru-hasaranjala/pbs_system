import 'package:flutter/material.dart';

Widget commonButton({
  required Function? function,
  required String text,
  double radius = 5,
  double height = 40,
  double width = double.infinity,
  double fontsize = 23.0,
  double border = 0.0,
  fontWeight,
  Color color = Colors.black,
  Color textcolor = Colors.white,
}) =>
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(
                color: textcolor,
                width: border,
              )),
          height: height,
          width: 300,
          child: MaterialButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            color: color,
            splashColor: color,
            onPressed: function ?? nullable(),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontsize,
                color: textcolor,
              ),
            ),
          ),
        ),
      ],
    );

Widget iconSocialmedia({
  String url = 'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-512.png',
  double size = 40,
}) =>
    MaterialButton(
      elevation: 0,
      highlightColor: Colors.white,
      hoverColor: Colors.white,
      shape: const CircleBorder(),
      color: Colors.white,
      onPressed: () {},
      child: Image(
        image: NetworkImage(url),
        height: size,
        width: size,
      ),
    );

AppBar appBar({
  String texT = 'Welcome'
}) =>
    AppBar(
      title: Text('$texT',style: const TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
      backgroundColor: Colors.pink,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
        ),
      ),
    );

Widget textField({
  required String hinttext,
  required suffixIcon,
  final controller,
  bool isPassword = false,
  bool isPasswordVisible = false,
  keyboardType,
  onChange,
}) =>
    SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        onChanged: onChange,
        cursorColor: Colors.black,
        style: const TextStyle(fontSize: 13),
        validator: (value) {
          if (isPassword & (value!.length < 8)) {
            return 'must be at lest 8 character';
          } else if (value.isEmpty) {
            return 'Cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: const TextStyle(color: Colors.black, fontSize: 13),
          suffixIcon: suffixIcon,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.red),
          ),
          errorStyle: const TextStyle(fontSize: 13.0, fontWeight: FontWeight.w400),
          enabledBorder: const OutlineInputBorder(
            // borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 2.0),
          ),
        ),
        textInputAction: TextInputAction.done,
        obscureText: isPasswordVisible,
      ),
    );



nullable() {}

