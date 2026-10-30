import 'package:flutter/material.dart';
import 'package:internship_finder/widgets/section_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FC),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 28),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  _buildHeaderSection(),
                  const SizedBox(height: 20),
                  _buildProgressSection(),
                  const SizedBox(height: 16),
                  _buildTimeLineSection(),
                  const SizedBox(height: 16),
                  SectionHeader(title: "My Applications", onSeeAll: () {}),
                  const SizedBox(height: 12),
                  _buildApplicationSection(),
                  const SizedBox(height: 16),
                  SectionHeader(title: "Suggested Learning", onSeeAll: () {}),
                  const SizedBox(height: 12),
                  _buildLearningCourseSection(),
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
          child: Text(
            "My Progress",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF17213B),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_outlined, size: 27),
        ),
      ],
    );
  }

  Widget _buildProgressSection() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF0F2F7)),
        // ignore: deprecated_member_use
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.7,
                  strokeWidth: 8,
                  backgroundColor: Color(0xFFE0E0E0),
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              const Text(
                '70%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Internship Journey',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Keep going! You\'re making great progress.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLineSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildTimeLineItems(
            title: 'Complete Profile',
            subtitle: '',
            isCompleted: true,
            onToggle: () {},
          ),
          Divider(color: Colors.grey[200]),
          _buildTimeLineItems(
            title: 'Build Your Resume',
            subtitle: 'Done',
            isCompleted: true,
            onToggle: () {},
          ),
          Divider(color: Colors.grey[200]),
          _buildTimeLineItems(
            title: 'Apply for Internships',
            subtitle: 'Your\'re here',
            isCurrent: true,
            onToggle: () {},
          ),
          Divider(color: Colors.grey[200]),
          _buildTimeLineItems(
            title: 'Attend Interviews',
            subtitle: 'Upcoming',
            isLocked: true,
            onToggle: () {},
          ),
          Divider(color: Colors.grey[200]),
          _buildTimeLineItems(
            title: 'Get hired',
            subtitle: 'Upcoming',
            isLocked: true,
            onToggle: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTimeLineItems({
    required String title,
    required String subtitle,
    required VoidCallback onToggle,
    bool isCompleted = false,
    bool isCurrent = false,
    bool isLocked = false,
  }) {
    final Color statusColor = isCompleted
        ? const Color(0xFF19b875)
        : (isCurrent ? const Color(0xFF3549E8) : const Color(0xFFB8C0CC));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onToggle,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isCompleted
                      ? Icons.check
                      : (isLocked
                            ? Icons.crisis_alert
                            : (isCurrent
                                  ? Icons.circle
                                  : Icons.circle_outlined)),
                  color: Colors.white,
                  size: isCurrent ? 12 : 17,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Container(width: 3, height: 20, color: Colors.grey[300]),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: isLocked ? Color(0xFF778195) : Color(0xFF17213B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isCompleted ? '' : subtitle,
                    style: TextStyle(
                      color: isCurrent ? Color(0xFF3549E8) : Color(0xFF778195),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              if (isLocked)
                const Icon(Icons.lock_outline, size: 19, color: Colors.grey),
              if (isCompleted)
                Text(
                  "Done",
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationSection() {
    return Row(
      children: [
        Expanded(
          child: _buildApplicationItems(
            count: "5",
            label: "Applied",
            background: Color(0xFFE2F0FF),
            foreground: Color(0xFF2450CF),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildApplicationItems(
            count: "2",
            label: "In Review",
            background: Color(0xFFFFF1D8),
            foreground: Color(0xFFB97813),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildApplicationItems(
            count: "1",
            label: "Interview",
            background: Color(0xFFEFE5FF),
            foreground: Color(0xFF7040CC),
          ),
        ),
      ],
    );
  }

  Widget _buildApplicationItems({
    required String count,
    required String label,
    required Color background,
    required Color foreground,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: foreground,
            ),
          ),
          const SizedBox(height: 5),
          Text(label, style: TextStyle(fontSize: 12, color: foreground)),
        ],
      ),
    );
  }

  Widget _buildLearningCourseSection() {
    return Column(
      children: [
        _buildLearingCourseItems(
          title: "Flutter For Beginer",
          creater: "Goggle Developer",
          level: "Beginner",
          duration: "2.5 hours",
          logoAsset:
              "https://thumb.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/250px-Flutter_logo.svg.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=thumbnail&_=20230821075714",
          logoColor: Colors.blue,
          onTap: () {},
        ),
        _buildLearingCourseItems(
          title: "UI/UX Design Fundamentals",
          creater: "Coursera",
          level: "Beginner",
          duration: "3 hours",
          logoAsset:
              "https://up.yimg.com/ib/th/id/OIP.EELRTA8uIS_1wVnRelrBGAHaHa?pid=Api&h=224&c=1&rs=1&qlt=95",
          logoColor: Colors.purple,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLearingCourseItems({
    required title,
    required creater,
    required level,
    required duration,
    required logoAsset,
    required logoColor,
    required onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: logoColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.network(logoAsset, width: 40, height: 40),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    creater,
                    style: const TextStyle(
                      color: Color(0xFF687386),
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: [
                      Text(
                        duration,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF7B8495),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.circle, color: Colors.grey, size: 10),
                      const SizedBox(width: 5),
                      Text(
                        level,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF7B8495),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_circle_filled,
                color: Color(0xFF3549E8),
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
