import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'appbar_screen.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AppbarScreen()),
        body:
         SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(10),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                     SizedBox(height: 10),
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.red.shade900,
                          child:  CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              'assets/images/img1.jpg',
                            ),
                          ),
                        ),
                
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding:  EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.red.shade900,
                              shape: BoxShape.circle,
                            ),
                            child:  Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                
                     SizedBox(height: 14),
                     Text(
                      "Alex Thompson",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                
                     SizedBox(height: 4),
                
                    Text(
                      "alex.thompson@example.io",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 10,
                      ),
                    ),
                
                     // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        statCard("TASKS", "128"),
                         SizedBox(width: 16),
                        statCard("STREAK", "12d"),
                      ],
                    ),
                
                     SizedBox(height: 10),
                
                    sectionTitle("PREFERENCES"),
                     SizedBox(height: 5),
                
                    settingsContainer([
                      settingsTile(
                        Icons.notifications_none,
                        "Notifications",
                      ),
                      settingsTile(
                        Icons.security,
                        "Security",
                      ),
                      settingsTile(
                        Icons.palette_outlined,
                        "Appearance",
                      ),
                    ]),
                
                     SizedBox(height: 10),
                
                    sectionTitle("GENERAL"),
                    SizedBox(height: 5),
                
                
                    settingsContainer([
                      settingsTile(
                        Icons.info_outline,
                        "About TaskMind",
                      ),
                      settingsTile(
                        Icons.help_outline,
                        "Help & Support",
                      ),
                    ]),
                
                    // Spacer(),
                    SizedBox(height: 60,),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: ()
                          async {

                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            prefs.clear();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                        },
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red.shade900,
                        ),
                        label: Text(
                          "Log Out",
                          style: TextStyle(
                            color: Colors.red.shade900,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: Colors.red.shade200,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                
                     SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget sectionTitle(String title) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      );
    }

    Widget settingsContainer(List<Widget> children) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.red.shade100,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(children: children),
      );
    }

    // SETTINGS TILE
    Widget settingsTile(IconData icon, String title) {
      return ListTile(
        leading: Icon(
          icon,
          color: Colors.red.shade900,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
        ),
        onTap: () {},
      );
    }

    // STATS CARD
    Widget statCard(String title, String value) {
      return Container(
        width: 90,
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 5,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }
  }