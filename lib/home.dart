import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.location_on, color: Colors.black),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              'Bali, Indonesia',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Action for notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        // Action for date selection
                      },
                      icon: Icon(Icons.calendar_today),
                      label: Text('24 OCT - 26 OCT'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextButton.icon(
                      onPressed: () {
                        // Action for guest selection
                      },
                      icon: Icon(Icons.people),
                      label: Text('3 guests'),
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Hotel By Name',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Recommended Hotels',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHotelCard(
                      context,
                      'AYANA Resort',
                      'Bali, Indonesia',
                      '\$200 - \$500 USD /night',
                      'assets/ayana.jpg', // Path to image
                      4.5,
                      false,
                    ),
                    _buildHotelCard(
                      context,
                      'COMO Uma Re',
                      'Bali, Indonesia',
                      '\$300 - \$500 USD /night',
                      'assets/como.jpg', // Path to image
                      4.7,
                      true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Business Accommodates',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildHotelCard(
                      context,
                      'East Park',
                      'New York, USA',
                      '\$400 - \$700 USD /night',
                      'assets/east_park.jpg', // Path to image
                      4.8,
                      false,
                    ),
                    _buildHotelCard(
                      context,
                      'AC Cardinsalo Hotel',
                      'London, UK',
                      '\$350 - \$600 USD /night',
                      'assets/ac_cardinsalo.jpg', // Path to image
                      4.6,
                      true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          // Handle bottom navigation bar item tap
        },
      ),
    );
  }

  Widget _buildHotelCard(BuildContext context, String name, String location, String price, String imagePath, double rating, bool isFavorite) {
    return Container(
      width: 160.0,
      margin: EdgeInsets.only(right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imagePath,
                  height: 100.0,
                  width: 160.0,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8.0,
                left: 8.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    '10% off',
                    style: TextStyle(color: Colors.black, fontSize: 12.0),
                  ),
                ),
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    // Handle favorite button tap
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            name,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
          Text(location),
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 16.0),
              SizedBox(width: 4.0),
              Text(rating.toString()),
            ],
          ),
          Text(price),
        ],
      ), 
    );
  }
}
