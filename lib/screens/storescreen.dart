import 'package:flutter/material.dart';
import '../widgets/drawerwidget.dart';

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gym Store',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.keyboard_return_rounded, color: Colors.orange),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: StoreContent(),
    );
  }
}

class StoreContent extends StatelessWidget {
  final List<Map<String, String>> products = [
    {'name': 'Protein Powder', 'image': 'assets/protein.webp', 'price': '\$50'},
    {'name': 'Dumbbells', 'image': 'assets/dumbells.webp', 'price': '\$30'},
    {'name': 'Yoga Mat', 'image': 'assets/yoga_mat.jpeg', 'price': '\$20'},
    {'name': 'Gym Gloves', 'image': 'assets/gloves.jpeg', 'price': '\$15'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, Colors.black54],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5,
            shadowColor: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      products[index]['image']!,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    products[index]['name']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    products[index]['price']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
