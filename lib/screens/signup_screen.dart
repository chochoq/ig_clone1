import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ig_clone1/resources/auth_methods.dart';
import 'package:ig_clone1/utils/colors.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _pwController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _pwController.text,
        username: _userNameController.text,
        bio: _bioController.text,
        file: _image!);

    if (!mounted) return;
    if (res != '성공') {
      showSnackbar(res, context);
    }
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
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                          ),
                        ),
                  Positioned(
                    bottom: -5,
                    right: -5,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo_rounded, color: Colors.white),
                      onPressed: () => selectImage(),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              TextInputField(
                hintText: '사용자 이름',
                textEditingController: _userNameController,
                textInputType: TextInputType.name,
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
                textEditingController: _bioController,
                textInputType: TextInputType.text,
              ),
              //비밀버호를 잊으셨나요?
              const SizedBox(height: 24),
              InkWell(
                  onTap: signUpUser,
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
                  )),
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
