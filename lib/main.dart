import 'package:dalel_f/translations/codegen_loader.g.dart';
import 'package:dalel_f/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      assetLoader: const CodegenLoader(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}

const List<Map<String, dynamic>> sliders = [
  {
    "id": 33,
    "image":
        "https://dalell.online/public/images/sliders/27-03-221648396102516361728.png"
  },
  {
    "id": 34,
    "image":
        "https://dalell.online/public/images/sliders/27-03-2216483961181617592080.png"
  }
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.menu,color: Colors.white,size: 16,),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10),
          ),
        ),
        backgroundColor: const Color(0xFFFFEEE3),
        title: Text(
          LocaleKeys.main.tr(),
          style: const TextStyle(
            color: Color(0xFFFF6464),
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            height: 160,
            margin: const EdgeInsets.all(16),
            child: Swiper(
              autoplay: true,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    sliders[index]['image'],
                    fit: BoxFit.fill,
                  ),
                );
              },
              itemCount: sliders.length,
              pagination: SwiperPagination(
                margin: EdgeInsets.zero,
                builder: SwiperCustomPagination(builder: (context, config) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: const DotSwiperPaginationBuilder(
                            color: Color(0xFFFFAA76),
                            activeColor: Color(0xFFFF6464),
                            size: 10.0,
                            activeSize: 10.0,
                          ).build(context, config),
                        ),
                      )
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
