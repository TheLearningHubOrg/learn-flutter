import 'package:flutter/material.dart';
import 'widgets/metric_card.dart';

void main() {
  runApp(const LearnFlutterApp());
}

class LearnFlutterApp extends StatelessWidget {
  const LearnFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF02569B),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class RoadmapStage {
  final int stageNumber;
  final String title;
  final String domainFocus;
  bool completed;

  RoadmapStage({
    required this.stageNumber,
    required this.title,
    required this.domainFocus,
    this.completed = false,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final List<RoadmapStage> _stages = [
    RoadmapStage(stageNumber: 1, title: 'Flutter Engine & Skia/Impeller Pipeline', domainFocus: 'Widget tree, Element tree, RenderObject tree', completed: true),
    RoadmapStage(stageNumber: 2, title: 'Declarative UI & Layout Mechanics', domainFocus: 'Constraints go down, sizes go up, parent sets position', completed: true),
    RoadmapStage(stageNumber: 3, title: 'State Management Architecture', domainFocus: 'InheritedWidget, Provider, Riverpod, BLoC pattern', completed: false),
    RoadmapStage(stageNumber: 4, title: 'Navigation 2.0 & Deep Linking', domainFocus: 'GoRouter, declarative routing, browser URL synchronization', completed: false),
    RoadmapStage(stageNumber: 5, title: 'Animations & Custom Painters', domainFocus: 'Implicit vs explicit animations, Rive, Canvas shaders', completed: false),
    RoadmapStage(stageNumber: 6, title: 'Platform Channels & FFI', domainFocus: 'MethodChannel, EventChannel, Dart FFI to C/Rust native code', completed: false),
    RoadmapStage(stageNumber: 7, title: 'Staff Mobile Architect Handbook', domainFocus: 'Frame drops, jank profiling, memory leaks, App Store CI/CD', completed: true),
  ];

  int get _completedCount => _stages.where((s) => s.completed).length;
  int get _progressPercent => ((_completedCount / _stages.length) * 100).round();

  void _increment() => setState(() => _counter++);
  void _decrement() => setState(() => _counter--);
  void _reset() => setState(() => _counter = 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Flutter 🚀', style: TextStyle(fontWeight: FontWeight.w800)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF02569B), Color(0xFF0175C2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                children: [
                  Text(
                    'Cross-Platform Native Masterclass',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Impeller Graphics Engine & High-Performance Dart Runtime',
                    style: TextStyle(fontSize: 13, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Metrics Row
            Row(
              children: [
                Expanded(
                  child: MetricCard(
                    title: 'Counter',
                    value: '$_counter',
                    description: 'Reactive State',
                    icon: Icons.touch_app,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MetricCard(
                    title: 'Curriculum',
                    value: '$_progressPercent%',
                    description: '$_completedCount of ${_stages.length} Stages',
                    icon: Icons.checklist,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Reactive Sandbox Card
            Card(
              color: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('⚡ Reactive Widget Sandbox', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                    const SizedBox(height: 12),
                    Text(
                      '$_counter',
                      style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w800, color: Color(0xFF38BDF8)),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FilledButton.tonal(onPressed: _decrement, child: const Text('- Decrement')),
                        const SizedBox(width: 8),
                        OutlinedButton(onPressed: _reset, child: const Text('Reset')),
                        const SizedBox(width: 8),
                        FilledButton(onPressed: _increment, child: const Text('+ Increment')),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // 7-Stage Roadmap Checklist
            const Text(
              '🗺️ 7-Stage Pedagogical Roadmap',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),

            ..._stages.map((stage) {
              return Card(
                color: const Color(0xFF1E293B).withOpacity(0.6),
                margin: const EdgeInsets.symmetric(vertical: 4),
                child: CheckboxListTile(
                  value: stage.completed,
                  activeColor: const Color(0xFF02569B),
                  title: Text(
                    'Stage ${stage.stageNumber}: ${stage.title}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration: stage.completed ? TextDecoration.lineThrough : null,
                      color: stage.completed ? Colors.white60 : Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    stage.domainFocus,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
                  ),
                  onChanged: (val) {
                    setState(() {
                      stage.completed = val ?? false;
                    });
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
