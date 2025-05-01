import 'package:flutter/material.dart';

/// A centralized class for managing application colors.
class AppColors {
  // Primary Palette
  static const Color primaryColor = Color(0xFF6750A4); // Deep Purple
  static const Color secondaryColor = Color(0xFFD0BCFF); // Light Purple
  static const Color accentColor = Color(0xFFE7D2F8); // Soft Lavender

  // Background and Surface
  static const Color backgroundColor = Color(0xFF121212); // Dark Background
  static const Color surfaceColor = Color(0xFF1E1E1E); // Slightly Lighter Black

  // Text Colors
  static const Color textColor = Colors.white; // Primary Text Color
  static const Color mutedTextColor = Color(0xFFB3B3B3); // Muted Gray Text

  // Status Colors
  static const Color errorColor = Color(0xFFF2B8B5); // Soft Red for Errors
  static const Color successColor = Color(0xFF4CAF50); // Green for Success
  static const Color warningColor = Color(0xFFFFC107); // Amber for Warnings
}