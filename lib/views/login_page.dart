import 'package:flutter/material.dart';
import 'package:internship_finder/providers/auth_provider.dart';
import 'package:internship_finder/views/register_page.dart';
import 'package:internship_finder/widgets/auth_text_field.dart';
import 'package:internship_finder/widgets/register_login_button.dart';
import 'package:internship_finder/widgets/register_login_devider.dart';
import 'package:internship_finder/widgets/register_login_header.dart';
import 'package:internship_finder/widgets/register_login_social_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _remeberMe = false;

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) return;
    if (_remeberMe != true) return;

    final authProviter = context.read<AuthController>();

    final success = await authProviter.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (success) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          authProviter.errorMessage ?? 'Login failed',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RegisterLoginHeader(isRegister: false),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
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
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _remeberMe,
                          onChanged: (value) {
                            setState(() {
                              _remeberMe = value ?? false;
                            });
                          },
                          activeColor: Color(0xFF3549ED),
                          side: BorderSide(
                            color: _remeberMe ? Color(0xFF14203D) : Colors.red,
                            width: 2,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Remember me',
                            style: TextStyle(
                              color: _remeberMe
                                  ? Color(0xFF14203D)
                                  : Colors.red,
                              fontSize: 13,
                            ),
                          ),
                        ),

                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color(0xFF3549ED),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    RegisterLoginButton(label: 'Log In', onPressed: _submit),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              RegisterLoginDevider(text: 'Or continue with'),
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
              _buildBottomCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomCard({required VoidCallback onPressed}) {
    return Card(
      surfaceTintColor: Color(0xFF3549ED),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 35, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.school_rounded, size: 40, color: Color(0xFF3549ED)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New to InternHub?',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Join our community and discover excting internship opportunities.',
                    style: TextStyle(color: Color(0xFF7D879A)),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: context.read<AuthController>().isLoading
                        ? null
                        : onPressed,
                    child: Row(
                      children: [
                        Text(
                          'Create an Account',
                          style: TextStyle(
                            color: Color(0xFF3549ED),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Color(0xFF3549ED),
                          size: 20,
                        ),
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
}
