import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hydrated_bloc/bloc/brightness/brightness_cubit.dart';
import 'package:flutter_hydrated_bloc/counter_page.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // ensureInitialized() called because app using HydratedBloc which using native native brigde
  WidgetsFlutterBinding.ensureInitialized();

  // HydratedStorage is built on top of hive for a platform-agnostic, performant storage layer.
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrightnessCubit(),
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrightnessCubit, Brightness>(
      builder: (context, brightness) {
        return MaterialApp(
          theme: ThemeData(brightness: brightness),
          home: CounterPage(),
        );
      },
    );
  }
}
