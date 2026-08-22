// lib/screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:wassalni/core/theme/wassalni_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fade;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fade = CurvedAnimation(
        parent: _ctrl, curve: const Interval(0.0, 0.9, curve: Curves.easeIn));
    _scale = Tween<double>(begin: 0.92, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: const Interval(0.0, 1.0, curve: Curves.easeOutBack)),
    );

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _buildLogoBox() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            WassalniColors.gold.withOpacity(0.98),
            WassalniColors.goldDark,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: WassalniColors.gold.withOpacity(0.18),
            blurRadius: 22,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Center(
        child: Text(
          'W',
          style: TextStyle(
            color: WassalniColors.deepBlack,
            fontSize: 68,
            fontWeight: FontWeight.w800,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
            letterSpacing: -1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: WassalniColors.deepBlack,
      body: SafeArea(
        child: Stack(
          children: [
            // Subtle premium background effect: radial gradient vignette
            Positioned.fill(
              child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0, -0.4),
                      radius: 1.2,
                      colors: [
                        Colors.transparent,
                        WassalniColors.darkSurface.withOpacity(0.18),
                        Colors.black.withOpacity(0.6),
                      ],
                      stops: const [0.0, 0.6, 1.0],
                    ),
                  ),
                ),
              ),
            ),

            // Center content
            Center(
              child: FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLogoBox(),
                      const SizedBox(height: 28),
                      // App name
                      Text(
                        'WASSALNI',
                        style: TextStyle(
                          color: WassalniColors.textPrimary,
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 1.6,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Tagline (Tunisian Arabic)
                      Text(
                        'توصلك وين ما تكون',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: WassalniColors.gold,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Optional small subtitle for balance (kept subtle)
                      Text(
                        'تطبيق النقل المتميز',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          color: WassalniColors.textSecondary,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom loading indicator
            Positioned(
              bottom: mq.size.height * 0.06,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Minimal elegant loading indicator: three animated dots
                  _ThreeDotLoading(
                    color: WassalniColors.gold.withOpacity(0.92),
                    dotSize: 8,
                    spacing: 8,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'جاري التحضير...',
                    style: TextStyle(
                      color: WassalniColors.textTertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThreeDotLoading extends StatefulWidget {
  final Color color;
  final double dotSize;
  final double spacing;
  const _ThreeDotLoading({
    Key? key,
    required this.color,
    this.dotSize = 8,
    this.spacing = 6,
  }) : super(key: key);

  @override
  State<_ThreeDotLoading> createState() => _ThreeDotLoadingState();
}

class _ThreeDotLoadingState extends State<_ThreeDotLoading>
    with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _a1;
  late final Animation<double> _a2;
  late final Animation<double> _a3;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat();
    _a1 = Tween<double>(begin: 0.25, end: 1.0).animate(
        CurvedAnimation(parent: _c, curve: const Interval(0.0, 0.66, curve: Curves.easeInOut)));
    _a2 = Tween<double>(begin: 0.25, end: 1.0).animate(
        CurvedAnimation(parent: _c, curve: const Interval(0.16, 0.82, curve: Curves.easeInOut)));
    _a3 = Tween<double>(begin: 0.25, end: 1.0).animate(
        CurvedAnimation(parent: _c, curve: const Interval(0.32, 1.0, curve: Curves.easeInOut)));
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  Widget _dot(Animation<double> anim) {
    return FadeTransition(
      opacity: anim,
      child: ScaleTransition(
        scale: anim,
        child: Container(
          width: widget.dotSize,
          height: widget.dotSize,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(0.28),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _dot(_a1),
        SizedBox(width: widget.spacing),
        _dot(_a2),
        SizedBox(width: widget.spacing),
        _dot(_a3),
      ],
    );
  }
}
