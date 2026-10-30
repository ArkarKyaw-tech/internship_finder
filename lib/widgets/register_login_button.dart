import 'package:flutter/material.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class RegisterLoginButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  const RegisterLoginButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: Consumer<AuthController>(
        builder: (context, provider, child) {
          return ElevatedButton(
            onPressed: provider.isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF3549ED),
              foregroundColor: Colors.white,
              disabledBackgroundColor: Color(
                0xFF3549ED,
              ).withValues(alpha: 0.65),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            child: provider.isLoading
                ? const SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
