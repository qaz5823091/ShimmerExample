import 'package:flutter/material.dart';
import 'package:test_shimmer/loading_page.dart';
import 'package:test_shimmer/normal_page.dart';
import 'package:test_shimmer/shimmer_page.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const NormalPage()),
                    );
                  },
                  child: const Text('Normal Page')),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LoadingPage()),
                  );
                },
                child: const Text('Loading Page'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ShimmerPage()),
                    );
                  },
                  child: const Text('Shimmer Page')),
            ],
          ),
        ),
      ),
    );
  }
}
