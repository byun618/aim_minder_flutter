import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:aim_minder_flutter/src/bloc/sample_second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProviderPage extends StatefulWidget {
  const MultiBlocProviderPage({super.key});

  @override
  State<MultiBlocProviderPage> createState() => _MultiBlocProviderPageState();
}

class _MultiBlocProviderPageState extends State<MultiBlocProviderPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SampleBloc(),
        ),
        BlocProvider(
          create: (context) => SampleSecondBloc(),
        ),
      ],
      child: const SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Center(
          child: Text('Block Provider Sample Page'),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  context.read<SampleBloc>().add(SampleEvent());
                },
                child: const Text('+')),
            ElevatedButton(
                onPressed: () {
                  context.read<SampleSecondBloc>().add(SampleSecondEvent());
                },
                child: const Text('-'))
          ],
        )
      ])),
    );
  }
}
