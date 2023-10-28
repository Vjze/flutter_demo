import 'package:flutter_demo/pages/home_page.dart';
import 'package:flutter_demo/pages/query_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rinf/rinf.dart';
import 'package:flutter_demo/messages/query_resource.pb.dart' as queryResource;
import 'dart:io';
import 'package:flutter/services.dart';

void main() async {
  await Rinf.ensureInitialized();
  runApp(MyApp());
  if (Platform.isAndroid) {
    // 设置状态栏背景及颜色
    // SystemUiOverlayStyle systemUiOverlayStyle =
    //     SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    // SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: []); //隐藏状态栏
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Flutter_Damo',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  final input = TextEditingController();
  var result = [];
  var len = "";
  var title = <String>["盒号", "Sn", "料号", "工单", "操作员", "装盒时间"];
  void getresult() async {
    final requestMessage = queryResource.ReadRequest(
      inputString: input.text,
    );
    final rustRequest = RustRequest(
      resource: queryResource.ID,
      operation: RustOperation.Read,
      message: requestMessage.writeToBuffer(),
    );
    final rustResponse = await requestToRust(rustRequest);
    final responseMessage = queryResource.ReadResponse.fromBuffer(
      rustResponse.message!,
    );
    result = responseMessage.outputLists;
    len = result.length.toString();
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: SafeArea(
          child: constraints.maxWidth < 450
              ? Column(
                  children: [
                    Expanded(
                        child: MainArea(
                      selectedIndex: selectedIndex,
                    )),
                    BottomNavigationBar(
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_filled), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Query'),
                      ],
                      currentIndex: selectedIndex,
                      onTap: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ],
                )
              : Row(
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        const CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage("assets/images/logo.png"),
                        ),
                        Expanded(
                          child: NavigationRail(
                            groupAlignment: BorderSide.strokeAlignCenter,
                            destinations: const [
                              NavigationRailDestination(
                                  icon: Icon(Icons.home_filled),
                                  label: Text('Home')),
                              NavigationRailDestination(
                                  icon: Icon(Icons.search),
                                  label: Text('Query')),
                            ],
                            selectedIndex: selectedIndex,
                            onDestinationSelected: (int index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            extended: constraints.maxWidth > 1000,
                            useIndicator: true,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: MainArea(selectedIndex: selectedIndex),
                    ),
                  ],
                ),
        ),
      );
    });
  }
}

class MainArea extends StatelessWidget {
  const MainArea({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: selectedIndex == 0 ? HomePage() : QueryPage(),
    );
  }
}
