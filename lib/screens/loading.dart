import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key, required this.child, required this.isLoading}) : super(key: key);
  final Widget child;
  final bool isLoading;
  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.isLoading)
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.black38),
            child: Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                height: 60,
                width: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: const CircularProgressIndicator(),
              ),
            ),
          )
      ],
    );
  }
}
