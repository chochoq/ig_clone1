import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone1/utils/colors.dart';
import 'package:ig_clone1/utils/utils.dart';

import '../resources/auth_methods.dart';
import '../widgets/text_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  bool _isLoding = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoding = true;
    });
    String res =
        await AuthMethods().loginUser(email: _emailController.text, password: _pwController.text);

    if (res == '성공') {
//
    } else {
//
      showSnackbar(res, context);
    }
    setState(() {
      _isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: Container()),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                height: 64,
              ),
              const SizedBox(height: 64),
              TextInputField(
                hintText: '전화번호, 사용자 이름 또는 이메일',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
              TextInputField(
                hintText: '비밀번호',
                textEditingController: _pwController,
                textInputType: TextInputType.text,
                isPw: true,
              ),
              //비밀버호를 잊으셨나요?
              const SizedBox(height: 24),
              InkWell(
                onTap: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      color: blueColor),
                  child: const Text('로그인'),
                ),
              ),
              const SizedBox(height: 12),
              //또는
              //소셜로그인
              Flexible(flex: 1, child: Container()),
              //계정이없나요?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('계정이 없으신가요?'),
                  const SizedBox(width: 5),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: const Text(
                        '가입하기',
                        style: TextStyle(color: blueColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
