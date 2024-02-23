import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dashboard_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _nameState();
}

class _nameState extends State<LoginScreen> {
  bool isLoading = false;

  final txtUser = TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );
  final pwdUser = TextFormField(
    keyboardType: TextInputType.text,
    obscureText: true,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/fondo.jpg'))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 470,
            child: Opacity(
              opacity: .65,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                height: 155,
                width: MediaQuery.of(context).size.width * .9,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    txtUser,
                    const SizedBox(
                      height: 10,
                    ),
                    pwdUser
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 450,
            height: 180, // Altura deseada
            child: Image.asset(
              "images/logo_text.png",
              fit: BoxFit.fitWidth, // Ajusta la imagen al ancho del contenedor
            ),
          ),
          Positioned(
              bottom: 50,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width -
                    MediaQuery.of(context).padding.top,
                child: ListView(shrinkWrap: true, children: [
                  ElevatedButton.icon(
                    icon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        isLoading = !isLoading;
                      });
                      Future.delayed(new Duration(milliseconds: 5000), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => new RegisterScreen(),
                            ));
                      });
                    },
                    label: const Text(
                      "Registrarse con Email",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 45, 186, 239), // Color de fondo del botón
                      fixedSize: const Size(210, 45), // Tamaño del botón
                    ),
                  ),
                  SignInButton(Buttons.Email, onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(const Duration(milliseconds: 5000), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new DashboardScreen(),
                          ));
                    });
                  }),
                  SignInButton(Buttons.Google, onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(new Duration(milliseconds: 5000), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new DashboardScreen(),
                          ));
                    });
                  }),
                  SignInButton(Buttons.Facebook, onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(new Duration(milliseconds: 5000), () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new DashboardScreen(),
                          ));
                    });
                  }),
                  SignInButton(Buttons.GitHub, onPressed: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                    Future.delayed(new Duration(milliseconds: 5000), () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => new DashboardScreen(),
                          ))*/
                      ;
                      Navigator.pushNamed(context, "/dash").then((value) {
                        setState(() {
                          isLoading != isLoading;
                        });
                      });
                    });
                  }),
                ]),
              )),
          isLoading
              ? const Positioned(
                  top: 260,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ))
              : Container()
        ],
      ),
    ));
  }
}
