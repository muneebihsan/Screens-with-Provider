import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/auth_with_provider.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider =Provider.of<AuthProvider>(context,listen: false);
    print('builder');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Screen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),

              ),
              SizedBox(
                height: 30,
              ),
             Consumer<AuthProvider>(builder: (context,value,child){
               return TextFormField(
                 obscureText: authProvider.visibile,
                 keyboardType: TextInputType.visiblePassword,
                 decoration: InputDecoration(
                   suffixIcon: InkWell(
                     onTap: (){
                       authProvider.visibilitySet();
                     },
                     child:Icon( authProvider.visibile? Icons.visibility_off:Icons.visibility),
                   ),
                   labelText: 'Password',
                 ),

               );
             }),
              SizedBox(
                height: 40,
              ),
           Consumer<AuthProvider>(builder: (context,value,child){
             return    InkWell(
               onTap: (){
                 value.loadingSet();
               },
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.deepOrange,
                   borderRadius: BorderRadius.circular(20),
                 ),

                 width: double.infinity,
                 height: 50,
                 child: Center(child: authProvider.loading? CircularProgressIndicator(
                   color: Colors.white,
                 ): Text('Login') ),
               ),
             );
           })
            ],
          ),
        ),
      ),
    );
  }
}
