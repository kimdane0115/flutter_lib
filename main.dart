import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/constants/index.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Supabase.initialize(
    url: 'https://mccoypiqwvukvcgvxlvi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1jY295cGlxd3Z1a3ZjZ3Z4bHZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTA5MTkwMTUsImV4cCI6MjAyNjQ5NTAxNX0.TszKb82LR3At1YCQk4rUZgkkfkHuid0vUzEjZAVGTZ0'
  );
  runApp(const ProviderScope(child: App()));
}