import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {

  IconData icon;
  final text;
  final function;

  ListTileDrawer({required this.function,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListTile(
            minLeadingWidth:10,
            leading: Icon(icon),title: Text(text),
            onTap:function
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(thickness: 1,),
        ),
      ],
    );
  }
}
