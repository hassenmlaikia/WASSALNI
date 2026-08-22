import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wassalni/core/theme/wassalni_colors.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({Key? key}) : super(key: key);

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {
  final Dio _dio = Dio();
  String? _joke;
  String? _error;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _fetchJoke();
  }

  Future<void> _fetchJoke() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final response = await _dio.get(
        'https://icanhazdadjoke.com/',
        options: Options(
          headers: {'Accept': 'application/json'},
          responseType: ResponseType.json,
        ),
      );

      if (response.statusCode == 200 && response.data != null) {
        setState(() {
          _joke = response.data['joke'] as String? ?? 'No joke found.';
        });
      } else {
        setState(() {
          _error = 'Failed to fetch joke (status: ${response.statusCode}).';
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Network error: $e';
      });
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _dio.close(force: true);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WassalniColors.deepBlack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Random Joke'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: _loading
                        ? const SizedBox(
                            key: ValueKey('loading'),
                            width: 48,
                            height: 48,
                            child: CircularProgressIndicator(),
                          )
                        : _error != null
                            ? Column(
                                key: const ValueKey('error'),
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.error_outline, color: WassalniColors.gold, size: 36),
                                  const SizedBox(height: 12),
                                  Text(
                                    _error!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: WassalniColors.textSecondary),
                                  ),
                                ],
                              )
                            : _joke != null
                                ? Column(
                                    key: const ValueKey('joke'),
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                        child: Text(
                                          _joke!,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: WassalniColors.textPrimary,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    key: const ValueKey('empty'),
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.mood, color: WassalniColors.gold, size: 36),
                                      const SizedBox(height: 12),
                                      Text(
                                        'Tap the button to fetch a random joke',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: WassalniColors.textSecondary),
                                      ),
                                    ],
                                  ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _loading ? null : _fetchJoke,
                icon: const Icon(Icons.refresh),
                label: const Text('New Joke'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: WassalniColors.gold,
                  foregroundColor: WassalniColors.deepBlack,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _joke == null ? null : () => _shareJoke(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: WassalniColors.gold),
                  foregroundColor: WassalniColors.gold,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: const Text('Copy Joke'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _shareJoke() {
    if (_joke == null) return;
    // For now we copy to clipboard using a simple approach
    // Clipboard may require import from services; use ScaffoldMessenger for feedback
    // Avoid adding new dependencies; use Platform clipboard
    // We'll use Flutter's Clipboard
    Clipboard.setData(ClipboardData(text: _joke!));
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Joke copied to clipboard')));
  }
}
