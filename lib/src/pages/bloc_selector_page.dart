import 'package:aim_minder_flutter/src/bloc/bloc_selector_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorPage extends StatefulWidget {
  const BlocSelectorPage({super.key});

  @override
  State<BlocSelectorPage> createState() => _BlocSelectorPageState();
}

class _BlocSelectorPageState extends State<BlocSelectorPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BlocSelectorBloc(), child: const SamplePage());
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
                selector: (state) => state.changeState,
                builder: (context, state) {
                  debugPrint('selector builder');
                  // return IconButton(
                  //     onPressed: () {
                  //       context
                  //           .read<BlocSelectorBloc>()
                  //           .add(ChangeStateEvent());
                  //     },
                  //     icon: Icon(
                  //       Icons.favorite,
                  //       color: state ? Colors.red : Colors.grey,
                  //       // size: 70,
                  //     ));
                  // return Icon(
                  //   Icons.favorite,
                  //   color: state ? Colors.red : Colors.grey,
                  //   size: 70,
                  // );
                  return Text(
                    state.toString(),
                    style: const TextStyle(fontSize: 70),
                  );
                },
              ),
              BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
                  buildWhen: (previous, current) => current.changeState,
                  builder: (context, state) {
                    debugPrint('bloc builder');
                    return Text(state.value.toString(),
                        style: const TextStyle(fontSize: 70));
                  }),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                  },
                  child: const Text('Change State'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<BlocSelectorBloc>().add(ValueEvent());
                  },
                  child: const Text('Increment Value'),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
