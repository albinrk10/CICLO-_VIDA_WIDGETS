import 'package:ciclo_de_vida_widgets/dependency_injection.dart';
import 'package:ciclo_de_vida_widgets/widgest_lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CICLO de VIDA DE LOS WIDGETS',
        // home: Scaffold(
        //   appBar: AppBar(
        //     title: const Text('Material App Bar'),
        //   ),
        //   body: const WidgetsObserverFromNative(),
        // ),
       home: WidgetsObserverFromNative(),
      ),
    );
  }
}