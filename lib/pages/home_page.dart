import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _repaintKey = GlobalKey();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          child: RepaintBoundary(
            key: _repaintKey,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/food.jpeg', fit: BoxFit.cover),
                  ),
                ),
                SliverToBoxAdapter()
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.add),
            label: Text('去涂鸦'),
          ),
        ),
      );
}
