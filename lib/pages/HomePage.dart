
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/Navbar.dart';
import 'Favorites.dart';
import 'Market.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController viewController;
  @override
  void initState() {
    super.initState();
    viewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      
      drawer: Navbar(),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(40),
          child: SizedBox(
            
              height: 45,
              child: Image.asset(
                "assets/images/nametrans2.png",
                fit: BoxFit.contain,
                 
              )),
        ),
      ),
      body: SafeArea(
        child: Container(
          
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              
              
              TabBar(
                controller: viewController,
                
                tabs: [
                  Tab(
                    child: Text(
                      "Markets",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Favorites",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Tab(
                    child: Text(
                      "News",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  controller: viewController,
                  children: [Markets(), Favorites(), CryptoNewsList()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
