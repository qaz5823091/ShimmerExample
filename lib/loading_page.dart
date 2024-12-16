import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Future<List<String>> _future;

  @override
  void initState() {
    super.initState();
    _future = _getData();
  }

  Future<List<String>> _getData() async {
    await Future.delayed(const Duration(seconds: 2));
    return ['https://i.pravatar.cc/150?img=33', 'Steven Ye'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildLoadingWidget();
              }

              final data = snapshot.data!;
              return _buildDoneWidget(data.first, data.last);
            }),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const CircularProgressIndicator();
  }

  Widget _buildDoneWidget(String url, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            backgroundImage: NetworkImage(
          url,
        )),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w700),
            )),
      ],
    );
  }
}
