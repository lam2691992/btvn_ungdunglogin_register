import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Màn hình đăng ký/đăng nhập'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController<bool> _cellphoneStreamController =
      StreamController<bool>.broadcast();
  final StreamController<bool> _emailStreamController =
      StreamController<bool>.broadcast();
  bool isSelectedCellphone = false;
  bool isSelectedEmail = false;
  bool _isTextFieldError = false;
  String _name = '';
  String _password = '';
  String _confirm = '';
  bool hidePassword = true;
  bool isChecked = false;
  bool isTermOfServicePressed = false;
  bool isPrivacyPolicyPressed = false;
  void dispose() {
    _cellphoneStreamController.close();
    _emailStreamController.close();
    super.dispose();
  }

  String? _validateTextField(String value) {
    if (value.isEmpty) {
      return 'Please enter a value';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        margin: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/2.jpg',
                width: 50,
                height: 50,
              ),
              const Text(
                'Create Account',
                style: TextStyle(fontWeight: FontWeight.w100, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 5,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text('Account'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<bool>(
                          stream: _cellphoneStreamController.stream,
                          initialData: isSelectedCellphone,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedCellphone = true;
                                  isSelectedEmail = false;
                                });
                                _cellphoneStreamController.sink.add(true);
                                _emailStreamController.sink.add(false);
                              },
                              child: Icon(
                                snapshot.data!
                                    ? Icons.check_circle_outline
                                    : Icons.radio_button_checked_outlined,
                                color:
                                    snapshot.data! ? Colors.blue : Colors.grey,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Cellphone',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        StreamBuilder<bool>(
                          stream: _emailStreamController.stream,
                          initialData: isSelectedEmail,
                          builder: (context, snapshot) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedCellphone = false;
                                  isSelectedEmail = true;
                                });
                                _cellphoneStreamController.sink.add(false);
                                _emailStreamController.sink.add(true);
                              },
                              child: Icon(
                                snapshot.data!
                                    ? Icons.check_circle_outline
                                    : Icons.radio_button_checked_outlined,
                                color:
                                    snapshot.data! ? Colors.blue : Colors.grey,
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Email',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: TextEditingController(text: '+84'),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 2,
                          child: TextField(
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              hintText: 'Please enter your cellphone',
                              hintStyle: const TextStyle(color: Colors.grey),
                              errorText:
                                  _isTextFieldError ? 'Invalid value' : null,
                            ),
                            onChanged: (value) {
                              setState(() {
                                _isTextFieldError =
                                    _validateTextField(value) != null;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Send code',
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          flex: 2,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter code',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 5,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Name',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _name = value;
                        });
                      },
                    ),
                    // ... Đoạn mã trước đó ...

                    const SizedBox(
                      height: 8,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 5,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Password',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.brightness_1,
                          size: 5,
                          color: Colors.pink,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Confirm',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _confirm = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Flexible(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isTermOfServicePressed =
                                    !isTermOfServicePressed;
                              });
                            },
                            child: Text(
                              'Registration that means you have read and agree to the ',
                              style: DefaultTextStyle.of(context).style,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isPrivacyPolicyPressed = !isPrivacyPolicyPressed;
                            });
                          },
                          child: Text(
                            'term of service',
                            style: TextStyle(
                              decoration: isTermOfServicePressed
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              color: isTermOfServicePressed
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const Text(' and '),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isPrivacyPolicyPressed = !isPrivacyPolicyPressed;
                            });
                          },
                          child: Text(
                            'privacy policy',
                            style: TextStyle(
                              decoration: isPrivacyPolicyPressed
                                  ? TextDecoration.underline
                                  : TextDecoration.none,
                              color: isPrivacyPolicyPressed
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
