
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/Cryptocurrency.dart';
import '../providers/market_provider.dart';
import '../widgets/CryptoListTile.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
      builder: (context, marketProvider, child) {
        List<CryptoCurrency> favorites = marketProvider.markets
            .where((element) => element.isFavorite == true)
            .toList();
        if (favorites.length > 0) {
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              CryptoCurrency currentCrypto = favorites[index];
              return CryptoListTile(currentCrypto: currentCrypto);
            },
          );
        }
        else{
          return Center(child: Text("No Favorites yet",style: TextStyle(color:Colors.grey,fontSize: 25),),);
          
        }
      },
    );
    
    // return Container(
    //   child: Text("Favorites HERE"),
    // );
  }
}
