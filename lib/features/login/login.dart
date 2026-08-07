import 'package:easy_localization/easy_localization.dart';
import 'package:evently/core/widgets/auth_redirect_text.dart';
import 'package:evently/core/widgets/custom_elevated_button.dart';
import 'package:evently/core/widgets/custom_text_form_field.dart';
import 'package:evently/core/widgets/or_divider.dart';
import 'package:evently/features/forget_password/forget_password_screen.dart';
import 'package:evently/features/home/home_screen.dart';
import 'package:evently/features/register/register_screen.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset("assets/images/logo.png"),
                SizedBox(height: 48),
                Text(
                  "login_title".tr(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: provider.colors.primaryColor(),
                    fontSize: 24,
                  ),
                ),

                SizedBox(height: 24),

                CustomTextFormField(
                  hintText: "email_hint".tr(),
                  prefixIcon: Image.asset("assets/images/sms.png"),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: "password_hint".tr(),
                  prefixIcon: Image.asset("assets/images/lock.png"),
                  isPassword: true,
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    "forget_password_question".tr(),
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: provider.colors.primaryColor(),
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 48),

                CustomElevatedButton(
                  text: "login".tr(),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (r) => false,
                    );
                  },
                ),

                SizedBox(height: 48),

                AuthRedirectText(
                  message: "no_account".tr(),
                  actionText: "sign_up".tr(),
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                ),

                SizedBox(height: 32),

                OrDivider(),

                SizedBox(height: 18),

                CustomElevatedButton(
                  text: "login_google".tr(),
                  backgroundColor: Colors.white,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                  icon: Image.asset("assets/images/image 6.png"),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      HomeScreen.routeName,
                      (r) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
