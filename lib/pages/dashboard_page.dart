import 'package:ecommerce_gadget_blast/auth/auth_service.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(onPressed: (){
            AuthService.logout().then((value){
              Navigator.pushReplacementNamed(context, LoginPage.routeName);
            });
          }, icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        mainAxisSpacing: 30,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
              ),
              onPressed: (){
              },
              child: Text('Add Product'),
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
              ),
              onPressed: (){
              },
              child: Text('Catagory')
          ),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.orange.shade300,
            ),
              onPressed: (){
              },
              child: Text('View Product'),
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
              ),
              onPressed: (){
              },
              child: Text('View Orders')
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
              ),
              onPressed: (){
              },
              child: Text('View Reports')
          ),

          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange.shade300,
              ),
              onPressed: (){
              },
              child: Text('Manage Users')
          ),
        ],
      )
    );
  }
}
