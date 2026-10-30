import 'package:flutter/material.dart';

class JobDetailsPage extends StatelessWidget {
  const JobDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F8FC),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: _buildHeader()),
                    SliverToBoxAdapter(child: _buildJobInfo()),
                    SliverToBoxAdapter(child: _buildTabs()),
                    SliverFillRemaining(
                      hasScrollBody: true,
                      child: TabBarView(
                        children: [
                          _buildAboutTab(),
                          _buildRequirementsTab(),
                          _buildBenefitsTab(),
                          _buildReviewsTab(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _buildApplyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Color(0xFFDAE8F7), Color(0xFF8FB6DC), Color(0xFFE9F0F8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            image: DecorationImage(
              image: NetworkImage(
                "https://tse1.mm.bing.net/th/id/OIF.GizVBcD9DN2vvwRLzcf1Fg?r=0&pid=Api&h=220&P=0",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          right: 12,
          bottom: 12,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('1/5', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }

  Widget _buildJobInfo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Mobile App Developer Intern",
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF17213B),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Color(0xFFE1EAFF),
                child: Image.network(
                  "https://tse2.mm.bing.net/th/id/OIP.KQeUzJ4a2lwF-sxRdmWNfQHaHa?r=0&pid=Api&h=220&P=0",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  "Google",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _infoChip(label: "Remote", icon: Icons.location_on_outlined),
              _infoChip(
                label: '3-6 months',
                icon: Icons.calendar_month_outlined,
              ),
              _infoChip(
                label: "Internship",
                icon: Icons.work_outline,
                color: Colors.green[50],
                textColor: Colors.green[900],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoChip({
    required String label,
    IconData? icon,
    Color? color = Colors.white,
    Color? textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: const Color(0xFF687386)),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: const TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: Color(0xFF3549E8),
        unselectedLabelColor: Color(0xFF687386),
        indicatorColor: Color(0xFF3549E8),
        tabs: [
          Tab(text: 'About'),
          Tab(text: 'Requirements'),
          Tab(text: 'Benefits'),
          Tab(text: 'Reviews'),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsetsGeometry.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF17213B),
        ),
      ),
    );
  }

  Widget _bulletItems(String text, {bool isCheckIcon = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: isCheckIcon
                ? Icon(Icons.check, color: Color(0xFF3549EB), size: 17)
                : Icon(Icons.circle_sharp, color: Color(0xFF3549EB), size: 13),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(height: 1.5, color: Color(0xFF4D586B)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _sectionTitle("Job Description"),
        Text(
          "Join our mobile team to build improve our Android and IOS applications.You will work with experence enginerrs and make real impact for millions of users.",
          style: const TextStyle(height: 1.6, color: Color(0xFF4D586B)),
        ),
        const SizedBox(height: 24),
        _sectionTitle("Key Responsibilities"),
        _bulletItems("Develop and mantain Flutter mobile applications"),
        _bulletItems("Collaborate with cross-functional teams"),
        _bulletItems("Participate in code reviews"),
        _bulletItems("Learn and apply best practices"),
        const SizedBox(height: 24),
        _sectionTitle("Requirements"),
        _bulletItems(
          isCheckIcon: false,
          "Currently enrolled in a university program",
        ),
        _bulletItems(
          isCheckIcon: false,
          "Basic knowledge of flutter or Android/IOS",
        ),
        _bulletItems(isCheckIcon: false, "Good problem-sloving skills"),
        _bulletItems(isCheckIcon: false, "Passionate about mobile development"),
      ],
    );
  }

  Widget _buildRequirementsTab() {
    return Placeholder();
  }

  Widget _buildBenefitsTab() {
    return Placeholder();
  }

  Widget _buildReviewsTab() {
    return Placeholder();
  }

  Widget _buildApplyButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      color: Color(0xFFF6F8FC),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF3549EB),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            "Apply Now",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
