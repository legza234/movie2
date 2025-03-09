
import 'package:flutter/material.dart';
import 'package:movie/ui/screens/login/constom_clipper.dart';


import '../../../utils/image.dart';

class LoginScreen extends StatefulWidget {
  final Function(String) changeLanguage; // استقبل الدالة لتغيير اللغة
  static const routeName = "/LoginScreen";
  const LoginScreen({Key? key, required this.changeLanguage}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  String selectedLanguage = "ar";

  get AnimatedToggleSwitch => null; // اللغة الافتراضية

  @override
  Widget build(BuildContext context) {
    var AppLocalizations;
    final localizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Image.asset(
                Appimages.loginimage,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              const SizedBox(height: 24),

              /// 🟢 حقل البريد الإلكتروني
              TextFormField(
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
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.purple),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.yellow),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              /// 🟢 حقل كلمة المرور
              Stack(
                children: [
                  ClipPath(
                    clipper: PasswordClipper(isObscure: isObscure),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isObscure ? Colors.grey[900] : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  TextFormField(
                    obscureText: isObscure,
                    style: TextStyle(
                      color: isObscure ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon: Icon(Icons.lock,
                          color: isObscure ? Colors.white : Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility_off : Icons.visibility,
                          color: isObscure ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              /// 🟢 زر "نسيت كلمة المرور"
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

              /// 🟢 زر تسجيل الدخول
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
                  onPressed: () {},
                  child: Text(localizations.login,
                      style: const TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 24),

              /// 🟢 لا تملك حسابًا؟ سجل الآن
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    localizations.noAccount,
                    style: const TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      localizations.signup,
                      style: const TextStyle(color: Colors.yellow),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              /// 🟢 Divider مع "أو"
              Row(
                children: [
                  const Expanded(child: Divider(color: Colors.yellow)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      localizations.or,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: Colors.yellow),
                    ),
                  ),
                  const Expanded(child: Divider(color: Colors.yellow)),
                ],
              ),
              const SizedBox(height: 14),

              /// 🟢 زر تسجيل الدخول باستخدام Google
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // تنفيذ تسجيل الدخول باستخدام Google هنا
                  },
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
                        'assets/images/google.png', // أيقونة جوجل
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Login With Google",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              /// 🟢 زر تبديل اللغة
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(localizations.language,
                      style: Theme.of(context).textTheme.labelLarge),
                  AnimatedToggleSwitch.rolling(
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
                      widget.changeLanguage(value); // تغيير اللغة هنا
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
