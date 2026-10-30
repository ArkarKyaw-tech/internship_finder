import 'package:flutter/material.dart';

class RegisterLoginHeader extends StatelessWidget {
  final bool isRegister;
  const RegisterLoginHeader({super.key, this.isRegister = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(5),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image(
                image: isRegister
                    ? AssetImage('assets/images/register_banner.png')
                    : AssetImage('assets/images/login_banner.png'),
                fit: BoxFit.cover,
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.school_rounded,
                              size: 40,
                              color: Color(0xFF3549ED),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'InternHub',
                                  style: TextStyle(
                                    color: Color(0xFF3549ED),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    _buletText("Learn", isbulet: false),
                                    const SizedBox(width: 5),
                                    _buletText("Build"),
                                    const SizedBox(width: 5),
                                    _buletText("Grow"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        isRegister
                            ? RichText(
                                text: TextSpan(
                                  text: "Create Your \n",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Account",
                                      style: TextStyle(
                                        color: Color(0xFF3549ED),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Text(
                                "Welcome Back!",
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        const SizedBox(height: 5),
                        Text(
                          isRegister
                              ? "Join our internship platform and start building future."
                              : "Log in to your account and continue your journey.",
                          style: TextStyle(color: Color(0xFF7D879A)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(width: 110, color: Colors.transparent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buletText(String label, {bool isbulet = true}) {
    return Row(
      children: [
        isbulet
            ? Icon(Icons.circle, size: 5, color: Color(0xFF7D879A))
            : SizedBox(),
        SizedBox(width: 5),
        Text(label, style: TextStyle(color: Color(0xFF7D879A), fontSize: 12)),
      ],
    );
  }
}
