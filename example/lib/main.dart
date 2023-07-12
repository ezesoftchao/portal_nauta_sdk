import 'dart:io';
import 'package:flutter/material.dart';
import 'package:portal_nauta/portal_nauta.dart';

main() {
  // In your main.dart
  // HttpOverrides.global = MyProxyHttpOverride();
  runApp(MyApp());
}

final PROXY = "PROXY 192.168.0.18:8081;";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController captcha = new TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController old_password = new TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController new_password = new TextEditingController();

  PortalNauta portalNauta = PortalNauta();

  File captchaFile;

  @override
  Widget build(BuildContext context) {
    print("build hom widget");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Text("Cuba Libre"),
              ),

              captchaWidget(),

              TextField(
                controller: captcha,
                decoration: InputDecoration(hintText: "capcha"),
              ),
              // Image.file(file)
              FlatButton(
                onPressed: () async {
                  try {
                    final responseLogin = await portalNauta.login(
                        "damijavi@nauta.com.cu", "Damijavi08*", captcha.text);

                    final s = responseLogin ? "Correcto" : "Incorrecto";

                   final userInfo = await portalNauta.userInfo();

                    print("User info");
                  } on CaptchaWrongException {
                    print("Captcha incorrecta");
                  } on UserOrPasswordWrongException {
                    print("Password Incorrecto");
                  }
                },
                child: Text("Enviar"),
              ),
              Divider(),
              TextField(
                controller: old_password,
                decoration: InputDecoration(hintText: "Old"),
              ),
              TextField(
                controller: new_password,
                decoration: InputDecoration(hintText: "New"),
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    final responseChangePassword = await portalNauta.changePassword(
                        old_password.text, new_password.text, new_password.text);

                    final s = responseChangePassword ? "Correcto" : "Incorrecto";
                    
                    print("Cambio de contraseña " + s);
                  } on NewPasswordErrorValidationException {
                    print("Nueva contraseña no cumple los requisitos");
                  } on OldPasswordWrongException {
                    print("Password Incorrecta");
                  }
                },
                child: Text("Cambiar"),
              ),
              Divider(),
              FlatButton(
                onPressed: () async {
                  try {
                    final responseRecharge = await portalNauta.recharge(
                        "1234567890123456");

                    final s = responseRecharge ? "Correcto" : "Incorrecto";

                    print(s);
                  } on CodeWrong {
                    print("Codigo incorrecto");
                  }
                },
                child: Text("Recargar"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
    portalNauta.preLogin().then((value) {
      captchaFile = value;

      setState(() {});
    });
  }

  captchaWidget() {
    if (captchaFile == null) {
      return CircularProgressIndicator();
    }

    return Image.file(captchaFile);
  }
}

class MyProxyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return PROXY;
      }
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
