import 'dart:async';
import 'package:untitled/Screens/myfavorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/favorite_with_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    print("builder");
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyFavoriteListScreen()));
              },
              icon: Icon(Icons.favorite_outlined))
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text("iteam " + index.toString()),
            trailing:
                Consumer<FavoriteProvider>(builder: (context, value, child) {
              return IconButton(
                  onPressed: () {
                    value.selection.contains(index)
                        ? value.Favoriteremove(index)
                        : value.Favoriteset(index);
                  },
                  icon: favoriteProvider.selection.contains(index)
                      ? Icon(Icons.favorite_outlined)
                      : Icon(Icons.favorite_border_outlined));
            }),
          );
        },
      )),
    );
  }
}
