import 'package:flutter/material.dart';
import 'package:radix_freshers/sourcedata.dart';

class Detailpage extends StatefulWidget {
  final Source data;

  Detailpage({Key? key, required this.data}) : super(key: key);

  @override
  _DetailpageState createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Container(
        child: Card(
          child: Column(
            children: [Text('')],
          ),
        ),
      ),
    );
  }
}
