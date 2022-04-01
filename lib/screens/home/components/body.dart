import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  final String user;
  const Body({Key? key, required this.user}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream =
        FirebaseFirestore.instance.collection(widget.user).snapshots();
    return Scaffold(
      body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("asset/image/bg.jpg"),
            fit: BoxFit.cover,
          )),
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong',
                    style: TextStyle(color: Colors.white, fontSize: 55));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Loading",
                    style: TextStyle(color: Colors.white, fontSize: 55));
              }

              if (snapshot.data!.docs.isEmpty) {
                Map<String, dynamic> demoData = {
                  "zikr1": 0,
                  "zikr2": 0,
                  "zikr3": 0,
                };
                print('User doesn exist');
                print('Creating user');
                CollectionReference collectionReference =
                    FirebaseFirestore.instance.collection(widget.user);
                collectionReference.doc('counts').set(demoData);
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  print('User exists');
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Text(
                    data['zikr1'].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 55),
                  );
                }).toList(),
              );
            },
          )),
    );
  }
}
