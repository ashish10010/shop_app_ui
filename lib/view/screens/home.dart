import 'package:flutter/material.dart';
import 'package:shop_app/view/screens/cart_page.dart';
import 'package:shop_app/view/screens/product_lists.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
     

 int currentPage = 0;
 List<Widget> pages = [ProductList(),CartPage()];

     
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
       children:pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
      currentIndex: currentPage,
      onTap: (value) {
        setState(() {
          currentPage = value;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: "",
           ),
        ],
      ),
   
    );
  }
}