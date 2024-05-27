import 'package:ciclo_de_vida_widgets/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetsObserverFromNative extends StatefulWidget {
  const WidgetsObserverFromNative({super.key});

  @override
  State<WidgetsObserverFromNative> createState() =>
      _WidgetsObserverFromNativeState();
}

class _WidgetsObserverFromNativeState extends State<WidgetsObserverFromNative>
    with WidgetsBindingObserver //observador de forma nativa
{
  String? _status;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('Estado del ciclo de vida: $state');
    setState(() {
      _status = state.name;
    });
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this); //inicializa el observador
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //elimina el observador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WidgestLifecycle(),
                ),
              );
            },
            child: FlutterLogo(
              size: MediaQuery.of(context).size.width,
            ),
          ),
          if (_status != null)
            Text(
              _status!,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      )),
    );
  }
}

class WidgestLifecycle extends StatefulWidget {
  const WidgestLifecycle({super.key});

  @override
  State<WidgestLifecycle> createState() => _WidgestLifecycleState();
}

class _WidgestLifecycleState extends State<WidgestLifecycle> {
  // int counter = 0;
  final _keyText = GlobalKey();

  @override
  void activate() {
    print('activate');
    super.activate();
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies <wigted1>');
    //  final myCounter = context.watch<CounterProvider>().counter; //llama al proveedor
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant WidgestLifecycle oldWidget) {
    //actuliza el widget
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    print('initState');
    super.initState();
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          GestureDetector(
            onTap: () {
              print('Botonn Reconstruir widget');
              context.read<CounterProvider>().add();
              // Provider.of<CounterProvider>(context, listen: false).add();
            },
            child: FlutterLogo(
              size: MediaQuery.of(context).size.width / 1.5,
            ),
          ),
          MyChildWiget(
            key: _keyText,
          ), //tiene que ser sin const para que funcione el actulizar  
         
         
        ],
      )),
    );
  }
}

class MyChildWiget extends StatefulWidget {
  const MyChildWiget({
    super.key,
  });

  @override
  State<MyChildWiget> createState() => _MyChildWigetState();
}

class _MyChildWigetState extends State<MyChildWiget> {
  // @override
  // void didUpdateWidget(covariant MyChildWiget oldWidget) {
  //   print('didUpdateWidget2 : ${oldWidget.counter} vs ${widget.counter}'); //actuliza el widget
  //   super.didUpdateWidget(oldWidget);
  // }

   @override
  void activate() {
    print('activate2 $hashCode');
    super.activate();
  }

  @override
  void deactivate() {
    print('deactivate2 $hashCode');
    super.deactivate();
  }

   @override
  void initState() {
    print('initState2 $hashCode');
    super.initState();
  }

   @override
  void dispose() {
    print('dispose2 $hashCode');
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies2 ');
    // final myCounter = context.watch<CounterProvider>().counter; //llama al proveedor
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('build 2 wig');
    return Consumer<CounterProvider>(
      builder: (context, value, _) {
        return Text(
          'Suscribete al canal: ${value.counter}',
          style: const TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
        );
      },
    );
  }
}
