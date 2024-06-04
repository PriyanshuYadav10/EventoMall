import '/Screens/auth/login.dart';
import '/provider/auth_provider.dart';
import '/provider/dashboard_provider.dart';
import '/provider/home_provider.dart';
import '/provider/profile_provider.dart';
import '/util/color_resources.dart';
import '/util/images.dart';
import '/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:ColorResources.appColor,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => di.sl<AuthProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<DashboardProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<HomeProvider>()),
    ChangeNotifierProvider(create: (context) => di.sl<ProfileProvider>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      builder: (context, child) {
        // Wrap the child with MediaQuery
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(0.9),
          ),
          child: child!,
        );
      },
      theme: ThemeData(
        textTheme: GoogleFonts.lexendTextTheme(),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with SingleTickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.ease,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const LoginScreen()));
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        decoration: const BoxDecoration(
          gradient: GradientResources.gradientColor1
        ),
        child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return Transform.scale(scale: _animation.value, child: child);
            },
            child: Image.asset(Images.logo)),
    );
  }
}
