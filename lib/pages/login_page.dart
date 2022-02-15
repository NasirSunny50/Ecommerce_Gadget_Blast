import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 40 ),
            children: [

              Container(
                padding: const EdgeInsets.all(8.0),
                alignment: Alignment.topCenter,
                child: Text('Admin Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
            ),

              SizedBox(height: 50,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded, color: Colors.orange),
                  hintText: 'Email Address',
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('This field must not be empty'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),


              TextFormField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock, color: Colors.orange),
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                    onPressed: (){
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  hintText: 'Password',
                ),
                validator: (value){
                  if(value==null || value.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('This field must not be empty'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                  return null;
                },
              ),
              SizedBox(height: 20,),

              ElevatedButton(
                  onPressed: _loginAdmin,
                  child: Text('Login')
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginAdmin() {
  }
}
