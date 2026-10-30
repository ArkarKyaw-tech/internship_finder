import 'package:flutter/material.dart';
import 'package:internship_finder/models/job_model.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:internship_finder/views/job_details_page.dart';
import 'package:internship_finder/widgets/job_card.dart';
import 'package:internship_finder/widgets/section_header.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<JobModel> jobs = [
      JobModel(
        id: 1,
        logoAsset:
            "https://tse2.mm.bing.net/th/id/OIP.KQeUzJ4a2lwF-sxRdmWNfQHaHa?r=0&pid=Api&h=220&P=0",
        title: "Mobile App Developer Intern",
        company: 'Google',
        location: 'Remote',
        duration: '3-6 months',
        createdAt: '3 days ago',
        type: 'internship',
        description:
            'Join our mobile team to build and imrove Android and iOS application. You will work with experienced engineers and learn how to develop real-world apps.',
        responsibilities: [
          'Develop and mantain Flutter mobile applications',
          'Collaborate with cross-functional teams',
          'Participate in code reviews',
          'Learn and apply best practices',
        ],
        requirements: [
          'Currently enrolled in a university program',
          'Basic knowledge of flutter or Android/IOS',
          'Good problem-sloving skills',
          'Passionate about mobile development',
        ],
        benefits: [''],
        reviews: [''],
      ),
      JobModel(
        id: 2,
        logoAsset:
            "https://thumb.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/250px-Flutter_logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail&_=20230821075714",
        title: "Flutter Developer Intern",
        company: 'Tech Solutions',
        location: 'Yangon, Myanmar',
        createdAt: '5 days ago',
        duration: '3 months',
        type: 'Internship',
        description:
            'Join our mobile team to build and imrove Android and iOS application. You will work with experienced engineers and learn how to develop real-world apps.',
        responsibilities: [
          'Develop and mantain Flutter mobile applications',
          'Collaborate with cross-functional teams',
          'Participate in code reviews',
          'Learn and apply best practices',
        ],
        requirements: [
          'Currently enrolled in a university program',
          'Basic knowledge of flutter or Android/IOS',
          'Good problem-sloving skills',
          'Passionate about mobile development',
        ],
        benefits: [''],
        reviews: [''],
      ),
      JobModel(
        id: 3,
        logoAsset:
            "https://up.yimg.com/ib/th/id/OIP.EELRTA8uIS_1wVnRelrBGAHaHa?pid=Api&h=224&c=1&rs=1&qlt=95",
        title: "UI/UX Design Intern",
        company: 'Creative Studio',
        location: 'Remote',
        duration: '3 months',
        createdAt: '1 week ago',
        type: 'Internship',
        description:
            'Join our mobile team to build and imrove Android and iOS application. You will work with experienced engineers and learn how to develop real-world apps.',
        responsibilities: [
          'Develop and mantain Flutter mobile applications',
          'Collaborate with cross-functional teams',
          'Participate in code reviews',
          'Learn and apply best practices',
        ],
        requirements: [
          'Currently enrolled in a university program',
          'Basic knowledge of flutter or Android/IOS',
          'Good problem-sloving skills',
          'Passionate about mobile development',
        ],
        benefits: [''],
        reviews: [''],
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeaderSection(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Consumer<AuthController>(
                        builder: (context, provider, child) =>
                            Text('${provider.currentUser?.email}'),
                      ),
                      TextButton(
                        onPressed: () async {
                          await context.read<AuthController>().logout();
                        },
                        child: Row(
                          children: [
                            Icon(Icons.arrow_back, color: Colors.red),
                            Text('logout', style: TextStyle(color: Colors.red)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                  _buildBannerSection(),
                  const SizedBox(height: 20),
                  _buildCategorySection(),
                  const SizedBox(height: 10),
                  SectionHeader(title: "Recommended for you ", onSeeAll: () {}),
                  const SizedBox(height: 10),
                  ...jobs.map(
                    (job) => JobCard(
                      title: job.title,
                      company: job.company,
                      location: job.location,
                      time: job.createdAt,
                      logoAsset: job.logoAsset,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => JobDetailsPage()),
                        );
                      },
                    ),
                  ),
                  SectionHeader(title: "Popular Skills", onSeeAll: () {}),
                  const SizedBox(height: 10),
                  _buildSkillSection(),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ",
                style: TextStyle(color: Color(0xFF7B8495), fontSize: 17),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    "Thike Thike",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text('👋', style: TextStyle(fontSize: 24)),
                ],
              ),

              const SizedBox(height: 3),
              Text(
                "Lets Build Future together!",
                style: TextStyle(color: Color(0xFF7B8495), fontSize: 20),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "https://tse2.mm.bing.net/th/id/OIP.HarE69NbmjDkDvrfkBoHUQHaHa?r=0&pid=Api&h=220&P=0",
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBannerSection() {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(22),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: AssetImage("assets/images/register_banner.png"),
                fit: BoxFit.cover,
              ),
            ),

            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900.withValues(alpha: 0.85),
                      Colors.transparent,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find Your\nDream Intership',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Gain real experience\nand grow your skills',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      disabledForegroundColor: Color(0xFF3B56F5),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Explore Now',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.arrow_forward, size: 16),
                      ],
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

  Widget _buildCategorySection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryItems(
            icon: Icons.work,
            label: "Internships",
            backgroundColor: Color(0xFFE1EEFF),
            iconColor: Color(0xFF2878E8),
          ),
          const SizedBox(width: 30),
          _buildCategoryItems(
            icon: Icons.business,
            label: "Compaines",
            backgroundColor: Color(0xFFEFE5FF),
            iconColor: Color(0xFF8052D6),
          ),
          const SizedBox(width: 30),
          _buildCategoryItems(
            icon: Icons.menu_book,
            label: "Learing",
            backgroundColor: Color(0xFFDDF8E9),
            iconColor: Color(0xFFD72D62),
          ),
          const SizedBox(width: 30),
          _buildCategoryItems(
            icon: Icons.bar_chart,
            label: "Progress",
            backgroundColor: Color(0xFFDDF8E9),
            iconColor: Color(0xFF16A36A),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillSection() {
    final skills = [
      {
        'name': 'Flutter',
        'color': const Color(0xFFE1F5FE),
        'textColor': const Color(0xFF0288D1),
      },
      {
        'name': 'Dart',
        'color': const Color(0xFFE8EAF6),
        'textColor': const Color(0xFF3F51B5),
      },
      {
        'name': 'UI/UX',
        'color': const Color(0xFFE8F5F9),
        'textColor': const Color(0xFF388E3C),
      },
      {
        'name': 'Git',
        'color': const Color(0xFFFFEBEE),
        'textColor': const Color(0xFFD32F2F),
      },
      {
        'name': 'Python',
        'color': const Color(0xFFF3E5F5),
        'textColor': const Color(0xFF7B1FA2),
      },
      {
        'name': 'Firebase',
        'color': const Color(0xFFFFF3E0),
        'textColor': const Color(0xFFE65100),
      },
      {
        'name': 'REST API',
        'color': const Color(0xFFE0F7FA),
        'textColor': const Color(0xFF0097A7),
      },
      {
        'name': 'Figma',
        'color': const Color(0xFFFCE4EC),
        'textColor': const Color(0xFFC2185B),
      },
    ];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: skills.map((skill) {
        return _buildSkillChip(
          name: skill['name'] as String,
          color: skill['color'] as Color,
          textColor: skill['textColor'] as Color,
        );
      }).toList(),
    );
  }

  Widget _buildCategoryItems({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color iconColor,
  }) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip({
    required name,
    required Color color,
    required textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
