import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const mobileBreakpoint = 767.0;
  static const desktopBreakpoint = 1439.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width <= mobileBreakpoint;
    final isDesktop = size.width > mobileBreakpoint && size.width <= desktopBreakpoint;
    final isLargeDesktop = size.width > desktopBreakpoint;

    Widget loginFormContent = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          label:
          'Blood Connect logo with a drop of blood with a white medical cross and heart shape combined, with tagline Saving Lives Since 2010',
          child: Image.asset(
            'assets/BCT_logo.png',
            width: 400,
            height: 200,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.bloodtype, size: 80, color: Colors.red),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Login to your Account',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Email',
              prefixIcon: const Icon(Icons.person_outline),
              border: const UnderlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock_outline),
              border: const UnderlineInputBorder(),
            ),
            obscureText: true,
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              minimumSize: const Size.fromHeight(48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              // Example: Navigate to a new screen
              // Navigator.pushNamed(context, '/dashboard');
            },
            child: const Text('Sign In', style: TextStyle(fontSize: 18, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 24),
        const Text('or sign in with'),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _SocialIconButton(
                iconData: Icons.g_mobiledata,
                color: Colors.red,
                semanticLabel: 'Sign in with Google',
                onTap: () {},
              ),
              _SocialIconButton(
                iconData: Icons.facebook,
                color: Colors.blue,
                semanticLabel: 'Sign in with Facebook',
                onTap: () {},
              ),
              _SocialIconButton(
                iconData: Icons.alternate_email,
                color: Colors.lightBlue,
                semanticLabel: 'Sign in with Twitter',
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            const Text("Don’t have an Account? "),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, '/signup');
              },
              child: const Text(
                'sign up',
                style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            )
          ],
        )
      ],
    );

    Widget scaffoldBody;
    if (isMobile) {
      scaffoldBody = SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Center(child: loginFormContent),
      );
    } else if (isDesktop || isLargeDesktop) {
      scaffoldBody = Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: isDesktop ? 600 : 720),
          padding: const EdgeInsets.symmetric(vertical: 64),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
              child: loginFormContent,
            ),
          ),
        ),
      );
    } else {
      scaffoldBody = Center(child: loginFormContent);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: scaffoldBody,
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  final String semanticLabel;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.iconData,
    required this.color,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(iconData, color: color, size: 28),
        ),
      ),
    );
  }
}
