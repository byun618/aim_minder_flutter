import 'package:aim_minder_flutter/src/components/public/button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 87),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: () {}, child: Text('123')),
              ElevatedButton(onPressed: () {}, child: Text('123')),
              Button(
                onPressed: () {
                  debugPrint('asd');
                },
                size: const Size(37, 30),
                text: '로그인',
              ),
              Button(
                onPressed: () {
                  debugPrint('asd');
                },
                text: '로인',
              ),
              Button(
                onPressed: () {
                  debugPrint('asd');
                },
                variant: ButtonVariant.secondary,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                text: '로인',
              ),
              Button(
                onPressed: () {
                  debugPrint('asd');
                },
                variant: ButtonVariant.light,
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                text: '로인',
              ),
              Button(
                onPressed: () {
                  debugPrint('asd');
                },
                variant: ButtonVariant.link,
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                text: '로인',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
