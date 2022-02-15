import 'package:ecommerce_gadget_blast/auth/auth_service.dart';
import 'package:ecommerce_gadget_blast/pages/dashboard_page.dart';
import 'package:ecommerce_gadget_blast/pages/login_page.dart';
import 'package:flutter/material.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';

  @override
  _LauncherPageState createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){
      if(AuthService.currentUser == null){
        Navigator.pushNamed(context, LoginPage.routeName);
      }
      else{
        Navigator.pushNamed(context, DashboardPage.routeName);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('images/Gadget.png'),
      )
    );
  }
}
