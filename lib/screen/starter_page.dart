import 'package:flutter/material.dart';
import 'package:flutter_ui_concept_delivery_app/animation/fade_animation.dart';
import 'package:flutter_ui_concept_delivery_app/screen/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key, required String title});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  VideoPlayerController? _controller;

  final bool _textVisible = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 25.0,
    ).animate(_animationController);
    _controller =
        VideoPlayerController.asset("assets/images/background_video_cut.mp4")
          ..initialize().then((_) {
            _controller?.play();
            _controller?.setLooping(true);
            setState(() {});
          });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _onTap() {
    setState(() => _textVisible != _textVisible);
    _animationController.forward().then(
          (f) => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: const HomePage(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller?.value.size.width,
                height: _controller?.value.size.height,
                child: VideoPlayer(_controller!),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2)
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const FadeAnimation(
                    .5,
                    Text(
                      "TexaS GrillZ best grill 🔥🔥",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FadeAnimation(
                    1,
                    Text(
                      "Services disponibles: Repas sur place · Drive disponible · Livraison sans contact",
                      style: TextStyle(
                        color: Colors.white,
                        height: 1.4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  FadeAnimation(
                    1.2,
                    ScaleTransition(
                      scale: _animation,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 119, 3, 3),
                              Color.fromARGB(255, 5, 3, 0),
                            ],
                          ),
                        ),
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 50),
                          child: MaterialButton(
                            onPressed: () => _onTap(),
                            minWidth: double.infinity,
                            height: 60,
                            child: const Text(
                              'Demarrer',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  FadeAnimation(
                    1.4,
                    AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text(
                          "Services disponibles 24/7",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
