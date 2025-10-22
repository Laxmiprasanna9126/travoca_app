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
/*
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
*/
/*
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    loadHistory();
  }

  void loadHistory() async {
    final texts = await fetchTextHistory();
    final voices = await fetchVoiceHistory();
    setState(() {
      textHistory = texts;
      voiceHistory = voices;
    });
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
          // 📝 Text History
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: textHistory.length,
            itemBuilder: (context, index) {
              final item = textHistory[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Source: ${item['sourceText']}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Translated: ${item['targetText']}",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

          // 🎙 Voice History
          ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: voiceHistory.length,
            itemBuilder: (context, index) {
              final item = voiceHistory[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: const Icon(Icons.mic, color: Colors.black),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Source: ${item['sourceVoiceUrl']}"),
                      Text("Translated: ${item['targetVoiceUrl']}"),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.play_arrow, color: Colors.black),
                    onPressed: () {
                      // TODO: Play both audios
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
*/
/*
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory(); // ✅ Correct function call
  }

  Future<void> _loadHistory() async {
    try {
      final all = await MongoService.fetchHistory(); // ✅ one function only
      setState(() {
        textHistory = all.where((e) => e['type'] == 'text').toList();
        voiceHistory = all.where((e) => e['type'] == 'voice').toList();
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
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
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (textHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textHistory.length,
      itemBuilder: (context, index) {
        final item = textHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (voiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: voiceHistory.length,
      itemBuilder: (context, index) {
        final item = voiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Text(
              "🎧 ${item['sourceAudioPath']}\n🔊 ${item['translatedAudioPath']}",
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.black),
              onPressed: () {
                // TODO: play the audio files if needed
              },
            ),
          ),
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Add this
import '../services/mongo_service.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  final AudioPlayer _audioPlayer =
      AudioPlayer(); // For playing voice files,got error so added dependency

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      final all = await MongoService.fetchHistory();

      all.sort((a, b) {
        final aTime =
            DateTime.tryParse(a['timestamp'].toString()) ?? DateTime(2000);
        final bTime =
            DateTime.tryParse(b['timestamp'].toString()) ?? DateTime(2000);
        return bTime.compareTo(aTime); // Latest first
      });

      setState(() {
        textHistory = all.where((e) => e['type'] == 'text').toList();
        voiceHistory = all.where((e) => e['type'] == 'voice').toList();
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
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
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (textHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textHistory.length,
      itemBuilder: (context, index) {
        final item = textHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: Text(
              DateTime.tryParse(item['timestamp'].toString()) != null
                  ? "${DateTime.parse(item['timestamp']).hour.toString().padLeft(2, '0')}:${DateTime.parse(item['timestamp']).minute.toString().padLeft(2, '0')}"
                  : "",
              style: const TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (voiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: voiceHistory.length,
      itemBuilder: (context, index) {
        final item = voiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Text(
              "🎧 ${item['sourceAudioPath']}\n🔊 ${item['translatedAudioPath']}",
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.black),
              onPressed: () async {
                String audioPath = item['translatedAudioPath'] ?? '';
                if (audioPath.isNotEmpty) {
                  try {
                    await _audioPlayer.stop();
                    await _audioPlayer.play(UrlSource(audioPath));
                  } catch (e) {
                    print("⚠️ Error playing audio: $e");
                  }
                }
              },
            ),
          ),
        );
      },
    );
  }
}
*/
/*
//code after adding audio files
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';
import 'package:audioplayers/audioplayers.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer(); // For playing voice files

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      final all = await MongoService.fetchHistory();
      setState(() {
        textHistory = all.where((e) => e['type'] == 'text').toList();
        voiceHistory = all.where((e) => e['type'] == 'voice').toList();
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose(); // release resources
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
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (textHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textHistory.length,
      itemBuilder: (context, index) {
        final item = textHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (voiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: voiceHistory.length,
      itemBuilder: (context, index) {
        final item = voiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath']}"),
                Text("🔊 ${item['translatedAudioPath']}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_arrow, color: Colors.black),
              onPressed: () async {
                final audioUrl = item['translatedAudioPath'];
                if (audioUrl != null && audioUrl.isNotEmpty) {
                  try {
                    await _audioPlayer.stop(); // Stop previous if playing
                    await _audioPlayer.play(
                      UrlSource(audioUrl),
                    ); // Play new audio
                  } catch (e) {
                    print('⚠️ Error playing audio: $e');
                  }
                } else {
                  print('⚠️ No audio file available');
                }
              },
            ),
          ),
        );
      },
    );
  }
}
*/
/*
//code after addding the delete and sort option
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key, required String toLanguage, required String fromLanguage, required String userId});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  -late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false; // for sorting order
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      final all = await MongoService.fetchHistory();
      setState(() {
        textHistory = all.where((e) => e['type'] == 'text').toList();
        voiceHistory = all.where((e) => e['type'] == 'voice').toList();
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  // ✅ Delete a specific entry
  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadHistory();
  }

  // ✅ Auto-delete entries with “night changes”
  Future<void> _autoDeleteNightChanges() async {
    await MongoService.autoDeleteNightChanges();
    await _loadHistory();
  }

  // ✅ Sort by date
  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory = sorted.where((e) => e['type'] == 'text').toList();
      voiceHistory = sorted.where((e) => e['type'] == 'voice').toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  // ✅ Search by source text
  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
          IconButton(
            icon: const Icon(Icons.nightlight_round, color: Colors.black),
            tooltip: "Auto delete 'night changes'",
            onPressed: _autoDeleteNightChanges,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath']}"),
                Text("🔊 ${item['translatedAudioPath']}"),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.play_arrow, color: Colors.black),
                  onPressed: () async {
                    final audioUrl = item['translatedAudioPath'];
                    if (audioUrl != null && audioUrl.isNotEmpty) {
                      try {
                        await _audioPlayer.stop();
                        await _audioPlayer.play(UrlSource(audioUrl));
                      } catch (e) {
                        print('⚠️ Error playing audio: $e');
                      }
                    } else {
                      print('⚠️ No audio file available');
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteEntry(item['_id']),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
*/
/*
thi code is not stoing the chats in history page
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false; // for sorting
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory();
      // Filter by selected language pair
      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadFilteredHistory();
  }

  Future<void> _autoDeleteNightChanges() async {
    await MongoService.autoDeleteNightChanges();
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }

      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));

      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl =
        isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment =
        isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
          IconButton(
            icon: const Icon(Icons.nightlight_round, color: Colors.black),
            tooltip: "Auto delete 'night changes'",
            onPressed: _autoDeleteNightChanges,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true), // Source bubble (left)
            _buildVoiceBubble(item, false), // Target bubble (right)
          ],
        );
      },
    );
  }
}*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;
  

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);
      final filteredText = all
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      final filteredVoice = all
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory = sorted
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      voiceHistory = sorted
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory = textHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
        filteredVoiceHistory = voiceHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }

      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));

      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl =
        isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment =
        isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true),
            _buildVoiceBubble(item, false),
          ],
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText = all
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();

      final filteredVoice = all
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
        userId: widget.userId, ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory = sorted
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      voiceHistory = sorted
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory = textHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
        filteredVoiceHistory = voiceHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }

      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));

      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl =
        isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment =
        isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true),
            _buildVoiceBubble(item, false),
          ],
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );

    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }

      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));

      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });

      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl =
        isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment =
        isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true),
            _buildVoiceBubble(item, false),
          ],
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );

    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl =
        isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment =
        isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true),
            _buildVoiceBubble(item, false),
          ],
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText = all
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();

      final filteredVoice = all
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );

    setState(() {
      _ascending = !_ascending;
      textHistory = sorted
          .where((e) =>
              e['type'] == 'text' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      voiceHistory = sorted
          .where((e) =>
              e['type'] == 'voice' &&
              e['fromLanguage'] == widget.fromLanguage &&
              e['toLanguage'] == widget.toLanguage)
          .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory = textHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
        filteredVoiceHistory = voiceHistory
            .where((item) =>
                item['sourceText']
                    ?.toString()
                    .toLowerCase()
                    .contains(query.toLowerCase()) ??
                false)
            .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildVoiceBubble(Map<String, dynamic> entry, bool isSource) {
    final audioUrl = isSource ? entry['sourceAudioPath'] : entry['translatedAudioPath'];
    final text = isSource ? entry['sourceText'] : entry['translatedText'];
    final bubbleColor = isSource ? Colors.grey.shade300 : Colors.blue.shade100;
    final alignment = isSource ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: alignment,
            children: [
              Text(text ?? '', style: const TextStyle(fontSize: 16)),
              if (audioUrl != null && audioUrl.isNotEmpty)
                IconButton(
                  icon: Icon(
                    _isPlaying && _currentPlayingUrl == audioUrl
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.black87,
                    size: 28,
                  ),
                  onPressed: () => _playAudio(audioUrl),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 16),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildVoiceBubble(item, true),
            _buildVoiceBubble(item, false),
          ],
        );
      },
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'services/mongo_service.dart';
import 'package:audioplayers/audioplayers.dart';

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Map<String, dynamic>> history = [];
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    try {
      // Fetch history from MongoDB filtered by userId and selected languages
      final items = await MongoService.getHistory(
        userId: widget.userId,
        fromLanguage: widget.fromLanguage,
        toLanguage: widget.toLanguage,
      );

      // Sort by timestamp descending
      items.sort((a, b) =>
          DateTime.parse(b['timestamp']).compareTo(DateTime.parse(a['timestamp'])));

      setState(() {
        history = items;
      });
    } catch (e) {
      print('Error loading history: $e');
    }
  }

  Widget _buildChatBubble(Map<String, dynamic> item) {
    bool isVoice = item['type'] == 'voice';
    bool isSourceLeft = true; // Source always left, translated right

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: Row(
        mainAxisAlignment:
            isSourceLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isSourceLeft)
            _buildBubble(
              text: isVoice ? "[Voice]" : item['sourceText'] ?? '',
              audioPath: isVoice ? item['sourceAudioPath'] : null,
              isLeft: true,
            ),
          const SizedBox(width: 8),
          if (!isSourceLeft)
            _buildBubble(
              text: isVoice ? "[Voice]" : item['translatedText'] ?? '',
              audioPath: isVoice ? item['translatedAudioPath'] : null,
              isLeft: false,
            ),
        ],
      ),
    );
  }

  Widget _buildBubble({required String text, String? audioPath, required bool isLeft}) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isLeft ? Colors.blue.shade100 : Colors.green.shade100,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isLeft ? 0 : 16),
            bottomRight: Radius.circular(isLeft ? 16 : 0),
          ),-
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (audioPath != null)
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () async {
                  await _audioPlayer.stop();
                  await _audioPlayer.play(DeviceFileSource(audioPath));
                },
              ),
            if (text.isNotEmpty) Text(text),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.fromLanguage} → ${widget.toLanguage}'),
      ),
      body: history.isEmpty
          ? const Center(child: Text('No history found'))
          : ListView.builder(
              reverse: false,
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: history.length,
              itemBuilder: (context, index) {
                final item = history[index];

                // Show source on left, translation on right
                return Column(
                  children: [
                    _buildBubble(
                      text: item['sourceText'] ?? '',
                      audioPath: item['type'] == 'voice'
                          ? item['sourceAudioPath']
                          : null,
                      isLeft: true,
                    ),
                    const SizedBox(height: 4),
                    _buildBubble(
                      text: item['translatedText'] ?? '',
                      audioPath: item['type'] == 'voice'
                          ? item['translatedAudioPath']
                          : null,
                      isLeft: false,
                    ),
                    const SizedBox(height: 8),
                  ],
                );
              },
            ),
    );
  }
}*/

/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );

    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) =>
                      item['sourceText']?.toString().toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildChatBubble({
    required String text,
    String? audioUrl,
    required bool isLeft,
    required Color color,
  }) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (text.isNotEmpty)
              Text(text, style: const TextStyle(fontSize: 16)),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _isPlaying && _currentPlayingUrl == audioUrl
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              audioUrl: item['sourceAudioPath'],
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              audioUrl: item['translatedAudioPath'],
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );

    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildChatBubble({
    required String text,
    String? audioUrl,
    required bool isLeft,
    required Color color,
  }) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (text.isNotEmpty)
              Text(text, style: const TextStyle(fontSize: 16)),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _isPlaying && _currentPlayingUrl == audioUrl
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              audioUrl: item['sourceAudioPath'],
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              audioUrl: item['translatedAudioPath'],
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );
    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildChatBubble({
    required String text,
    String? audioUrl,
    required bool isLeft,
    required Color color,
  }) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (text.isNotEmpty)
              Text(text, style: const TextStyle(fontSize: 16)),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _isPlaying && _currentPlayingUrl == audioUrl
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              audioUrl: item['sourceAudioPath'],
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              audioUrl: item['translatedAudioPath'],
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistory(userId: widget.userId);

      // Debug log to show all user entries and their language/fields
      print("🔎 [DEBUG] All history for userId ${widget.userId}:");
      for (final e in all) print("Item: $e");

      print(
        "Filtering Text for: from=${widget.fromLanguage} to=${widget.toLanguage}",
      );
      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();

      print("Text history count: ${filteredText.length}");
      print("Voice history count: ${filteredVoice.length}");

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(
      userId: widget.userId,
      ascending: _ascending,
    );
    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    e['fromLanguage'] == widget.fromLanguage &&
                    e['toLanguage'] == widget.toLanguage,
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildChatBubble({
    required String text,
    String? audioUrl,
    required bool isLeft,
    required Color color,
  }) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (text.isNotEmpty)
              Text(text, style: const TextStyle(fontSize: 16)),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _isPlaying && _currentPlayingUrl == audioUrl
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              audioUrl: item['sourceAudioPath'],
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              audioUrl: item['translatedAudioPath'],
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage, required String userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _ascending = false;
  final TextEditingController _searchController = TextEditingController();
  bool _isPlaying = false;
  String? _currentPlayingUrl;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadFilteredHistory();
  }

  Future<void> _loadFilteredHistory() async {
    try {
      final all = await MongoService.fetchHistoryForThisUser();

      final filteredText =
          all
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    (e['fromLanguage'] ?? '').trim().toLowerCase() ==
                        widget.fromLanguage.trim().toLowerCase() &&
                    (e['toLanguage'] ?? '').trim().toLowerCase() ==
                        widget.toLanguage.trim().toLowerCase(),
              )
              .toList();

      final filteredVoice =
          all
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    (e['fromLanguage'] ?? '').trim().toLowerCase() ==
                        widget.fromLanguage.trim().toLowerCase() &&
                    (e['toLanguage'] ?? '').trim().toLowerCase() ==
                        widget.toLanguage.trim().toLowerCase(),
              )
              .toList();

      setState(() {
        textHistory = filteredText;
        voiceHistory = filteredVoice;
        filteredTextHistory = List.from(filteredText);
        filteredVoiceHistory = List.from(filteredVoice);
      });
    } catch (e) {
      print("⚠️ Error loading history: $e");
    }
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadFilteredHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'text' &&
                    (e['fromLanguage'] ?? '').trim().toLowerCase() ==
                        widget.fromLanguage.trim().toLowerCase() &&
                    (e['toLanguage'] ?? '').trim().toLowerCase() ==
                        widget.toLanguage.trim().toLowerCase(),
              )
              .toList();
      voiceHistory =
          sorted
              .where(
                (e) =>
                    e['type'] == 'voice' &&
                    (e['fromLanguage'] ?? '').trim().toLowerCase() ==
                        widget.fromLanguage.trim().toLowerCase() &&
                    (e['toLanguage'] ?? '').trim().toLowerCase() ==
                        widget.toLanguage.trim().toLowerCase(),
              )
              .toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (item) => item['sourceText']
                      .toString()
                      .toLowerCase()
                      .contains(query.toLowerCase()),
                )
                .toList();
      }
    });
  }

  Future<void> _playAudio(String url) async {
    try {
      if (_isPlaying && _currentPlayingUrl == url) {
        await _audioPlayer.pause();
        setState(() => _isPlaying = false);
        return;
      }
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(url));
      setState(() {
        _isPlaying = true;
        _currentPlayingUrl = url;
      });
      _audioPlayer.onPlayerComplete.listen((_) {
        setState(() => _isPlaying = false);
      });
    } catch (e) {
      print("⚠️ Audio play error: $e");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Audio playback failed")));
    }
  }

  Widget _buildChatBubble({
    required String text,
    String? audioUrl,
    required bool isLeft,
    required Color color,
  }) {
    return Align(
      alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment:
              isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            if (text.isNotEmpty)
              Text(text, style: const TextStyle(fontSize: 16)),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: Icon(
                  _isPlaying && _currentPlayingUrl == audioUrl
                      ? Icons.pause_circle_filled
                      : Icons.play_circle_fill,
                  size: 28,
                  color: Colors.black87,
                ),
                onPressed: () => _playAudio(audioUrl),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextHistoryTab() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text("No text history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  Widget _buildVoiceHistoryTab() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text("No voice history yet."));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Column(
          children: [
            _buildChatBubble(
              text: item['sourceText'] ?? '',
              audioUrl: item['sourceAudioPath'],
              isLeft: true,
              color: Colors.grey.shade300,
            ),
            _buildChatBubble(
              text: item['translatedText'] ?? '',
              audioUrl: item['translatedAudioPath'],
              isLeft: false,
              color: Colors.blue.shade100,
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _tabController.dispose();
    _searchController.dispose();
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
        title: Text(
          "History: ${widget.fromLanguage} ➜ ${widget.toLanguage}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            tooltip: "Sort by date",
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: "Search by source text...",
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                indicatorColor: Colors.blueAccent,
                tabs: const [Tab(text: "Text"), Tab(text: "Voice")],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistoryTab(), _buildVoiceHistoryTab()],
      ),
    );
  }
}
*/
/*
// lib/screens/history_screen.dart
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
  -  required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];

  final TextEditingController _searchController = TextEditingController();
  bool _ascending = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final all = await MongoService.fetchHistory();
    setState(() {
      textHistory = all.where((e) => e['type'] == 'text').toList();
      voiceHistory = all.where((e) => e['type'] == 'voice').toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory = sorted.where((e) => e['type'] == 'text').toList();
      voiceHistory = sorted.where((e) => e['type'] == 'voice').toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (e) =>
                      e['sourceText']?.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (e) =>
                      e['sourceText']?.toLowerCase().contains(
                        query.toLowerCase(),
                      ) ??
                      false,
                )
                .toList();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFB3E5FC),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: 'Search by source text...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                tabs: const [Tab(text: 'Text'), Tab(text: 'Voice')],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text('No text history yet.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text('No voice history yet.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath'] ?? 'No source audio'}"),
                Text("🔊 ${item['translatedAudioPath'] ?? 'No translation'}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }
}*/
/*
//perfect ui but storing chats
import 'package:flutter/material.dart';
import '../services/mongo_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:mongo_dart/mongo_dart.dart' show ObjectId;

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];
  List<Map<String, dynamic>> filteredTextHistory = [];
  List<Map<String, dynamic>> filteredVoiceHistory = [];

  final TextEditingController _searchController = TextEditingController();
  bool _ascending = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    await MongoService.connect();
    final all = await MongoService.fetchHistory();
    setState(() {
      textHistory = all.where((e) => e['type'] == 'text').toList();
      voiceHistory = all.where((e) => e['type'] == 'voice').toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  Future<void> _deleteEntry(ObjectId id) async {
    await MongoService.deleteHistoryById(id);
    await _loadHistory();
  }

  Future<void> _sortByDate() async {
    final sorted = await MongoService.sortHistoryByDate(ascending: _ascending);
    setState(() {
      _ascending = !_ascending;
      textHistory = sorted.where((e) => e['type'] == 'text').toList();
      voiceHistory = sorted.where((e) => e['type'] == 'voice').toList();
      filteredTextHistory = List.from(textHistory);
      filteredVoiceHistory = List.from(voiceHistory);
    });
  }

  void _searchHistory(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredTextHistory = List.from(textHistory);
        filteredVoiceHistory = List.from(voiceHistory);
      } else {
        filteredTextHistory =
            textHistory
                .where(
                  (e) => (e['sourceText'] ?? '').toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
        filteredVoiceHistory =
            voiceHistory
                .where(
                  (e) => (e['sourceText'] ?? '').toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .toList();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB3E5FC),
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFB3E5FC),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.sort, color: Colors.black),
            onPressed: _sortByDate,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _searchHistory,
                  decoration: InputDecoration(
                    hintText: 'Search by source text...',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black54,
                tabs: const [Tab(text: 'Text'), Tab(text: 'Voice')],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (filteredTextHistory.isEmpty) {
      return const Center(child: Text('No text history yet.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredTextHistory.length,
      itemBuilder: (context, index) {
        final item = filteredTextHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              "${item['fromLanguage']} ➜ ${item['toLanguage']}",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
              style: const TextStyle(fontSize: 15),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (filteredVoiceHistory.isEmpty) {
      return const Center(child: Text('No voice history yet.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredVoiceHistory.length,
      itemBuilder: (context, index) {
        final item = filteredVoiceHistory[index];
        return Card(
          color: Colors.white,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic, color: Colors.black),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath'] ?? 'No source audio'}"),
                Text("🔊 ${item['translatedAudioPath'] ?? 'No translation'}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id']),
            ),
          ),
        );
      },
    );
  }
}
*/
/* not storing history
// lib/screens/history_screen.dart
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';

class HistoryScreen extends StatefulWidget {
  final String fromLanguage;
  final String toLanguage;
  final String userId;

  const HistoryScreen({
    super.key,
    required this.fromLanguage,
    required this.toLanguage,
    required this.userId,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final all = await MongoService.fetchHistory(
      fromLanguage: widget.fromLanguage,
      toLanguage: widget.toLanguage,
      userId: widget.userId,
    );
    setState(() {
      textHistory = all.where((e) => e['type'] == 'text').toList();
      voiceHistory = all.where((e) => e['type'] == 'voice').toList();
    });
  }

  Future<void> _deleteEntry(String id) async {
    await MongoService.deleteHistoryById(id, userId: widget.userId);
    await _loadHistory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFB3E5FC),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Text'), Tab(text: 'Voice')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (textHistory.isEmpty) {
      return const Center(child: Text('No text history.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textHistory.length,
      itemBuilder: (context, index) {
        final item = textHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText']}",
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id'].toString()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (voiceHistory.isEmpty) {
      return const Center(child: Text('No voice history.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: voiceHistory.length,
      itemBuilder: (context, index) {
        final item = voiceHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath'] ?? 'No source audio'}"),
                Text("🔊 ${item['translatedAudioPath'] ?? 'No translation'}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id'].toString()),
            ),
          ),
        );
      },
    );
  }
}
*/

//trying to fix history visiblility
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../services/mongo_service.dart';

class HistoryScreen extends StatefulWidget {
  final String? fromLanguage;
  final String? toLanguage;

  const HistoryScreen({super.key, this.fromLanguage, this.toLanguage});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final AudioPlayer _audioPlayer = AudioPlayer();

  List<Map<String, dynamic>> textHistory = [];
  List<Map<String, dynamic>> voiceHistory = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _loadHistory();
  }

  Future<void> _loadHistory() async {
    final all = await MongoService.fetchHistory(
      fromLanguage:
          widget.fromLanguage?.isEmpty ?? true ? null : widget.fromLanguage,
      toLanguage: widget.toLanguage?.isEmpty ?? true ? null : widget.toLanguage,
    );

    setState(() {
      textHistory = all.where((e) => e['type'] == 'text').toList();
      voiceHistory = all.where((e) => e['type'] == 'voice').toList();
    });
  }

  Future<void> _deleteEntry(String id) async {
    await MongoService.deleteHistoryById(id);
    await _loadHistory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History', style: TextStyle(color: Colors.black)),
        backgroundColor: const Color(0xFFB3E5FC),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Text'), Tab(text: 'Voice')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTextHistory(), _buildVoiceHistory()],
      ),
    );
  }

  Widget _buildTextHistory() {
    if (textHistory.isEmpty) {
      return const Center(child: Text('No text history.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: textHistory.length,
      itemBuilder: (context, index) {
        final item = textHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Text(
              "🗣 ${item['sourceText']}\n💬 ${item['translatedText'] ?? ''}",
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id'].toString()),
            ),
          ),
        );
      },
    );
  }

  Widget _buildVoiceHistory() {
    if (voiceHistory.isEmpty) {
      return const Center(child: Text('No voice history.'));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: voiceHistory.length,
      itemBuilder: (context, index) {
        final item = voiceHistory[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: const Icon(Icons.mic),
            title: Text("${item['fromLanguage']} ➜ ${item['toLanguage']}"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("🎧 ${item['sourceAudioPath'] ?? 'No source audio'}"),
                Text("🔊 ${item['translatedAudioPath'] ?? 'No translation'}"),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deleteEntry(item['_id'].toString()),
            ),
          ),
        );
      },
    );
  }
}
