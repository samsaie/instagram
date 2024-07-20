import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode controller1 = FocusNode();
  FocusNode controller2 = FocusNode();

  @override
  void initState() {
    super.initState();
    controller1.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(50, 58, 153, 1),
            Color.fromRGBO(249, 139, 252, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      top: 80,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Image.asset('assets/images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: _getContainerBoxItems(),
          ),
        ),
      ],
    );
  }

  Widget _getContainerBoxItems() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Sign in to ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20)),
              Image.asset('assets/images/mood.png')
            ],
          ),
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: TextField(
              focusNode: controller1,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontFamily: 'gm',
                  fontSize: 20,
                  color: controller1.hasFocus
                      ? Color(0xffF35383)
                      : Color(0xffC5C5C5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffC5C5C5),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF35383),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 44),
            child: TextField(
              focusNode: controller2,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontFamily: 'gm',
                  fontSize: 20,
                  color: controller1.hasFocus
                      ? Color(0xffC5C5C5)
                      : Color(0xffF35383),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffC5C5C5),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffF35383),
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          SizedBox(
            height: 46,
            width: 129,
            child: ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {},
              child: Text(
                'Sign In',
              ),
            ),
          ),
          SizedBox(
            height: 34,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Don\'t have an account ? / ',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              Text(
                'Sign up',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }
}
