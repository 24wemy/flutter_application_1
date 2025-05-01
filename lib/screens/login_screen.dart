import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  late final AnimationController _backgroundController =
      AnimationController(vsync: this, duration: const Duration(seconds: 10))
        ..repeat();
  late final AnimationController _formController = AnimationController(
    vsync: this,
    duration: kAnimationDuration,
  );
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _formController.forward();
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _formController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _backgroundController,
            builder: (_, child) {
              return CustomPaint(
                painter: AnimatedBackground(
                  animationValue: _backgroundController.value,
                ),
                size: Size(screenWidth, screenHeight),
              );
            },
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FadeTransition(
                          opacity: CurvedAnimation(
                            parent: _formController,
                            curve: Curves.easeInOut,
                          ),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _formController,
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Text(
                              "Welcome Back",
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 36.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Login to continue",
                          style: TextStyle(
                            color: AppColors.textColor.withOpacity(0.7),
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 40),
                        FadeTransition(
                          opacity: CurvedAnimation(
                            parent: _formController,
                            curve: const Interval(0.2, 1, curve: Curves.easeInOut),
                          ),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _formController,
                                curve: const Interval(0.2, 1, curve: Curves.easeInOut),
                              ),
                            ),
                            child: CustomTextField(
                              controller: _emailController,
                              labelText: "Email",
                              prefixIcon: Icons.email,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        FadeTransition(
                          opacity: CurvedAnimation(
                            parent: _formController,
                            curve: const Interval(0.4, 1, curve: Curves.easeInOut),
                          ),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _formController,
                                curve: const Interval(0.4, 1, curve: Curves.easeInOut),
                              ),
                            ),
                            child: CustomTextField(
                              controller: _passwordController,
                              labelText: "Password",
                              prefixIcon: Icons.lock,
                              obscureText: _obscurePassword,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        FadeTransition(
                          opacity: CurvedAnimation(
                            parent: _formController,
                            curve: const Interval(0.6, 1, curve: Curves.easeInOut),
                          ),
                          child: SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(0, 0.2),
                              end: Offset.zero,
                            ).animate(
                              CurvedAnimation(
                                parent: _formController,
                                curve: const Interval(0.6, 1, curve: Curves.easeInOut),
                              ),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 15),
                                textStyle: const TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                elevation: 5,
                                shadowColor: AppColors.primaryColor.withOpacity(0.5),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Lakukan proses login di sini
                                  print("Login berhasil!");
                                }
                              },
                              child: const Text("Login",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends CustomPainter {
  final double animationValue;

  AnimatedBackground({required this.animationValue}) : super();

  @override
  void paint(Canvas canvas, Size size) {
    _drawGradientBackground(canvas, size);
    _drawCircles(canvas, size);
    _drawLines(canvas, size);
  }

  void _drawGradientBackground(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final Gradient gradient = LinearGradient(
      colors: [AppColors.primaryColor, AppColors.secondaryColor],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);
  }

  void _drawCircles(Canvas canvas, Size size) {
    final Paint circlePaint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    final double maxRadius = min(size.width, size.height) / 4;

    for (int i = 0; i < 5; i++) {
      double radius = maxRadius * (0.3 + i * 0.1) * (0.5 + sin(animationValue + i));
      double x = size.width * (0.2 + 0.6 * sin(animationValue * 2 + i));
      double y = size.height * (0.2 + 0.6 * cos(animationValue * 2 + i));

      canvas.drawCircle(Offset(x, y), radius, circlePaint);
    }
  }

  void _drawLines(Canvas canvas, Size size) {
    final Paint linePaint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 3; i++) {
      double startX = size.width * (0.1 + 0.8 * sin(animationValue + i));
      double startY = size.height * (0.1 + 0.8 * cos(animationValue + i));
      double endX = size.width * (0.8 - 0.6 * cos(animationValue * 2 + i));
      double endY = size.height * (0.8 - 0.6 * sin(animationValue * 2 + i));

      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), linePaint);
    }
  }

  @override
  bool shouldRepaint(covariant AnimatedBackground oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}