import 'package:flutter/material.dart';
import 'package:movie/utils/image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // ✅ إضافة استيراد AppLocalizations
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) changeLanguage;
  static const routeName = "/LoginScreen";
  const LoginScreen({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isObscure = true;
  String selectedLanguage = "ar";

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                Image.asset(
                  Appimages.loginimage,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                const SizedBox(height: 24),

                /// حقل البريد الإلكتروني
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    hintText: localizations.emailHint,
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return localizations.emailRequired; // ✅ التحقق من البريد
                    }
                    if (!validateEmail(value.trim())) {
                      return localizations.invalidEmail; // ✅ التأكد من التنسيق الصحيح
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),

                /// حقل كلمة المرور
                TextFormField(
                  controller: passwordController,
                  obscureText: isObscure,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock, color: Colors.white),
                    hintText: localizations.passwordHint,
                    hintStyle: const TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[900],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(color: Colors.purple),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return localizations.passwordRequired;
                    } else if (value.length < 6) {
                      return localizations.shortPassword;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                /// زر "نسيت كلمة المرور"
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/ForgetPasswordScreen");
                      },
                      child: Text(localizations.forgetPassword,
                          style: const TextStyle(color: Colors.yellow)),
                    )
                  ],
                ),

                /// زر تسجيل الدخول
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        clickLogin();
                      }
                    },
                    child: Text(localizations.login,
                        style: const TextStyle(color: Colors.black, fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 24),

                /// زر تسجيل الدخول باستخدام Google
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Login With Google",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                /// زر تبديل اللغة
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedToggleSwitch.size(
                      current: selectedLanguage,
                      values: ["ar", "en"],
                      iconBuilder: (value, foreground) {
                        return CircleAvatar(
                          backgroundImage: AssetImage(
                              value == "ar" ? Appimages.ar : Appimages.eng),
                          backgroundColor: Colors.black,
                        );
                      },
                      onChanged: (value) {
                        setState(() {
                          selectedLanguage = value;
                        });
                        widget.changeLanguage(value);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clickLogin() {
    if (!formKey.currentState!.validate()) {
      return;
    }
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  bool validateEmail(String email) {
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email.trim());
  }
}