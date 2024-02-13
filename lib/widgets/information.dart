import 'package:flutter/material.dart';
import 'package:mini_projet/screens/questions_screen.dart';

var _firstName = '';
var _lastName = '';
var _emailAdress = '';
var _registrationNumber = 1;

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final _formKey = GlobalKey<FormState>();

  void _setInformation() {
    const questionIndex = 0;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => const QuestionsScreen(questionIndex: questionIndex),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final keywordSpace = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, keywordSpace + 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _firstName,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text(
                  'First Name',
                  style: TextStyle(
                      color: Color(0xFF0D1B2A), fontWeight: FontWeight.w500),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0D1B2A), width: 2),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length == 1 ||
                    value.trim().length > 50) {
                  return 'Mut be between 1 and 50 characters';
                }
                return null;
              },
              cursorColor: const Color(0xFF0D1B2A),
              onSaved: (value) {
                _firstName = value!;
              },
            ),
            TextFormField(
              initialValue: _lastName,
              maxLength: 50,
              decoration: const InputDecoration(
                label: Text(
                  'Last Name',
                  style: TextStyle(
                      color: Color(0xFF0D1B2A), fontWeight: FontWeight.w400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0D1B2A), width: 2),
                ),
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    value.trim().length == 1 ||
                    value.trim().length > 50) {
                  return 'Mut be between 1 and 50 characters';
                }
                return null;
              },
              cursorColor: const Color(0xFF0D1B2A),
              onSaved: (value) {
                _lastName = value!;
              },
            ),
            TextFormField(
              initialValue: _emailAdress,
              decoration: const InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(
                      color: Color(0xFF0D1B2A), fontWeight: FontWeight.w400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0D1B2A), width: 2),
                  // Color when focused
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email address';
                }
                // Use a regex to check if the entered email is valid
                // This is a basic example, you may want to use a more comprehensive regex
                if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null; // Return null if the input is valid
              },
              cursorColor: const Color(0xFF0D1B2A),
              onSaved: (value) {
                _emailAdress = value!;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text(
                  'Registration Number',
                  style: TextStyle(
                      color: Color(0xFF0D1B2A), fontWeight: FontWeight.w400),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0D1B2A), width: 2),
                  // Color when focused
                ),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    int.tryParse(value) == null ||
                    int.tryParse(value)! <= 0) {
                  return 'Must be a valid registration number';
                }
                return null;
              },
              cursorColor: const Color(0xFF0D1B2A),
              onSaved: (value) {
                _registrationNumber = int.parse(value!);
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF0D1B2A), width: 2),
                  ),
                  onPressed: () {
                    _formKey.currentState!.reset();
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Color(0xFF0D1B2A)),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D1B2A),
                  ),
                  onPressed: () {
                    _setInformation();
                  },
                  child: const Text(
                    'Start Exam',
                    style: TextStyle(
                      color: Color.fromARGB(255, 187, 187, 177),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
