
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_epub/Model/book_progress_model.dart';
import 'package:hive_epub/hive_epub.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializer and methods return a bool
  var initialized = await HiveEpub.initialize();

  if (initialized) {
    // Use BookProgressModel model instance anywhere in your app to access current book progress of specific book
    BookProgressModel bookProgress = HiveEpub.getBookProgress('bookId');
    await HiveEpub.setCurrentPageIndex('bookId', 1);
    await HiveEpub.setCurrentChapterIndex('bookId', 2);
    await HiveEpub.deleteBookProgress('bookId');
    await HiveEpub.deleteAllBooksProgress();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Epub Reader Plugin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),

        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> readerFuture = Future.value(true);
  Future<void> readerFuture2 = Future.value(true);

  Future<void> _openEpubReader(BuildContext context) async {
    await HiveEpub.openAssetBook(
        assetPath: 'assets/Bimaner-notun-dada-hemendrakumar-roy.epub',
        context: context,
        bookId: '3',
        onPageFlip: (int currentPage, int totalPages) {
          print("Current page: $currentPage, Total pages: $totalPages");
        },
        onLastPage: (int lastPageIndex) {
          print('We arrived to the last widget');
        },
        lockedChapters: [4, 5, 6, 7, 8, 9, 10] // Lock all chapters except 1 and 2
    );
  }

  Future<void> _openEnglishEpub(BuildContext context) async {
    await HiveEpub.openAssetBook(
        assetPath: 'assets/test.epub',
        context: context,
        bookId: '4',
        onPageFlip: (int currentPage, int totalPages) {
          print("Current page: $currentPage, Total pages: $totalPages");
        },
        onLastPage: (int lastPageIndex) {
          print('We arrived to the last widget');
        },
        lockedChapters: [2,5, 6, 8, 9, 10,11,12,13,15,16,17,14,18,19,20,21] // Lock all chapters except 1 and 2
    );
  }


  lateFuture() {
    setState(() {
      readerFuture = _openEpubReader(context);
    });
  }

  lateFuture2() {
    setState(() {
      readerFuture2 = _openEnglishEpub(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Epub Reader Plugin'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Book Cover
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Demo Epub Book', style: TextStyle(fontSize: 15)),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  lateFuture();
                },
                child: FutureBuilder(
                    future: readerFuture,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          {
                            // While waiting for the future to complete, display a loading indicator.
                            return const CupertinoActivityIndicator(
                              radius: 15,
                              color: Colors.black, // Adjust the radius as needed
                            );
                          }
                        default:
                          // By default, show the button text
                          return SizedBox(
                            width: 150,
                            height: 150,
                            child: Image.asset('assets/images.jpeg'),
                          );
                      }
                    }
                )
              ),
              GestureDetector(
                  onTap: (){
                    lateFuture2();
                  },
                  child: FutureBuilder(
                      future: readerFuture2,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            {
                              // While waiting for the future to complete, display a loading indicator.
                              return const CupertinoActivityIndicator(
                                radius: 15,
                                color: Colors.black, // Adjust the radius as needed
                              );
                            }
                          default:
                          // By default, show the button text
                            return SizedBox(
                              width: 150,
                              height: 150,
                              child: Image.asset('assets/inspiredenglish-1.png'),
                            );
                        }
                      }
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
