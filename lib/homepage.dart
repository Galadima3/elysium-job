// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:elysium/util/job_card.dart';
import 'package:elysium/util/recent_job_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List jobsForYou = [
    ['Tesla', 'Software Eng.', 45, 'lib/icons/tesla.png'],
    ['Apple', 'Product Mgr.', 35, 'lib/icons/apple.png'],
    ['Tesla', 'Web Developer', 25, 'lib/icons/netflix.png'],
    ['Tesla', 'AI/ML Specialist', 65, 'lib/icons/spacex.png']
  ];
  final List recentJobs = [
    ['Nike', 'Legal Attorney', 85, 'lib/icons/nike.png'],
    ['Apple', 'Product Designer', 35, 'lib/icons/apple.png'],
    ['Google', 'Backend Developer', 25, 'lib/icons/google.png'],
    ['Twitter', 'Data Analyst', 65, 'lib/icons/twitter.png']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 65),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 40,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Image.asset('lib/icons/menu_from_left.png'),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: const Text(
              'Discover a New Path',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          const SizedBox(height: 25),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Container(
                              color: Colors.white,
                              height: 30,
                              child: Image.asset(
                                'lib/icons/search.png',
                                //color: Colors.grey.shade400,
                              )),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for a job....'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 50,
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset('lib/icons/preferences.png'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 35),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: const Text(
              'For You',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),

          const SizedBox(height: 25),

          Container(
            height: 150,
            child: ListView.builder(
              itemCount: jobsForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobsForYou[index][0],
                  jobTitle: jobsForYou[index][1],
                  hourlyRate: jobsForYou[index][2],
                  logoImagePath: jobsForYou[index][3],
                );
              },
            ),
          ),
          const SizedBox(height: 35),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: const Text(
              'Recently Added',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    hourlyRate: recentJobs[index][2],
                    logoImagePath: recentJobs[index][3],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
