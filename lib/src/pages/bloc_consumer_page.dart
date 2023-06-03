import 'package:aim_minder_flutter/src/bloc/sample_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocConsumerPage extends StatefulWidget {
  const BlocConsumerPage({super.key});

  @override
  State<BlocConsumerPage> createState() => _BlocConsumerPageState();
}

class _BlocConsumerPageState extends State<BlocConsumerPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SampleBloc(), child: const SamplePage());
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  void _showMessage(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('asdasd'),
            content: const Text('content'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<SampleBloc, int>(
            listenWhen: (previous, current) => current > 5,
            listener: (context, state) {
              _showMessage(context);
            },
            buildWhen: (previous, current) => current % 2 == 0,
            builder: (context, state) => Text(
                  state.toString(),
                  style: const TextStyle(fontSize: 30),
                )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBloc>().add(AddSampleEvent());
        },
      ),
    );
  }
}
