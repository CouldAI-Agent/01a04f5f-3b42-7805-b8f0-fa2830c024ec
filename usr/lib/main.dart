import 'package:flutter/material.dart';

void main() {
  runApp(const CleaningPostApp());
}

class CleaningPostApp extends StatelessWidget {
  const CleaningPostApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cleaning Post',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class CleaningPost {
  final String title;
  final String description;
  final String author;
  final String date;
  final String price;

  CleaningPost({
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.price,
  });
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CleaningPost> posts = [
      CleaningPost(
        title: 'Deep House Cleaning',
        description: 'Need a thorough deep cleaning of a 3-bedroom house before moving in. Focus on kitchen and bathrooms.',
        author: 'Alice Smith',
        date: 'Today, 2:00 PM',
        price: '\$150',
      ),
      CleaningPost(
        title: 'Office Weekly Cleaning',
        description: 'Looking for a reliable cleaner for a small office space. Vacuuming, dusting, and trash removal.',
        author: 'TechCorp Inc.',
        date: 'Yesterday, 9:30 AM',
        price: '\$80/week',
      ),
      CleaningPost(
        title: 'Carpet Cleaning Service',
        description: 'Professional carpet cleaning needed for a living room and hallway. Stubborn stains need treatment.',
        author: 'Bob Johnson',
        date: 'Aug 27, 4:15 PM',
        price: '\$120',
      ),
      CleaningPost(
        title: 'Window Washing',
        description: 'Need exterior and interior window washing for a 2-story home. Equipment required.',
        author: 'Carol White',
        date: 'Aug 26, 11:00 AM',
        price: '\$200',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cleaning Posts'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 800),
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  post.title,
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              Text(
                                post.price,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            post.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person, size: 16, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    post.author,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    post.date,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Contacting ${post.author}...')),
                                );
                              },
                              icon: const Icon(Icons.message),
                              label: const Text('Reply'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New post feature coming soon!')),
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('New Post'),
      ),
    );
  }
}