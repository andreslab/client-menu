import 'package:flutter/material.dart';
import 'package:platform/models/product.dart';
import 'package:platform/res/colors.dart';
import 'package:platform/res/icons/fa_regular_icons.dart';

class RecomendationAdSlide extends StatefulWidget {
  final ProductModel product;

  const RecomendationAdSlide({Key key, this.product}) : super(key: key);

  @override
  _RecomendationAdSlideState createState() => _RecomendationAdSlideState();
}

class _RecomendationAdSlideState extends State<RecomendationAdSlide> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final radius = size.width / 2;
    final List<Color> colorBorder = [Colors.orange, Colors.purple];
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album),
          title: Text('The Enchanted Nightingale'),
          subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              child: const Text('BUY TICKETS'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
            TextButton(
              child: const Text('LISTEN'),
              onPressed: () {/* ... */},
            ),
            const SizedBox(width: 8),
          ],
        ),
      ],
    ));
  }
}
