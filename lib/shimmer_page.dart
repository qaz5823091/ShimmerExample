import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPage extends StatefulWidget {
  const ShimmerPage({super.key});

  @override
  State<ShimmerPage> createState() => _ShimmerPageState();
}

class _ShimmerPageState extends State<ShimmerPage> {
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
                return _buildShimmerWidget();
              }

              final data = snapshot.data!;
              return _buildDoneWidget(data.first, data.last);
            }),
      ),
    );
  }

  Widget _buildShimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              width: 50,
              height: 10,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
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
