import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:radix_freshers/api_service.dart';
import 'package:radix_freshers/detailpage.dart';
import 'package:radix_freshers/login.dart';
import 'package:radix_freshers/sourcedata.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final signin = GoogleSignIn();
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  await signin.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Text('Sign Out'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white, primary: Colors.black),
              ),
            ],
          ),
        ],
      ),
      body: _buildbody(context),
    );
  }
}

FutureBuilder<Datum> _buildbody(BuildContext context) {
  final client = ApiService(Dio());
  return FutureBuilder<Datum>(
    future: client.getSources(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        final List<Source>? post = snapshot.data!.sources;
        return ListView.builder(
          itemCount: post!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detailpage(
                            data: post[index],
                          )),
                );
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(post[index].name.toString()),
                ),
              ),
            );
          },
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
