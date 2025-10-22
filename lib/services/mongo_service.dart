/*import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

// Generate a temporary user ID
Future<String> getTempUserId() async {
  final prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('tempUserId');

  if (userId == null) {
    userId = 'user_${Random().nextInt(100000)}';
    await prefs.setString('tempUserId', userId);
  }

  return userId;
}

// Connect to MongoDB Atlas
Future<Db> connectMongoDB() async {
  final db = await Db.create(
    'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca_db?retryWrites=true&w=majority',
  );
  await db.open();
  print('Connected to MongoDB Atlas!');
  return db;
}

// Insert text message
Future<void> insertMessage(String text) async {
  final db = await connectMongoDB();
  final messagesCollection = db.collection('messages');
  final userId = await getTempUserId();

  await messagesCollection.insertOne({
    'userId': userId,
    'text': text,
    'timestamp': DateTime.now(),
  });

  await db.close();
}

// Fetch messages
Future<List<Map<String, dynamic>>> fetchMessages() async {
  final db = await connectMongoDB();
  final messagesCollection = db.collection('messages');
  final userId = await getTempUserId();

  final messages = await messagesCollection.find({'userId': userId}).toList();

  await db.close();
  return messages;
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

// Generate a temporary user ID
Future<String> getTempUserId() async {
  final prefs = await SharedPreferences.getInstance();
  String? userId = prefs.getString('tempUserId');
  if (userId == null) {
    userId = 'user_${Random().nextInt(100000)}';
    await prefs.setString('tempUserId', userId);
  }
  return userId;
}

// Connect to MongoDB Atlas
Future<Db> connectMongoDB() async {
  final db = await Db.create(
    'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca_db?retryWrites=true&w=majority',
  );
  await db.open();
  print('✅ Connected to MongoDB Atlas');
  return db;
}

// Insert text pair
Future<void> insertTextHistory(String source, String target) async {
  final db = await connectMongoDB();
  final collection = db.collection('text_history');
  final userId = await getTempUserId();

  await collection.insertOne({
    'userId': userId,
    'sourceText': source,
    'targetText': target,
    'timestamp': DateTime.now().toIso8601String(),
  });

  await db.close();
}

// Insert voice pair
Future<void> insertVoiceHistory(String sourceUrl, String targetUrl) async {
  final db = await connectMongoDB();
  final collection = db.collection('voice_history');
  final userId = await getTempUserId();

  await collection.insertOne({
    'userId': userId,
    'sourceVoiceUrl': sourceUrl,
    'targetVoiceUrl': targetUrl,
    'timestamp': DateTime.now().toIso8601String(),
  });

  await db.close();
}

// Fetch text pairs
Future<List<Map<String, dynamic>>> fetchTextHistory() async {
  final db = await connectMongoDB();
  final collection = db.collection('text_history');
  final userId = await getTempUserId();

  final data = await collection.find({'userId': userId}).toList();
  await db.close();
  return data;
}

// Fetch voice pairs
Future<List<Map<String, dynamic>>> fetchVoiceHistory() async {
  final db = await connectMongoDB();
  final collection = db.collection('voice_history');
  final userId = await getTempUserId();

  final data = await collection.find({'userId': userId}).toList();
  await db.close();
  return data;
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static Db? _db;
  static late DbCollection _collection;

  static Future<void> connect() async {
    _db = await Db.create(
      "mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca_db?retryWrites=true&w=majority&appName=Cluster0",
    );
    await _db!.open();
    _collection = _db!.collection('history');
    print("✅ MongoDB Connected");
  }

  static Future<void> insertTextHistory({
    required String fromLanguage,
    required String toLanguage,
    required String sourceText,
    required String translatedText,
  }) async {
    await _collection.insertOne({
      "type": "text",
      "fromLanguage": fromLanguage,
      "toLanguage": toLanguage,
      "sourceText": sourceText,
      "translatedText": translatedText,
      "timestamp": DateTime.now().toIso8601String(),
    });
    print("📝 Text history saved!");
  }

  static Future<void> insertVoiceHistory({
    required String fromLanguage,
    required String toLanguage,
    required String sourceAudioPath,
    required String translatedAudioPath,
  }) async {
    await _collection.insertOne({
      "type": "voice",
      "fromLanguage": fromLanguage,
      "toLanguage": toLanguage,
      "sourceAudioPath": sourceAudioPath,
      "translatedAudioPath": translatedAudioPath,
      "timestamp": DateTime.now().toIso8601String(),
    });
    print("🎙️ Voice history saved!");
  }

  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    final data = await _collection.find().toList();
    return data.map((e) => Map<String, dynamic>.from(e)).toList();
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class MongoService {
  static late Db _db;
  static late DbCollection _collection;

  static Future<void> connect() async {
    _db = await Db.create(
      "mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca_db?retryWrites=true&w=majority&appName=Cluster0",
    );
    await _db.open();
    _collection = _db.collection("history");
  }

  static Future<void> insertHistory({
    required String type,
    required String fromLanguage,
    required String toLanguage,
    String? sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');

    if (userId == null) {
      userId = "temp_${Random().nextInt(999999)}";
      await prefs.setString('userId', userId);
    }

    final record = {
      "userId": userId,
      "type": type,
      "fromLanguage": fromLanguage,
      "toLanguage": toLanguage,
      "sourceText": sourceText,
      "translatedText": translatedText,
      "sourceAudioPath": sourceAudioPath,
      "translatedAudioPath": translatedAudioPath,
      "createdAt": DateTime.now().toIso8601String(),
    };

    await _collection.insertOne(record);
    print("✅ Record inserted: $record");
  }

  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final data = await _collection.find(where.eq('userId', userId)).toList();
    return data;
  }

  static Future<void> close() async {
    await _db.close();
  }
}
*/

/*
import 'package:mongo_dart/mongo_dart.dart';

Future<void> testMongoConnection() async {
  try {
    final db = await Db.create(
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0',
    );
    await db.open();
    print('✅ Connected to MongoDB Atlas!');

    await db.close();
  } catch (e) {
    print('❌ MongoDB connection error: $e');
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Call this once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Example: get a collection
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // Close the DB (if needed)
  static Future<void> close() async {
    await db.close();
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Call this once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Get a collection
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // Fetch all history (texts + voice)
  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final collection = getCollection(
        'history',
      ); // make sure your collection is named 'history'
      final List<Map<String, dynamic>> data = await collection.find().toList();
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Add a new history entry
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final collection = getCollection('history');
      await collection.insert(entry);
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Close the DB (if needed)
  static Future<void> close() async {
    await db.close();
  }
}
*/
//giving unique id for every user
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // ✅ Call this once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Get a collection
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // ✅ Generate or get userId (unique per device)
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4(); // create a new unique ID
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // ✅ Fetch history filtered by userId
  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final List<Map<String, dynamic>> data =
          await collection.find({'userId': userId}).toList();
      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Add new history entry linked to this user
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId; // tag this entry with the userId
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // ✅ Close DB if needed
  static Future<void> close() async {
    await db.close();
  }
}
*/

/*
//added delete ption and sort technique
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // ✅ Connect once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Get collection reference
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // ✅ Generate or get unique user ID (per device)
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // ✅ Fetch all history for current user
  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');

      // Sort by most recent first (descending order)
      final data =
          await collection.find({'userId': userId}).sort({
            'timestamp': -1,
          }).toList();

      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Add a new entry (text or voice)
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String(); // Add timestamp
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // ✅ Delete a specific chat by its MongoDB _id
  static Future<void> deleteHistoryById(ObjectId id) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // ✅ Automatically delete entries containing “night changes” in source text
  static Future<void> autoDeleteNightChanges() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final result = await collection.deleteMany({
        'userId': userId,
        'sourceText': {'\$regex': 'night changes', '\$options': 'i'},
      });
      print("🌙 Auto-deleted ${result['n']} entries with 'night changes'");
    } catch (e) {
      print('⚠️ Error auto-deleting entries: $e');
    }
  }

  // ✅ Search history by source text keyword
  static Future<List<Map<String, dynamic>>> searchHistory(String query) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final results =
          await collection
              .find({
                'userId': userId,
                'sourceText': {'\$regex': query, '\$options': 'i'},
              })
              .sort({'timestamp': -1})
              .toList();
      print("🔍 Found ${results.length} results for '$query'");
      return results;
    } catch (e) {
      print('⚠️ Error searching history: $e');
      return [];
    }
  }

  // ✅ Sort history by date (ascending or descending)
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = true,
  }) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final order = ascending ? 1 : -1;
      final data =
          await collection.find({'userId': userId}).sort({
            'timestamp': order,
          }).toList();
      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }

  // ✅ Close DB connection if needed
  static Future<void> close() async {
    await db.close();
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  // 🔑 Replace this with your actual connection string
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // ✅ Connect once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Get collection reference
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // ✅ Generate or get unique user ID (per device)
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // ✅ Fetch all history for current user
  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');

      final data =
          await collection.modernAggregate([
            {
              '\$match': {'userId': userId},
            },
            {
              '\$sort': {'timestamp': -1},
            },
          ]).toList();

      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Add a new entry (text or voice)
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String();
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // ✅ Delete a specific chat by its MongoDB _id
  static Future<void> deleteHistoryById(ObjectId id) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // ✅ Automatically delete entries containing “night changes” (or “రాత్రి మార్పులు”)
  static Future<void> autoDeleteNightChanges() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');

      final result = await collection.deleteMany({
        'userId': userId,
        'sourceText': {
          '\$regex': r'(night changes|రాత్రి మార్పులు)',
          '\$options': 'i',
        },
      });

      print(
        "🌙 Auto-deleted entries containing 'night changes' or 'రాత్రి మార్పులు'",
      );
    } catch (e) {
      print('⚠️ Error auto-deleting entries: $e');
    }
  }

  // ✅ Search history by source text keyword
  static Future<List<Map<String, dynamic>>> searchHistory(String query) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');

      final results =
          await collection.modernAggregate([
            {
              '\$match': {
                'userId': userId,
                'sourceText': {'\$regex': query, '\$options': 'i'},
              },
            },
            {
              '\$sort': {'timestamp': -1},
            },
          ]).toList();

      print("🔍 Found ${results.length} results for '$query'");
      return results;
    } catch (e) {
      print('⚠️ Error searching history: $e');
      return [];
    }
  }

  // ✅ Sort history by date (ascending or descending)
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = true,
  }) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final order = ascending ? 1 : -1;

      final data =
          await collection.modernAggregate([
            {
              '\$match': {'userId': userId},
            },
            {
              '\$sort': {'timestamp': order},
            },
          ]).toList();

      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }

  // ✅ Close DB connection if needed
  static Future<void> close() async {
    await db.close();
    print('🔒 MongoDB connection closed');
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  // MongoDB connection string
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Get collection
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // Generate or get device/user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Fetch history for user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    String? userId,
  }) async {
    try {
      userId ??= await getUserId();
      final collection = getCollection('history');

      final data =
          await collection.find({'userId': userId}).sort({
            'timestamp': -1,
          }).toList();

      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Add history entry
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String();
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Delete history entry by ID
  static Future<void> deleteHistoryById(ObjectId id, {String? userId}) async {
    try {
      userId ??= await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Auto-delete entries containing "night changes"
  static Future<void> autoDeleteNightChanges({String? userId}) async {
    try {
      userId ??= await getUserId();
      final collection = getCollection('history');

      await collection.deleteMany({
        'userId': userId,
        'sourceText': {
          '\$regex': r'(night changes|రాత్రి మార్పులు)',
          '\$options': 'i',
        },
      });

      print(
        "🌙 Auto-deleted entries containing 'night changes' or 'రాత్రి మార్పులు'",
      );
    } catch (e) {
      print('⚠️ Error auto-deleting entries: $e');
    }
  }

  // Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = true,
    String? userId,
  }) async {
    try {
      userId ??= await getUserId();
      final collection = getCollection('history');
      final order = ascending ? 1 : -1;

      final data =
          await collection.find({'userId': userId}).sort({
            'timestamp': order,
          }).toList();

      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }

  // Search history by source text
  static Future<List<Map<String, dynamic>>> searchHistory(
    String query, {
    String? userId,
  }) async {
    try {
      userId ??= await getUserId();
      final collection = getCollection('history');

      final results =
          await collection
              .find({
                'userId': userId,
                'sourceText': {'\$regex': query, '\$options': 'i'},
              })
              .sort({'timestamp': -1})
              .toList();

      print("🔍 Found ${results.length} results for '$query'");
      return results;
    } catch (e) {
      print('⚠️ Error searching history: $e');
      return [];
    }
  }

  // Close connection
  static Future<void> close() async {
    await db.close();
    print('🔒 MongoDB connection closed');
  }
}
*/ /*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Get collection
  static DbCollection getCollection(String name) {
    return db.collection(name);
  }

  // Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Fetch history for user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Add new entry
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String();
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Delete entry by id
  static Future<void> deleteHistoryById(ObjectId id, {required String userId}) async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Auto delete "night changes"
  static Future<void> autoDeleteNightChanges() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      await collection.deleteMany({
        'userId': userId,
        'sourceText': {
          '\$regex': r'(night changes|రాత్రి మార్పులు)',
          '\$options': 'i',
        },
      });
      print(
        "🌙 Auto-deleted entries containing 'night changes' or 'రాత్రి మార్పులు'",
      );
    } catch (e) {
      print('⚠️ Error auto-deleting entries: $e');
    }
  }

  // Sort history by date (Dart-side sorting to avoid MongoDB sort issues)
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  static DbCollection getCollection(String name) => db.collection(name);

  // Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Fetch history for user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Add new entry
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String();
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Delete entry by id
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  /// Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  static DbCollection getCollection(String name) => db.collection(name);

  /// Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  /// Fetch history for a user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  /// Add new history entry (named parameters)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    try {
      final userId = await getUserId();
      final entry = {
        'userId': userId,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText,
        'sourceAudioPath': sourceAudioPath,
        'translatedAudioPath': translatedAudioPath,
        'timestamp': DateTime.now().toIso8601String(),
      };
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  /// Delete a history entry by ID
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  /// Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/

/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority';

  /// Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  static DbCollection getCollection(String name) => db.collection(name);

  /// Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  /// Fetch history for a user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  /// Add new history entry (text/voice)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    try {
      final userId = await getUserId();
      final entry = {
        'userId': userId,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText ?? '',
        'sourceAudioPath': sourceAudioPath ?? '',
        'translatedAudioPath': translatedAudioPath ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      };
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  /// Delete a history entry by ID
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  /// Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  /// Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  static DbCollection getCollection(String name) => db.collection(name);

  /// Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  /// Fetch history for a user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      print("📜 Loaded ${data.length} history items for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  /// Add new history entry
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    try {
      final userId = await getUserId();
      final entry = {
        '_id': ObjectId(), // keep ObjectId
        'userId': userId,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText,
        'sourceAudioPath': sourceAudioPath,
        'translatedAudioPath': translatedAudioPath,
        'timestamp': DateTime.now().toIso8601String(),
      };
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  /// Delete a history entry by ObjectId
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  /// Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      print("📅 Sorted history by date (${ascending ? 'ASC' : 'DESC'})");
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  /// Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  static DbCollection getCollection(String name) => db.collection(name);

  /// Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  /// Fetch history for a user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  /// Add new history entry
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    try {
      final userId = await getUserId();
      final entry = {
        '_id': ObjectId(),
        'userId': userId,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText ?? '',
        'sourceAudioPath': sourceAudioPath ?? '',
        'translatedAudioPath': translatedAudioPath ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      };
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  /// Delete a history entry by ObjectId
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  /// Sort history by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final dateA = DateTime.parse(a['timestamp']);
        final dateB = DateTime.parse(b['timestamp']);
        return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      });
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/ /*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static Db? _db;

  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  /// Connect to MongoDB Atlas if needed
  static Future<void> connect() async {
    if (_db == null) {
      _db = await Db.create(connectionString);
      await _db!.open();
      print('✅ Connected to MongoDB Atlas!');
    } else if (!_db!.isConnected) {
      await _db!.open();
      print('✅ Reconnected to MongoDB Atlas!');
    }
  }

  static DbCollection getCollection(String name) {
    return _db!.collection(name);
  }

  /// Get or create unique user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  /// Fetch history for a user
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    await connect();
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  /// Add new history entry (timestamp always as milliseconds since epoch int)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    await connect();
    try {
      final userId = await getUserId();
      final entry = {
        '_id': ObjectId(),
        'userId': userId,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText ?? '',
        'sourceAudioPath': sourceAudioPath ?? '',
        'translatedAudioPath': translatedAudioPath ?? '',
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      };
      final collection = getCollection('history');
      await collection.insert(entry);
      print("💾 History saved for user: $userId");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  /// Delete a history entry by ObjectId and userId
  static Future<void> deleteHistoryById(
    ObjectId id, {
    required String userId,
  }) async {
    await connect();
    try {
      final collection = getCollection('history');
      await collection.deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted chat with id: $id for user: $userId");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  /// Sort history by date for a user, ascending (oldest first) or descending (latest first)
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required String userId,
    bool ascending = true,
  }) async {
    await connect();
    try {
      final collection = getCollection('history');
      final data = await collection.find({'userId': userId}).toList();
      data.sort((a, b) {
        final tA = a['timestamp'] ?? 0;
        final tB = b['timestamp'] ?? 0;
        return ascending ? tA.compareTo(tB) : tB.compareTo(tA);
      });
      return data;
    } catch (e) {
      print('⚠️ Error sorting history: $e');
      return [];
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static Db? _db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  /// Connect to MongoDB Atlas if needed
  static Future<void> connect() async {
    if (_db == null) {
      _db = await Db.create(connectionString);
      await _db!.open();
      print('✅ Connected to MongoDB Atlas!');
    } else if (!_db!.isConnected) {
      await _db!.open();
      print('✅ Reconnected to MongoDB Atlas!');
    }
  }

  static DbCollection getCollection(String name) => _db!.collection(name);

  /// Get or create unique user ID (one per device install)
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    print("🆔 Current userId: $userId");
    return userId;
  }

  /// Fetch history for this user
  static Future<List<Map<String, dynamic>>> fetchHistoryForThisUser() async {
    await connect();
    final userId = await getUserId();
    final collection = getCollection('history');
    return await collection.find({'userId': userId}).toList();
  }

  /// Add new history entry for current user
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type, // "text" or "voice"
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    await connect();
    final userId = await getUserId();
    final entry = {
      '_id': ObjectId(),
      'userId': userId,
      'fromLanguage': fromLanguage,
      'toLanguage': toLanguage,
      'type': type,
      'sourceText': sourceText,
      'translatedText': translatedText ?? '',
      'sourceAudioPath': sourceAudioPath ?? '',
      'translatedAudioPath': translatedAudioPath ?? '',
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    final collection = getCollection('history');
    await collection.insert(entry);
    print("💾 History saved for user: $userId");
  }

  /// Delete a history entry by ObjectId for the current user
  static Future<void> deleteHistoryById(ObjectId id) async {
    await connect();
    final userId = await getUserId();
    await getCollection('history').deleteOne({'_id': id, 'userId': userId});
  }

  /// Sort history by date for the current user
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = true,
  }) async {
    await connect();
    final userId = await getUserId();
    final collection = getCollection('history');
    final data = await collection.find({'userId': userId}).toList();
    data.sort((a, b) {
      final tA = a['timestamp'] ?? 0;
      final tB = b['timestamp'] ?? 0;
      return ascending ? tA.compareTo(tB) : tB.compareTo(tA);
    });
    return data;
  }
}
*/
/*
// lib/services/mongo_service.dart
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // ✅ Connect once at app startup
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Get collection
  static DbCollection getCollection(String name) => db.collection(name);

  // ✅ Get or create user ID
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 Created new userId: $userId");
    }
    return userId;
  }

  // ✅ Fetch all history
  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final userId = await getUserId();
      final collection = getCollection('history');
      final data =
          await collection.find({'userId': userId}).sort({
            'timestamp': -1,
          }).toList();
      print("📜 Loaded ${data.length} chats for user: $userId");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Add new history
  static Future<void> addHistory(Map<String, dynamic> entry) async {
    try {
      final userId = await getUserId();
      entry['userId'] = userId;
      entry['timestamp'] = DateTime.now().toIso8601String();
      await getCollection('history').insert(entry);
      print("💾 History saved successfully.");
    } catch (e) {
      print('⚠️ Error adding history: $e');
    }
  }

  // ✅ Delete by ID
  static Future<void> deleteHistoryById(ObjectId id) async {
    try {
      final userId = await getUserId();
      await getCollection('history').deleteOne({'_id': id, 'userId': userId});
      print("🗑️ Deleted entry with ID: $id");
    } catch (e) {
      print('⚠️ Error deleting entry: $e');
    }
  }

  // ✅ Sort by date
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = false,
  }) async {
    try {
      final userId = await getUserId();
      final data =
          await getCollection('history').find({'userId': userId}).sort({
            'timestamp': ascending ? 1 : -1,
          }).toList();
      return data;
    } catch (e) {
      print('⚠️ Error sorting: $e');
      return [];
    }
  }

  // ✅ Search
  static Future<List<Map<String, dynamic>>> searchHistory(String query) async {
    try {
      final userId = await getUserId();
      final results =
          await getCollection('history').find({
            'userId': userId,
            'sourceText': {'\$regex': query, '\$options': 'i'},
          }).toList();
      return results;
    } catch (e) {
      print('⚠️ Error searching: $e');
      return [];
    }
  }

  // ✅ Close DB
  static Future<void> close() async => db.close();
}
*/ /*

import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MongoService {
  static Db? _db;
  static const String _userIdKey = 'userId';
  static const String _connectionString =
      'mongodb+srv://<username>:<password>@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // ✅ Connect to MongoDB
  static Future<void> connect() async {
    try {
      if (_db != null && _db!.isConnected) {
        print("✅ Already connected to MongoDB");
        return;
      }

      _db = await Db.create(_connectionString);
      await _db!.open();
      print("✅ MongoDB connected successfully");
    } catch (e) {
      print("❌ MongoDB connection error: $e");
    }
  }

  // ✅ Get or generate a unique user ID (stored locally)
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString(_userIdKey);

    if (userId == null) {
      userId = ObjectId().toHexString();
      await prefs.setString(_userIdKey, userId);
      print("🆕 New userId generated: $userId");
    } else {
      print("🔹 Existing userId: $userId");
    }
    return userId;
  }

  // ✅ Add history (text or voice)
  static Future<void> addHistory(Map<String, dynamic> historyData) async {
    try {
      if (_db == null || !_db!.isConnected) {
        await connect();
      }

      final collection = _db!.collection('history');

      final userId = await getUserId();

      // Add metadata
      final data = {
        'userId': userId,
        'fromLanguage': historyData['fromLanguage'],
        'toLanguage': historyData['toLanguage'],
        'type': historyData['type'],
        'sourceText': historyData['sourceText'],
        'translatedText': historyData['translatedText'],
        'sourceAudioPath': historyData['sourceAudioPath'],
        'translatedAudioPath': historyData['translatedAudioPath'],
        'timestamp': DateTime.now().toIso8601String(),
      };

      await collection.insertOne(data);
      print("✅ History saved: ${data['sourceText']} -> ${data['translatedText']}");
    } catch (e) {
      print("❌ Error saving history: $e");
    }
  }

  // ✅ Fetch user-specific history (sorted by latest)
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
    String? fromLanguage,
    String? toLanguage,
  }) async {
    try {
      if (_db == null || !_db!.isConnected) {
        await connect();
      }

      final collection = _db!.collection('history');

      final filter = {
        'userId': userId,
        if (fromLanguage != null) 'fromLanguage': fromLanguage,
        if (toLanguage != null) 'toLanguage': toLanguage,
      };

      // ✅ Sort by latest timestamp first
      final results = await collection.find(filter).sort({'timestamp': -1}).toList();

      print("📜 Fetched ${results.length} records for $userId");
      return results.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print("❌ Error fetching history: $e");
      return [];
    }
  }

  // ✅ Clear local user data (optional utility)
  static Future<void> clearUserId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
    print("🧹 Cleared stored userId");
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static Db? _db;
  static const String _uri =
      'mongodb+srv://<your_username>:<your_password>@cluster0.2ry58j2.mongodb.net/TravocaDB?retryWrites=true&w=majority';
  static const String _collectionName = 'history';

  // ✅ Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      _db ??= await Db.create(_uri);
      await _db!.open();
      print('✅ Connected to MongoDB');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Add a new history record
  static Future<void> addHistory(Map<String, dynamic> data) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();
      final collection = _db!.collection(_collectionName);
      await collection.insertOne({
        ...data,
        'timestamp': DateTime.now().toIso8601String(),
      });
      print('🟢 History entry saved');
    } catch (e) {
      print('❌ Error adding history: $e');
    }
  }

  // ✅ Fetch user-specific history with sort
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();

      final collection = _db!.collection(_collectionName);
      final cursor = collection.find({'userId': userId});

      // Use modifierBuilder for sorting (works on all mongo_dart versions)
      await cursor.modifierBuilder.sortBy('timestamp', descending: true);

      final results = await cursor.toList();
      print('📜 Retrieved ${results.length} history records');
      return results.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('❌ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Delete a specific entry
  static Future<void> deleteHistoryById(ObjectId id,
      {required String userId}) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();

      final collection = _db!.collection(_collectionName);
      await collection.deleteOne({'_id': id, 'userId': userId});
      print('🗑️ History entry deleted');
    } catch (e) {
      print('❌ Error deleting entry: $e');
    }
  }
}
*/
/*
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static Db? _db;
  static const String _uri =
      'mongodb+srv://<your_username>:<your_password>@cluster0.2ry58j2.mongodb.net/TravocaDB?retryWrites=true&w=majority';
  static const String _collectionName = 'history';

  // ✅ Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      if (_db == null) {
        _db = await Db.create(_uri);
        await _db!.open();
        print('✅ Connected to MongoDB Atlas');
      } else if (!_db!.isConnected) {
        await _db!.open();
      }
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // ✅ Add new history entry
  static Future<void> addHistory(Map<String, dynamic> data) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();
      final collection = _db!.collection(_collectionName);

      await collection.insertOne({
        ...data,
        'timestamp': DateTime.now().toIso8601String(),
      });

      print('🟢 History entry added');
    } catch (e) {
      print('❌ Error adding history: $e');
    }
  }

  // ✅ Fetch all history (sorted)
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String userId,
  }) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();
      final collection = _db!.collection(_collectionName);

      // ✅ Proper sorting using aggregation pipeline
      final results = await collection
          .aggregateToStream([
            {'\$match': {'userId': userId}},
            {'\$sort': {'timestamp': -1}},
          ])
          .toList();

      print('📜 Retrieved ${results.length} history records');
      return results.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      print('❌ Error fetching history: $e');
      return [];
    }
  }

  // ✅ Delete a specific entry
  static Future<void> deleteHistoryById(ObjectId id,
      {required String userId}) async {
    try {
      if (_db == null || !_db!.isConnected) await connect();
      final collection = _db!.collection(_collectionName);
      await collection.deleteOne({'_id': id, 'userId': userId});
      print('🗑️ History entry deleted');
    } catch (e) {
      print('❌ Error deleting history: $e');
    }
  }
}
*/
/*
//perfect ui but not storing chats
// lib/services/mongo_service.dart
import 'package:mongo_dart/mongo_dart.dart';

class MongoService {
  static late Db _db;
  static late DbCollection _collection;

  static Future<void> connect() async {
    _db = await Db.create(
      "mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority",
    );
    await _db.open();
    _collection = _db.collection('history');
    print("✅ MongoDB connected successfully!");
  }

  /// ✅ FIXED: supports named parameters now
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type,
    required String sourceText,
    required String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
  }) async {
    try {
      await _collection.insert({
        "fromLanguage": fromLanguage,
        "toLanguage": toLanguage,
        "type": type,
        "sourceText": sourceText,
        "translatedText": translatedText,
        "sourceAudioPath": sourceAudioPath,
        "translatedAudioPath": translatedAudioPath,
        "timestamp": DateTime.now().toIso8601String(),
      });
      print("✅ Data saved successfully to MongoDB");
    } catch (e) {
      print("❌ Error adding history: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> fetchHistory() async {
    try {
      final history = await _collection.find().toList();
      history.sort((a, b) {
        final aTime = DateTime.tryParse(a['timestamp'] ?? '') ?? DateTime(0);
        final bTime = DateTime.tryParse(b['timestamp'] ?? '') ?? DateTime(0);
        return bTime.compareTo(aTime);
      });
      return history;
    } catch (e) {
      print("❌ Error fetching history: $e");
      return [];
    }
  }

  static Future<void> deleteHistoryById(ObjectId id) async {
    try {
      await _collection.remove(where.id(id));
      print("🗑️ Entry deleted: $id");
    } catch (e) {
      print("❌ Error deleting history: $e");
    }
  }

  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    bool ascending = false,
  }) async {
    try {
      final result = await _collection.find().toList();
      result.sort((a, b) {
        final aTime = DateTime.tryParse(a['timestamp'] ?? '') ?? DateTime(0);
        final bTime = DateTime.tryParse(b['timestamp'] ?? '') ?? DateTime(0);
        return ascending ? aTime.compareTo(bTime) : bTime.compareTo(aTime);
      });
      return result;
    } catch (e) {
      print("❌ Error sorting history: $e");
      return [];
    }
  }
}
*/
/*
getting erro r at sort
// lib/services/mongo_service.dart
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Collection reference
  static DbCollection getCollection(String name) => db.collection(name);

  // Get or create unique userId
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Fetch user-specific history filtered by languages
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String fromLanguage,
    required String toLanguage,
    String? userId,
  }) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      final data =
          await collection
              .find({
                'userId': uid,
                'fromLanguage': fromLanguage,
                'toLanguage': toLanguage,
              })
              .sort({'timestamp': -1})
              .toList();
      print(
        "📜 Loaded ${data.length} history items for $uid ($fromLanguage ➜ $toLanguage)",
      );
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Add history (text or voice)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type,
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
    String? userId,
  }) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      await collection.insert({
        'userId': uid,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText,
        'sourceAudioPath': sourceAudioPath,
        'translatedAudioPath': translatedAudioPath,
        'timestamp': DateTime.now().toIso8601String(),
      });
      print("💾 History saved for user: $uid");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Delete a specific history item
  static Future<void> deleteHistoryById(String id, {String? userId}) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': ObjectId.parse(id), 'userId': uid});
      print("🗑️ Deleted chat $id for user: $uid");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Close DB connection
  static Future<void> close() async => await db.close();
}
*/
/* not sytoring history
// lib/services/mongo_service.dart
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Collection reference
  static DbCollection getCollection(String name) => db.collection(name);

  // Get or create unique userId
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Add history (text or voice)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type,
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
    String? userId,
  }) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      await collection.insert({
        'userId': uid,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText,
        'sourceAudioPath': sourceAudioPath,
        'translatedAudioPath': translatedAudioPath,
        'createdAt': DateTime.now(), // use DateTime object for sorting
      });
      print("💾 History saved for user: $uid");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Fetch user-specific history filtered by languages
  static Future<List<Map<String, dynamic>>> fetchHistory({
    required String fromLanguage,
    required String toLanguage,
    String? userId,
  }) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      final data =
          await collection.find({
            'userId': uid,
            'fromLanguage': fromLanguage,
            'toLanguage': toLanguage,
          }).toList();

      // Sort by createdAt descending
      data.sort(
        (a, b) =>
            (b['createdAt'] as DateTime).compareTo(a['createdAt'] as DateTime),
      );

      print(
        "📜 Loaded ${data.length} history items for $uid ($fromLanguage ➜ $toLanguage)",
      );
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Delete a specific history item
  static Future<void> deleteHistoryById(String id, {String? userId}) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': ObjectId.parse(id), 'userId': uid});
      print("🗑️ Deleted chat $id for user: $uid");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Sort a list of history manually (ascending or descending)
  static Future<List<Map<String, dynamic>>> sortHistoryByDate({
    required List<Map<String, dynamic>> list,
    bool ascending = true,
  }) async {
    list.sort((a, b) {
      DateTime dateA = a['createdAt'] as DateTime;
      DateTime dateB = b['createdAt'] as DateTime;
      return ascending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
    });
    return list;
  }

  // Close DB connection
  static Future<void> close() async => await db.close();
}
*/
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class MongoService {
  static late Db db;
  static const String connectionString =
      'mongodb+srv://laxmiprasanna2847_db_user:0YIrNsedRbmxALHq@cluster0.2ry58j2.mongodb.net/travoca?retryWrites=true&w=majority&appName=Cluster0';

  // Connect to MongoDB Atlas
  static Future<void> connect() async {
    try {
      db = await Db.create(connectionString);
      await db.open();
      print('✅ Connected to MongoDB Atlas!');
    } catch (e) {
      print('❌ MongoDB connection error: $e');
    }
  }

  // Get collection reference
  static DbCollection getCollection(String name) => db.collection(name);

  // Get or create unique userId
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    if (userId == null) {
      userId = const Uuid().v4();
      await prefs.setString('userId', userId);
      print("🆔 New userId created: $userId");
    }
    return userId;
  }

  // Add history (text or voice)
  static Future<void> addHistory({
    required String fromLanguage,
    required String toLanguage,
    required String type,
    required String sourceText,
    String? translatedText,
    String? sourceAudioPath,
    String? translatedAudioPath,
    String? userId,
  }) async {
    try {
      final uid = userId ?? await getUserId();
      final collection = getCollection('history');

      await collection.insert({
        'userId': uid,
        'fromLanguage': fromLanguage,
        'toLanguage': toLanguage,
        'type': type,
        'sourceText': sourceText,
        'translatedText': translatedText,
        'sourceAudioPath': sourceAudioPath,
        'translatedAudioPath': translatedAudioPath,
        'createdAt': DateTime.now(),
      });

      print("💾 History saved for user: $uid");
    } catch (e) {
      print('⚠️ Error inserting history: $e');
    }
  }

  // Fetch user-specific history (optional language filter)
  static Future<List<Map<String, dynamic>>> fetchHistory({
    String? fromLanguage,
    String? toLanguage,
  }) async {
    try {
      final uid = await getUserId();
      final collection = getCollection('history');

      // Build dynamic query
      final query = <String, dynamic>{'userId': uid};
      if (fromLanguage != null && fromLanguage.isNotEmpty) {
        query['fromLanguage'] = fromLanguage;
      }
      if (toLanguage != null && toLanguage.isNotEmpty) {
        query['toLanguage'] = toLanguage;
      }

      final data = await collection.find(query).toList();

      // Sort newest first
      data.sort((a, b) {
        final dateA = a['createdAt'] as DateTime;
        final dateB = b['createdAt'] as DateTime;
        return dateB.compareTo(dateA);
      });

      print("📜 Loaded ${data.length} history items for $uid");
      return data;
    } catch (e) {
      print('⚠️ Error fetching history: $e');
      return [];
    }
  }

  // Delete specific history item
  static Future<void> deleteHistoryById(String id) async {
    try {
      final uid = await getUserId();
      final collection = getCollection('history');
      await collection.deleteOne({'_id': ObjectId.parse(id), 'userId': uid});
      print("🗑️ Deleted chat $id for user: $uid");
    } catch (e) {
      print('⚠️ Error deleting history: $e');
    }
  }

  // Close DB connection
  static Future<void> close() async => await db.close();
}
