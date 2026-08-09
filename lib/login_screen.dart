import 'package:flutter/material.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // SIGN IN FUNCTIONALITY
  void login() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login successful!'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

        // BACKGROUND
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF5B5FEF),
              Color(0xFF7B4DDB),
              Color(0xFF9B5DE5),
            ],
          ),
        ),

        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Container(
                padding: const EdgeInsets.all(28),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),

                child: Form(
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // =========================
                      // LOGO
                      // =========================

                      Center(
                        child: Container(
                          width: 70,
                          height: 70,

                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF5B5FEF),
                                Color(0xFF9B5DE5),
                              ],
                            ),
                            borderRadius:
                            BorderRadius.circular(20),
                          ),

                          child: const Icon(
                            Icons.lock_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // =========================
                      // TITLE
                      // =========================

                      const Center(
                        child: Text(
                          'Welcome Back!',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF202124),
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Center(
                        child: Text(
                          'Sign in to continue your journey',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // =========================
                      // EMAIL LABEL
                      // =========================

                      const Text(
                        'Email Address',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // =========================
                      // EMAIL FIELD
                      // =========================

                      TextFormField(
                        controller: emailController,

                        keyboardType:
                        TextInputType.emailAddress,

                        decoration: InputDecoration(
                          hintText: 'Enter your email',

                          prefixIcon: const Icon(
                            Icons.email_outlined,
                          ),

                          filled: true,

                          fillColor:
                          const Color(0xFFF6F6FA),

                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(14),
                            borderSide:
                            const BorderSide(
                              color: Color(0xFF5B5FEF),
                              width: 2,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return 'Please enter your email';
                          }

                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      // =========================
                      // PASSWORD LABEL
                      // =========================

                      const Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF333333),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // =========================
                      // PASSWORD FIELD
                      // =========================

                      TextFormField(
                        controller: passwordController,

                        obscureText: obscurePassword,

                        decoration: InputDecoration(
                          hintText: 'Enter your password',

                          prefixIcon: const Icon(
                            Icons.lock_outline_rounded,
                          ),

                          // SHOW / HIDE PASSWORD
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword =
                                !obscurePassword;
                              });
                            },

                            icon: Icon(
                              obscurePassword
                                  ? Icons
                                  .visibility_off_outlined
                                  : Icons
                                  .visibility_outlined,
                            ),
                          ),

                          filled: true,

                          fillColor:
                          const Color(0xFFF6F6FA),

                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(14),
                            borderSide: BorderSide.none,
                          ),

                          focusedBorder:
                          OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(14),
                            borderSide:
                            const BorderSide(
                              color: Color(0xFF5B5FEF),
                              width: 2,
                            ),
                          ),
                        ),

                        validator: (value) {
                          if (value == null ||
                              value.isEmpty) {
                            return 'Please enter your password';
                          }

                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // =========================
                      // FORGOT PASSWORD
                      // =========================

                      Align(
                        alignment: Alignment.centerRight,

                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                const ForgotPasswordScreen(),
                              ),
                            );
                          },

                          child: const Text(
                            'Forgot Password?',

                            style: TextStyle(
                              color: Color(0xFF5B5FEF),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // =========================
                      // SIGN IN BUTTON
                      // =========================

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          onPressed: login,

                          style:
                          ElevatedButton.styleFrom(
                            backgroundColor:
                            const Color(0xFF5B5FEF),

                            foregroundColor:
                            Colors.white,

                            elevation: 4,

                            shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(14),
                            ),
                          ),

                          child: const Text(
                            'Sign In',

                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      // =========================
                      // OR DIVIDER
                      // =========================

                      Row(
                        children: [
                          const Expanded(
                            child: Divider(),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),

                            child: Text(
                              'OR',

                              style: TextStyle(
                                color:
                                Colors.grey.shade600,
                                fontSize: 12,
                                fontWeight:
                                FontWeight.w600,
                              ),
                            ),
                          ),

                          const Expanded(
                            child: Divider(),
                          ),
                        ],
                      ),

                      const SizedBox(height: 22),

                      // =========================
                      // CREATE ACCOUNT
                      // =========================

                      Center(
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Create Account clicked',
                                ),
                              ),
                            );
                          },

                          child: const Text(
                            "Don't have an account?  Create Account",

                            style: TextStyle(
                              color: Color(0xFF5B5FEF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}