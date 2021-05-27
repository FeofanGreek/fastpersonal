import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';
import 'launchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: launchScreen(),
    );
  }
}


String Url = 'https://fastpersonal.ru/';
bool outApp = false;


//WebViewController _myController;

var counter = 1;

class PlayWithComputer extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

callClient(url) async {
  if (await canLaunch('$url')) {
    await launch('$url');
  } else {
    throw 'Невозможно набрать номер $url';
  }
  print('пробуем позвонить');
}

class _HomePageState extends State<PlayWithComputer> {
  Map _source = {ConnectivityResult.none: false};
  MyConnectivity _connectivity = MyConnectivity.instance;





  late Timer timer;

  @override
  void initState() {
    WebViewController _myController;
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      if (mounted) {setState(() => _source = source);}
      print("добавляем листенер");
    });

    timer = new Timer.periodic(Duration(seconds: 10), (timer) {

    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    String string = "";
    switch (_source.keys.toList()[0]) {
      case ConnectivityResult.none:
        string = "Отсутсвует связь!";
        return Scaffold(
          backgroundColor: Color.fromRGBO(250, 218, 24, 1.0),
          body: Container(
            height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
                        ),
                        //Text('Облачный атлас', style: TextStyle(fontSize: 22,)),
                        Container(
                          height: 153, width: 153,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/logo.png"),
                                fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                            ),
                          ),),
                        LinearProgressIndicator()
                      ]),

                ]),
          ),
        );
        //break;
      case ConnectivityResult.mobile:
        string = "Мобильные данные";
        return /*WebviewScaffold(
          url: Url,
          clearCache: false, clearCookies: false, mediaPlaybackRequiresUserGesture: true,
          withLocalStorage: true,
          appCacheEnabled: true,
          withJavascript: true,
          primary: true,
          //hidden: true,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(0.0), // here the desired height
              child: AppBar(backgroundColor: Color.fromRGBO(250, 218, 24, 1.0) ,)),
          initialChild:Container(
            height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
                children: <Widget>[
                  Column(
                      children: <Widget>[
                        SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
                        ),
                        //Text('Облачный атлас', style: TextStyle(fontSize: 22,)),
                        Container(
                          height: 153, width: 153,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/logo.png"),
                                fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                            ),
                          ),),
                        LinearProgressIndicator()
                      ]),

                ]),
          ),
            invalidUrlRegex:'https://fastpersonal.ru/' ,
        );*/
        Scaffold(
          backgroundColor: Color.fromRGBO(250, 218, 24, 1.0),
          extendBody: true,
          body: MyWebView(selectedUrl: Url),
        );
        //break;
      case ConnectivityResult.wifi:
        string = "Подключено к WiFi";
        return /*WebviewScaffold(
          url: Url,
          withLocalUrl:true,
          clearCache: false, clearCookies: false, mediaPlaybackRequiresUserGesture: true,
          withLocalStorage: true,
          appCacheEnabled: true,
            withJavascript: true,
            primary: true,
            //hidden: true,

          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.0), // here the desired height
            child: AppBar(backgroundColor: Color.fromRGBO(250, 218, 24, 1.0) ,)),
            initialChild:Container(
              height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                  children: <Widget>[
                    Column(
                        children: <Widget>[
                          SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
                          ),
                          //Text('Облачный атлас', style: TextStyle(fontSize: 22,)),
                          Container(
                            height: 153, width: 153,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/logo.png"),
                                  fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                              ),
                            ),),
                          LinearProgressIndicator()
                        ]),

                  ]),
            ),*/
          Scaffold(
          backgroundColor: Color.fromRGBO(250, 218, 24, 1.0),
          extendBody: true,
          body: MyWebView(selectedUrl: Url),
        );
        //break;
    }
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 218, 24, 1.0),
      body: Container(
        height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: <Widget>[
              Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height / 3, width: MediaQuery.of(context).size.width,
                    ),
                    //Text('Облачный атлас', style: TextStyle(fontSize: 22,)),
                    Container(
                      height: 153, width: 153,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                            fit:BoxFit.fitWidth, alignment: Alignment(0.0, 0.0)
                        ),
                      ),),
                    LinearProgressIndicator()
                  ]),

            ]),
      ),
    );
  }

  @override
  void dispose() {
    //_connectivity.disposeStream();
    timer.cancel();
    super.dispose();
  }
}


//запускаем сайт
class MyConnectivity {
  MyConnectivity._internal();
  static final MyConnectivity _instance = MyConnectivity._internal();
  static MyConnectivity get instance => _instance;
  Connectivity connectivity = Connectivity();
  StreamController controller = StreamController.broadcast();
  Stream get myStream => controller.stream;

  void initialise() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  void _checkStatus(ConnectivityResult result) async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('https://fastpersonal.ru/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isOnline = true;
      } else
        isOnline = false;
    } on SocketException catch (_) {
      isOnline = false;
    }
    controller.sink.add({result: isOnline});
  }

  void disposeStream() => controller.close();
}

class MyWebView extends StatelessWidget {

  String selectedUrl;
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  MyWebView({
    required this.selectedUrl,
  });

  //создаем тело виджета
  @override
  Widget build(BuildContext context) {
    return WebView(
        initialUrl: selectedUrl,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
          //_myController = webViewController;
        },
        onPageFinished: (url){
        },

    onWebResourceError: (value){
          print('Ошибка загрузки ${value.failingUrl}'); //если андроид
          List<String> result;
          String result22;
          if (Platform.isAndroid){result22 = value.failingUrl.toString();
            if (result22.contains('tel')) {
            var result2 = '+' +
            result22.split(':')[1].replaceAll('%C2%A0', '');
            callClient('tel:' + result2);
            } else if (result22.contains('mailto')) {
            var result2 = result22.split(':')[1];
            callClient('mailto:' + result2);
            } else if (result22.contains('whatsapp')) {

                print('sorry');

            }
          } else {
            result = value.description.split(',');
            print(result[2]);
            if (result[2].contains('tel')) {
              var result2 = '+' +
                  result[2].split(':')[1].replaceAll('%C2%A0', '');
              callClient('tel:' + result2);
            } else if (result[2].contains('mailto')) {
              var result2 = result[2].split(':')[1];
              callClient('mailto:' + result2);
            } else if (result[2].contains('whatsapp')) {

                print('sorry');

            }
          }
          Navigator.pushReplacement (context,
              MaterialPageRoute(builder: (context) => PlayWithComputer()));
    },
    );
  }

}
