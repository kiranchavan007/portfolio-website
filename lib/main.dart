import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Copied to clipboard: $text')),
    );
  }

  void _launchURL() async {
    const url =
        'https://www.figma.com/design/yR668AnOK92CPZjE22oVUI/Digital-Product?node-id=0-1&t=vgrrMbIIJnfxI2XK-1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Kiran Chavan',
                style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ).animate().fadeIn(duration: 800.ms).slideY(),
              SizedBox(height: 10),
              AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'UI/UX Designer & Flutter Developer',
                    textStyle:
                        GoogleFonts.lato(fontSize: 24, color: Colors.grey),
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
              SizedBox(height: 20),
              Text(
                'Designing for impact. Creating for users.',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueAccent),
                ),
              ).animate().fadeIn(duration: 1000.ms).slideY(),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _launchURL,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 20),
                ),
                child: Text('View My Work'),
              ).animate().scale(duration: 500.ms),
              SizedBox(height: 30),
              Text(
                'Projects',
                style:
                    GoogleFonts.lato(fontSize: 30, fontWeight: FontWeight.bold),
              ).animate().fadeIn(duration: 700.ms).slideY(),
              SizedBox(height: 10),
              Text(
                '📱 APMC System - Mobile UI & Flutter Frontend Development',
                style: GoogleFonts.lato(fontSize: 22),
              ).animate().fadeIn(delay: 400.ms),
              Text(
                '🌐 Digital Product Website UI',
                style: GoogleFonts.lato(fontSize: 22),
              ).animate().fadeIn(delay: 600.ms),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () => _copyToClipboard(context, '+91 9373281493'),
                child: Text(
                  '📞 +91 9373281493',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white70,
                      decoration: TextDecoration.underline),
                ).animate().fadeIn(delay: 800.ms),
              ),
              GestureDetector(
                onTap: () =>
                    _copyToClipboard(context, 'kiranmchavan018@gmail.com'),
                child: Text(
                  '📧 kiranmchavan018@gmail.com',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.white70,
                      decoration: TextDecoration.underline),
                ).animate().fadeIn(delay: 1000.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
