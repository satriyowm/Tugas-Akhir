import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  late String role;

  @override
  Widget build(BuildContext context) {
    // Pastikan argumen role diterima dengan benar
    role = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg_login.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      role == 'Caregiver'
                          ? FontAwesomeIcons.userNurse
                          : FontAwesomeIcons.user,
                      size: 100,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Day Care App',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.email, color: Colors.blueAccent),
                      ),
                      validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock, color: Colors.blueAccent),
                      ),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blueAccent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text('Sign In'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Tambahkan log untuk memastikan navigasi dipanggil
                          print('Navigasi ke halaman sesuai peran: $role');
                          Navigator.pushReplacementNamed(
                              context,
                              role == 'Caregiver'
                                  ? '/home_caregiver'
                                  : '/home_parent');
                        }
                      },
                    ),
                    TextButton(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
