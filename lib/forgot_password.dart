import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() {
    return _ForgotPasswordScreenState();
  }
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey =
  GlobalKey<FormState>();

  final TextEditingController emailController =
  TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void sendResetLink() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Password reset link sent to your email!',
          ),
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
              padding: const EdgeInsets.all(24),

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
                    children: [

                      // BACK BUTTON

                      Align(
                        alignment: Alignment.centerLeft,

                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // ICON

                      Container(
                        width: 75,
                        height: 75,

                        decoration: BoxDecoration(
                          gradient:
                          const LinearGradient(
                            colors: [
                              Color(0xFF5B5FEF),
                              Color(0xFF9B5DE5),
                            ],
                          ),

                          borderRadius:
                          BorderRadius.circular(22),
                        ),

                        child: const Icon(
                          Icons.lock_reset_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // TITLE

                      const Text(
                        'Forgot Password?',

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF202124),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // DESCRIPTION

                      const Text(
                        'No worries! Enter your email address '
                            'and we will send you a link to reset '
                            'your password.',

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 30),

                      // EMAIL LABEL

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          'Email Address',

                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // EMAIL FIELD

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
                              value.trim().isEmpty) {
                            return 'Please enter your email';
                          }

                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 25),

                      // SEND RESET LINK

                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: ElevatedButton(
                          onPressed: sendResetLink,

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
                            'Send Reset Link',

                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // BACK TO LOGIN

                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: const Text(
                          'Back to Login',

                          style: TextStyle(
                            color: Color(0xFF5B5FEF),
                            fontWeight: FontWeight.bold,
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