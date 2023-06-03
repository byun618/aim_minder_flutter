import 'package:aim_minder_flutter/src/pages/bloc_provider_page.dart';
import 'package:aim_minder_flutter/src/pages/multi_bloc_provider_page.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIM Minder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const BlocProviderPage()),
                );
              },
              child: const Text('BlocProvider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const MultiBlocProviderPage()),
                );
              },
              child: const Text('MultiBlocProvider'),
            ),
          ],
        ),
      ),
    );
  }
}
