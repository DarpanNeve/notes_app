import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final iDController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.10),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                    SelectableText(
                      "Hello. \nWelcome Back",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.10),
                    ),
                    const SizedBoxSample(),
                    SelectableText(
                      "ID",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    const SizedBoxSample(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: iDController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter your ID',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    SelectableText(
                      "Password",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.03),
                    ),
                    const SizedBoxSample(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter your Password',
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.all(12))),
                        onPressed: null,
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height * 0.03,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                      child: ElevatedButton(
                        style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.white),padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(12))),
                        onPressed: null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/google_logo.png',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width * 0.03,
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.height * 0.01,color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBoxSample(),
                    GestureDetector(
                      onTap: null,
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.02),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SizedBoxSample extends StatelessWidget {
  const SizedBoxSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }
}
