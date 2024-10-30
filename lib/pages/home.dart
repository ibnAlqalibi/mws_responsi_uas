import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF7FF),
      appBar: AppBar(
        title: const Icon(Icons.account_circle_outlined),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.settings_outlined), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Guest section
            const Text(
              'Guest',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Roboto"),
            ),
            const SizedBox(height: 16),

            const Row(
              children: [
                Text(
                  'Widget Grid View',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 132,
                    height: 180,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFECE6F0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/media.png',
                          height: 120,
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(start: 8, top: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Artist',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.only(start: 8),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Song',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),

            // Widget List View section
            const Row(
              children: [
                Text('Widget List View',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 22)),
                SizedBox(
                  width: 12,
                ),
                Icon(Icons.arrow_forward),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/media.png',
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            children: [
                              Container(
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Headline',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 22)),
                                    Text(
                                        'Description duis aute \nirure dolor in \nreprehenderit in volupt...',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            overflow: TextOverflow.ellipsis)),
                                    Row(
                                      children: [
                                        Icon(Icons.add_circle_outline_outlined),
                                        Text('Today • 23 min'),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Icon(Icons.play_arrow),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
