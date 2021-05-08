import 'dart:html';

import 'package:flutter/material.dart';
import 'package:platform/models/category.dart';
import 'package:platform/models/product.dart';
import 'package:platform/res/colors.dart';
import 'package:platform/screens/detail_item/detail_item.dart';

List<ProductModel> recomendations = TestDataProduct.data;
List<ProductModel> products = TestDataProduct.data;
List<CategoryModel> categories = Categories.data;

final double heightItem = 150;
final imageURL =
    "https://www.cocina-ecuatoriana.com/base/stock/Recipe/44-image/44-image_web.jpg";

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: new Text('Restaurante'),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: DishesItemsSearch());
          },
        ),
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
      backgroundColor: ColorsApp.colorP,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: recomendations.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailItemScreen()),
                          );
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          margin:
                              EdgeInsets.only(left: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: ColorsApp.shadowList,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Image.asset('assets/img/food_test.jpeg',
                                  height: 100,
                                  width: 140,
                                  fit: BoxFit.fitHeight),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            top: 8.0, left: 8, right: 8),
                                        width: 140,
                                        child: Text(recomendations[index].title,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                    ),
                                    Container(
                                      width: 140,
                                      padding: EdgeInsets.only(
                                          right: 8.0, bottom: 8),
                                      child: Text(
                                        "\$${recomendations[index].price.toString()}",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  color: ColorsApp.colorP,
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: index == 0
                              ? Icon(Icons.filter_list)
                              : Text(categories[index].title));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: (products.length * (heightItem + 20)).toDouble(),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailItemScreen()),
                            );
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            height: heightItem,
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: ColorsApp.shadowList,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Image.asset('assets/img/food_test.jpeg',
                                    height: heightItem,
                                    width: screen.width / 3,
                                    fit: BoxFit.fitHeight),
                                Expanded(
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          top: 10,
                                          right: 10,
                                          child: Row(children: [
                                            Text(
                                                "${recomendations[index].rate}",
                                                style: TextStyle(fontSize: 16)),
                                            Icon(
                                              Icons.star,
                                              size: 22,
                                              color: Colors.yellow,
                                            )
                                          ])),
                                      Positioned(
                                          top: 20,
                                          left: 20,
                                          child: Container(
                                            width: screen.width / 2.5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    recomendations[index].title,
                                                    style:
                                                        TextStyle(fontSize: 22),
                                                    maxLines: 2),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    recomendations[index]
                                                        .description,
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    maxLines: 3),
                                              ],
                                            ),
                                          )),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: Text(
                                          "\$${recomendations[index].price.toString()}",
                                          style: TextStyle(fontSize: 32),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ],
            ),
          ),
        ]));
  }
}

class DishesItemsSearch extends SearchDelegate<ProductModel> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final myList = products;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: myList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailItemScreen()),
            );
          },
          child: Container(
              height: 80,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: ColorsApp.shadowList,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(myList[index].title)),
        );
      },
    );
  }
}
