import 'package:flutter/material.dart';
import 'package:untitled/Provider/favorite_with_provider.dart';
import 'package:provider/provider.dart';
class MyFavoriteListScreen extends StatefulWidget {
  const MyFavoriteListScreen({Key? key}) : super(key: key);

  @override
  State<MyFavoriteListScreen> createState() => _MyFavoriteListScreenState();
}

class _MyFavoriteListScreenState extends State<MyFavoriteListScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("My favorite"),
      ),
      body: Container(

          child: ListView.builder(
            itemCount: favoriteProvider.selection.length,
              itemBuilder: (
            context,
            index,
          ) {
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
              }),
        ),

    );
  }
}
