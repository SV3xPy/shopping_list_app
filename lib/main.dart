import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/app_value_notifier.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/despensa_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_application_1/screens/splash_screen.dart';
import 'package:flutter_application_1/settings/theme.dart';

void main() => runApp(const MyApp());

//Para cambiarlo a stateful es control punto sobre el stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AppValueNotifier.banTheme,
        builder: (context, value, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: value
                ? ThemeApp.darkTheme(context)
                : ThemeApp().lightTheme(context),
            home: const SplashScreen(),
            routes: {
              "/dash": (BuildContext context) => const DashboardScreen(),
              "/despensa": (BuildContext context) => const DespensaScreen(),
              "/register": (BuildContext context) => const RegisterScreen()
            },
          );
        });
  }
}
/*class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Algo de inicio',
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          backgroundColor : Colors.red,
          onPressed: (){
            contador++;
            print(contador);
            setState(() {
              
            });
          },
          child: Icon(Icons.ads_click),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.network('https://wallpapercave.com/wp/wp4667133.jpg',
                height: 250),
              ),
            Text('Valor del contador $contador')],
          )
      ),
    );
  }
}*/