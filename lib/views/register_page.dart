import 'package:flutter/material.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:internship_finder/views/login_page.dart';
import 'package:internship_finder/widgets/auth_text_field.dart';
import 'package:internship_finder/widgets/register_login_button.dart';
import 'package:internship_finder/widgets/register_login_devider.dart';
import 'package:internship_finder/widgets/register_login_header.dart';
import 'package:internship_finder/widgets/register_login_social_button.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;

    final authProviter = context.read<AuthController>();

    final success = await authProviter.register(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      // Clear pushed RegisterPage route.
      Navigator.of(context).popUntil((route) => route.isFirst);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          authProviter.errorMessage ?? 'Register failed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black87),
              ),

              RegisterLoginHeader(),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      label: 'Full Name',
                      hint: 'Enter your full Name',
                      prefixIcon: Icons.person_outline_outlined,
                      controller: _nameController,
                      autofillHints: const [AutofillHints.name],
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      label: 'Email Address',
                      hint: 'example@domain.com',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      autofillHints: const [AutofillHints.email],
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        final email = value?.trim() ?? '';
                        if (email.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        ).hasMatch(email)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      label: 'Phome Number (Optional)',
                      hint: '+95 9 123 456 789',
                      keyboardType: TextInputType.phone,
                      prefixIcon: Icons.phone_outlined,
                      controller: _phoneController,
                      autofillHints: const [AutofillHints.telephoneNumber],
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      label: 'Password',
                      hint: 'Create a strong password',
                      prefixIcon: Icons.lock_outline,
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      autofillHints: const [AutofillHints.newPassword],
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        final password = value?.trim() ?? '';
                        if (password.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (password.length < 8) {
                          return 'Password must be at least 8 characters';
                        }

                        if (!RegExp(r'[A-Z]').hasMatch(password)) {
                          return 'Include at least one uppercase letter';
                        }

                        if (!RegExp(r'[a-z]').hasMatch(password)) {
                          return 'Include at least one lowercase letter';
                        }

                        if (!RegExp(r'[0-9]').hasMatch(password)) {
                          return 'Include at least one digit';
                        }

                        return null;
                      },
                      suffixIcon: IconButton(
                        tooltip: _isPasswordVisible
                            ? 'Hide password'
                            : 'Show password',
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    AuthTextField(
                      label: 'Confirm Password',
                      hint: 'Re-enter your password',
                      prefixIcon: Icons.lock_outline,
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      autofillHints: const [AutofillHints.newPassword],
                      textInputAction: TextInputAction.next,
                      suffixIcon: IconButton(
                        tooltip: _isConfirmPasswordVisible
                            ? 'Hide password'
                            : 'Show password',
                        onPressed: () {
                          setState(() {
                            _isConfirmPasswordVisible =
                                !_isConfirmPasswordVisible;
                          });
                        },
                        icon: Icon(
                          _isConfirmPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      validator: (value) {
                        final confirmPassword = value?.trim() ?? '';
                        if (confirmPassword.isEmpty) {
                          return 'Please confirm your password';
                        }

                        if (confirmPassword != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) => _submit(),
                    ),
                    const SizedBox(height: 18),
                    RegisterLoginButton(
                      label: 'Create Accont',
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              RegisterLoginDevider(text: 'Or sign up with'),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: RegisterLoginSocialButton(
                      icon: Icons.g_mobiledata,
                      label: 'Google',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: RegisterLoginSocialButton(
                      icon: Icons.apple,
                      label: 'Apple',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              _buildBottomText(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomText({required VoidCallback onPressed}) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          const Text(
            'Already have an account?',
            style: TextStyle(fontSize: 13, color: Color(0xFF7D879A)),
          ),
          TextButton(
            onPressed: context.read<AuthController>().isLoading
                ? null
                : onPressed,
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.padded,
            ),
            child: const Text(
              'Log In',
              style: TextStyle(
                color: Color(0xFF3549ED),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
