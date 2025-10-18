/*import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3E5FC),
        title: const Text(
          "History",
          style: TextStyle(color: Colors.lightBlueAccent),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.lightBlueAccent,
          labelColor: Colors.lightBlueAccent,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: "Text History"),
            Tab(text: "Voice Recordings"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Text History tab
          Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: 10, // Replace with actual text history length
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Sample text history ${index + 1}",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),

          // Voice Recordings tab
          Container(
            padding: const EdgeInsets.all(16),
            child: ListView.builder(
              itemCount: 5, // Replace with actual voice recording length
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    leading: const Icon(Icons.mic, color: Colors.black),
                    title: Text(
                      "Voice recording ${index + 1}",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.play_arrow, color: Colors.black),
                      onPressed: () {
                        // Add play functionality here
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<String> textHistory = ["Hello", "How are you?", "Good morning"];

  final List<String> voiceHistory = [
    "Voice_001.m4a",
    "Voice_002.m4a",
    "Voice_003.m4a",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB3E5FC),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "History",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.blueAccent,
          tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Text History
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: textHistory.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    textHistory[index],
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            },
          ),

          // Voice History
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: voiceHistory.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.mic, color: Colors.black),
                  title: Text(
                    voiceHistory[index],
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow, color: Colors.black),
                    onPressed: () {
                      // TODO: Play the voice file
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
