import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Dashboard',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FB),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final student = Student(
      name: "Cung Sin Mawi",
      major: "Computer Engineering",
      enrollmentDate: DateTime(2023, 9),
      about:
          "I am currently a senior at SJSU studying CMPE major and I like to sing and sleep.",
    );

    final formattedDate =
        DateFormat("MMMM yyyy").format(student.enrollmentDate);

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE3F2FD),
                Color(0xFFFCE4EC),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                const SizedBox(height: 20),

                Text(
                  "Student Dashboard",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),

                const SizedBox(height: 30),

                // ================= PROFILE CARD =================
                Container(
                  width: screenWidth * 0.9,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFF81C7E3),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 15,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Image.asset(
                          "assets/profile.jpeg",
                          height: 130,
                          width: 130,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Text(
                        student.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.3,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Major: ${student.major}",
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        "Enrollment Date: $formattedDate",
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ================= ABOUT CARD =================
                Container(
                  width: screenWidth * 0.9,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "About Me",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        student.about,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                // ================= HOBBIES CARD =================
                Container(
                  width: screenWidth * 0.9,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "Hobbies",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.camera_alt, size: 32),
                          Icon(Icons.brush, size: 32),
                          Icon(Icons.restaurant, size: 32),
                          Icon(Icons.music_note, size: 32),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}