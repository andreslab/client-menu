import 'package:flutter/material.dart';
import 'package:platform/models/category.dart';
import 'package:platform/models/product.dart';
import 'package:platform/res/colors.dart';
import 'package:platform/screens/detail_item/detail_item.dart';

List<ProductModel> recomendations = TestDataProduct.data;
List<ProductModel> products = TestDataProduct.data;
List<CategoryModel> categories = Categories.data;

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  AppBar buildAppBar(BuildContext context) {
    return new AppBar(title: new Text('My Home Page'), actions: [
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
    ]);
  }

  @override
  Widget build(BuildContext context) {
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
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: ColorsApp.shadowList,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/img_logo.png',
                                height: 150,
                                width: 130,
                                color: Colors.grey[700],
                              ),
                              Text(recomendations[index].title),
                              Text(recomendations[index].price.toString())
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
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: ColorsApp.shadowList,
                              borderRadius: BorderRadius.circular(10)),
                          child: index == 0
                              ? Icon(Icons.filter)
                              : Text(categories[index].title));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: (products.length * 80).toDouble(),
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
                              height: 80,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: ColorsApp.shadowList,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(products[index].title)),
                        );
                      },
                    )),
                SizedBox(
                  height: 50,
                )
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
