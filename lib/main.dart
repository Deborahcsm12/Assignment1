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

    return Scaffold(
      body: Container(
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
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Profile Card (Baby Blue)
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFBDE3FF),
                              borderRadius: BorderRadius.circular(25),
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
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.asset(
                                    "assets/profile.jpeg",
                                    height: 110,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  student.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Major: ${student.major}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  "Enrollment Date: $formattedDate",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          // About Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECECEC),
                              borderRadius: BorderRadius.circular(25),
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
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  student.about,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 25),

                          // Hobbies Card
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECECEC),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              children: const [
                                Text(
                                  "Hobbies",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.camera_alt, size: 28),
                                    Icon(Icons.brush, size: 28),
                                    Icon(Icons.restaurant, size: 28),
                                    Icon(Icons.music_note, size: 28),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}