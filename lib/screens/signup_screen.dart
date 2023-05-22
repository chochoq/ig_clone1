import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone1/utils/colors.dart';

import '../widgets/text_input_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
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
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://i.namu.wiki/i/dCL-OS32JA72jv0mVO82QChaB0wuPYfaKiEnTZwjaHTI8Tv_uiqINss3Jb0D-Ax2Jq3MPCPF_6dBY1LOkCeq3w.webp'),
                  ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo_rounded, color: blueColor),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              TextInputField(
                hintText: '사용자 이름',
                textEditingController: _pwController,
                textInputType: TextInputType.text,
                isPw: true,
              ),
              const SizedBox(height: 24),
              TextInputField(
                hintText: '이메일',
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
              const SizedBox(height: 24),
              TextInputField(
                hintText: '바이오',
                textEditingController: _pwController,
                textInputType: TextInputType.text,
                isPw: true,
              ),
              //비밀버호를 잊으셨나요?
              const SizedBox(height: 24),
              InkWell(
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
                onTap: () {},
              ),
              const SizedBox(height: 12),
              //또는
              //소셜로그인
              Flexible(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
