import 'package:flutter/material.dart';
import 'package:flutter_store_app/views/screens/navs_screen/account_screen.dart';
import 'package:flutter_store_app/views/screens/navs_screen/cart_screen.dart';
import 'package:flutter_store_app/views/screens/navs_screen/favorite_screen.dart';
import 'package:flutter_store_app/views/screens/navs_screen/home_screen.dart';
import 'package:flutter_store_app/views/screens/navs_screen/stores_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    FavoriteScreen(),
    StoresScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          currentIndex: _pageIndex,
          onTap: (value) => setState(() => _pageIndex = value),
          items: [
            BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      _pageIndex == 0 ? Colors.purple : Colors.grey,
                      BlendMode.srcIn),
                  child: Image.asset(
                    "assets/icons/home.png",
                    width: 25,
                  ),
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      _pageIndex == 1 ? Colors.purple : Colors.grey,
                      BlendMode.srcIn),
                  child: Image.asset(
                    "assets/icons/love.png",
                    width: 25,
                  ),
                ),
                label: "Favorites"),
            BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      _pageIndex == 2 ? Colors.purple : Colors.grey,
                      BlendMode.srcIn),
                  child: Image.asset(
                    "assets/icons/mart.png",
                    width: 25,
                  ),
                ),
                label: "Stores"),
            BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      _pageIndex == 3 ? Colors.purple : Colors.grey,
                      BlendMode.srcIn),
                  child: Image.asset(
                    "assets/icons/cart.png",
                    width: 25,
                  ),
                ),
                label: "Cart"),
            BottomNavigationBarItem(
                icon: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      _pageIndex == 4 ? Colors.purple : Colors.grey,
                      BlendMode.srcIn),
                  child: Image.asset(
                    "assets/icons/user.png",
                    width: 25,
                  ),
                ),
                label: "Account"),
          ]),
      body: _pages[_pageIndex],
    );
  }
}
