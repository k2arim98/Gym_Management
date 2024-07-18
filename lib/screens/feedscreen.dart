import 'package:flutter/material.dart';
import '../widgets/drawerwidget.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gym Feed',
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
      body: FeedContent(),
    );
  }
}

class FeedContent extends StatefulWidget {
  @override
  _FeedContentState createState() => _FeedContentState();
}

class _FeedContentState extends State<FeedContent> {
  final List<Map<String, String>> posts = [
    {'author': 'John Doe', 'content': 'New workout routine is amazing! 💪🔥'},
    {
      'author': 'Anonymous',
      'content': 'Please add more weights in the gym. 🏋️‍♂️'
    },
  ];
  final TextEditingController _postController = TextEditingController();
  bool isAnonymous = false;

  void _addPost() {
    if (_postController.text.isNotEmpty) {
      setState(() {
        posts.add({
          'author': isAnonymous ? 'Anonymous' : 'John Doe',
          'content': _postController.text
        });
        _postController.clear();
      });
    }
  }

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
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.black54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts[index]['author']!,
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              posts[index]['content']!,
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
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _postController,
                      decoration: InputDecoration(
                        hintText: 'Write a post...',
                        filled: true,
                        fillColor: Colors.black12,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.orange),
                    onPressed: _addPost,
                  ),
                  Container(
                    height: 48,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Checkbox(
                          value: isAnonymous,
                          onChanged: (value) {
                            setState(() {
                              isAnonymous = value!;
                            });
                          },
                          activeColor: Colors.orange,
                          checkColor: Colors.black,
                        ),
                        Text(
                          'Anonymous',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
