import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbs_admin/shared/components/components.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final ref = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 3;

    return Scaffold(
      appBar: appBar(texT: 'Welcome'),

      body: GridView(
        shrinkWrap: true,

        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.55
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StreamBuilder(
                stream: ref.child("Users").onValue,
                builder: (context, snap) {
                  if (snap.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  final data = snap.data?.snapshot.value as Map<dynamic, dynamic>;
                  List item = [];
                  data.forEach((index, data) => item.add({"key": index, ...data}));


                  return gradientCardSample("Total Users", item.length.toString(), itemWidth);
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StreamBuilder(
                stream: ref.child("bicycles").onValue,
                builder: (context, snap) {
                  if (snap.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  final data = snap.data?.snapshot.value as Map<dynamic, dynamic>;
                  List item = [];
                  data.forEach((index, data) => item.add({"key": index, ...data}));


                  return gradientCardSample("Total Bicycles", item.length.toString(), itemWidth);
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: StreamBuilder(
                stream: ref.child("Users").onValue,
                builder: (context, snap) {
                  if (snap.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snap.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  final data = snap.data?.snapshot.value as Map<dynamic, dynamic>;
                  List item = [];
                  data.forEach((index, data) => item.add({"key": index, ...data}));

                  int count = 0;
                  item.expand((data) => [if(data["Subscription"] == 1) count++ ]).toList();

                  return gradientCardSample("Total Subscribers", count.toString(), itemWidth);
                }
            ),
          )
        ],
      ),
    );
  }

  Widget gradientCardSample(String text, String val, double itemWidth) {
    return Container(
      height: 200,
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 16),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ Color(0xFF846AFF), Color(0xFF755EE8), Colors.purpleAccent,Colors.amber,],
          ),
          borderRadius: BorderRadius.circular(16)), // Adds a gradient background and rounded corners to the container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                children: [
                  Text(text, style: TextStyle(
                      color: Colors.white,
                      fontFamily: "monospace",
                      fontSize: (itemWidth/16.0)
                  )), // Adds a title to the card
                  const Spacer(),
                  const Image(
                    height: 50,
                    width: 50,
                    image: AssetImage('images/logo.png'),
                    fit: BoxFit.cover,
                  ),
                ],
              ), // Adds a subtitle to the card
            ],
          ),
          Text(val, style: TextStyle(
              fontSize: (itemWidth/7.0),
              fontWeight: FontWeight.bold,
              color: Colors.yellowAccent
          )) // Adds a price to the bottom of the card
        ],
      ),
    );
  }
}