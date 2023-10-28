import 'package:flutter/material.dart';
import 'package:task_5/MyHome.dart';


void main()
{
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Simplife EG',


        home:  MyHome()
    );
  }
}



