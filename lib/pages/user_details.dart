import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pbs_admin/shared/components/components.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(texT: 'User Details'),
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
                  ],
                  rows:_buildList(context, item)
              );
            }
        ),
      ),
    );
      }

  List<DataRow> _buildList(BuildContext context, List item) {
    return  item.map((data) => _buildListItem(context, item.indexOf(data),data)).toList();
  }



  DataRow _buildListItem(BuildContext context, int id,final data) {

    return DataRow(cells: [
      DataCell(Text((id+1).toString())),
      DataCell(Text(data["Name"])),
      DataCell(Text(data["email"])),
    ]);
  }
}
