import 'package:bagzz/screens/basket/basket_screen.dart';
import 'package:bagzz/screens/home/home_screen.dart';
import 'package:bagzz/screens/search/search_screen.dart';
import 'package:bagzz/screens/wishlist/wishlist_screen.dart';
import 'package:bagzz/util/global_variables.dart';
import 'package:flutter/material.dart';

class SelectedScreen extends StatefulWidget {
  const SelectedScreen({Key? key}) : super(key: key);

  @override
  State<SelectedScreen> createState() => _SelectedScreenState();
}

class _SelectedScreenState extends State<SelectedScreen> {
  final GlobalVariables _gBloc = GlobalVariables();

  int _selectedScreenIndex = 0;
  final List _screens = const [
    HomeScreen(),
    SearchScreen(),
    WishlistScreen(),
    BasketScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/menu.png",
            width: 24,
            height: 14,
          ),
          iconSize: 14,
        ),
        centerTitle: false,
        title: Text(
          "bagzz",
          style: TextStyle(
            fontFamily: "playfair-display",
            fontWeight: FontWeight.w700,
            color: _gBloc.primaryColor,
            fontSize: 22,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1542206395-9feb3edaa68d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1964&q=80",
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (value) {
          setState(() {
            _selectedScreenIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: ''),
        ],
        selectedItemColor: _gBloc.primaryColor,
        unselectedItemColor: _gBloc.primaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
