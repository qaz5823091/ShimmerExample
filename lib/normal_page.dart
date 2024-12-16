import 'package:flutter/material.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({super.key});

  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=33',
            )),
            Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Steven Ye',
                  style: TextStyle(fontWeight: FontWeight.w700),
                )),
          ],
        ),
      ),
    );
  }
}
