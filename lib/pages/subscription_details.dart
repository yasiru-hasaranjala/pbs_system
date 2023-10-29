import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pbs_admin/shared/components/components.dart';

class SubscriptionDetails extends StatefulWidget {
  const SubscriptionDetails({Key? key}) : super(key: key);

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(texT: 'Subscription Details'),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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


            return DataTable(
              // Datatable widget that have the property columns and rows.
                columns: const [
                  // Set the name of the column
                  DataColumn(label: Text('User ID'),),
                  DataColumn(label: Text('Name'),),
                  DataColumn(label: Text('Email'),),
                  DataColumn(label: Text('Subscription Date'),),
                ],
                rows:_buildList(context, item)
            );
          }
        ),
      ),
    );
  }

  List<DataRow> _buildList(BuildContext context, List item) {
    return  item.expand((data) => [if(data["Subscription"] == 1) _buildListItem(context, item.indexOf(data),data) ]).toList();
  }



  DataRow _buildListItem(BuildContext context, int id,final data) {

    return DataRow(cells: [
      DataCell(Text((id+1).toString())),
      DataCell(Text(data["Name"])),
      DataCell(Text(data["email"])),
      DataCell(Text(data["date"])),
    ]);
  }

}
