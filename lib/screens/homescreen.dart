import 'package:flutter/material.dart';
import '../widgets/drawerwidget.dart';
import '../widgets/cardwidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.orange,
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black87, Colors.black54],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CardDrawer(
                title: 'Subscription',
                content: 'You have 15 days left in your subscription.',
                icon: Icons.calendar_today,
              ),
              SizedBox(height: 20),
              CardDrawer(
                title: 'Next Workout',
                content: 'Leg Day - 10:00 AM, Tomorrow',
                icon: Icons.fitness_center,
              ),
              SizedBox(height: 20),
              CardDrawer(
                title: 'Personal Best',
                content: 'Bench Press: 100kg',
                icon: Icons.star,
              ),
              SizedBox(height: 20),
              CardDrawer(
                title: 'Trainer Notes',
                content: 'Focus on your form during squats.',
                icon: Icons.note,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
