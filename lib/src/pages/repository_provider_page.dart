import 'package:aim_minder_flutter/src/bloc/sample_bloc_di.dart';
import 'package:aim_minder_flutter/src/repository/repository_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryProviderPage extends StatefulWidget {
  const RepositoryProviderPage({super.key});

  @override
  State<RepositoryProviderPage> createState() => _RepositoryProviderPageState();
}

class _RepositoryProviderPageState extends State<RepositoryProviderPage> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositorySample(),
      child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: const SamplePage(),
      ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBlocDI, int>(
            builder: (context, state) =>
                Text(state.toString(), style: const TextStyle(fontSize: 70))),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        context.read<SampleBlocDI>().add(SampleDIEvent());
      }),
    );
  }
}
