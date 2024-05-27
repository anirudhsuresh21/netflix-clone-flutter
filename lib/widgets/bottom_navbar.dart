import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/homescreen.dart';
import 'package:netflix_clone/screens/more.dart';
import 'package:netflix_clone/screens/searchscreen.dart';

// ignore: camel_case_types
class bottomNavBar extends StatelessWidget{
  const bottomNavBar({super.key});

  @override
  Widget build(BuildContext context){
    return DefaultTabController(length: 3, 
    child: Scaffold(
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 70,
        child: const TabBar(tabs: [
          Tab(
            icon:Icon(Icons.home) ,
            text: "Home",
          ),
          Tab(
            icon:Icon(Icons.search) ,
            text: "Search",
          ),Tab(
            icon:Icon(Icons.photo_library_outlined) ,
            text: "New & Hot",
          )
        ],
        indicatorColor: Colors.transparent,
        labelColor: Colors.white,
        unselectedLabelColor: Color(0xff999999),
        )
      ),
      body: const TabBarView(children: [
        HomeScreen(),
        SearchScreen(),
        MoreScreen(),

      ],)
    ));
  }
}