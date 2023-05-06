import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/Style/app_style.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 16.0,
        title: const Text("notes App"),
        centerTitle: true,
        backgroundColor: AppStyle.mainColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Your recent Notes",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Center(
                      child: Text(
                        document['title'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          )
          // StreamBuilder(
          //   stream: FirebaseFirestore.instance.collection("Notes").snapshots(),
          //   builder: (BuildContext context,
          //       AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     return Expanded(
          //       child:GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.00), itemBuilder: (context, index) {
          //         return Center(
          //             child: Text(
          //             document['title'],
          //             style: const TextStyle(color: Colors.white),
          //           ),
          //         );
          //
          //
          //       },)
          //     );
          //   },),
        ],
      ),
    );
  }
}
