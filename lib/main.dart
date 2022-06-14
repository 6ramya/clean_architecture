import 'package:clean_architecture/src/config/routes/app_routes.dart';
import 'package:clean_architecture/src/core/constants.dart';
import 'package:clean_architecture/src/injector.dart';
import 'package:clean_architecture/src/presentation/blocs/remote_articles_bloc.dart';
import 'package:clean_architecture/src/presentation/blocs/remote_articles_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 Future<void> main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (_)=>injector()..add(const GetArticles()) ,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: kMaterialAppTitle,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        )

    );
  }
}

