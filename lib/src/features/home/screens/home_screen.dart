import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vimigo/src/common_widgets/even_box.dart';
import 'package:vimigo/src/common_widgets/left_path.dart';
import 'package:vimigo/src/common_widgets/odd_box.dart';
import 'package:vimigo/src/common_widgets/right_path.dart';
import 'package:vimigo/src/features/home/providers/dropdown_value_provider.dart';
import 'package:vimigo/src/utils/app_preferences.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final list = [1, 2, 3, 4, 5];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dropdownValue = ref.watch(dropdownValueNotifierProvider);
    final currentLevel = ref.watch(appPreferencesProvider).getLevel() ?? 0;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 236, 243),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.4,
            right: MediaQuery.of(context).size.width * 0.4,
            top: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    margin: const EdgeInsets.only(
                      top: 10,
                      left: 15,
                      right: 15,
                    ),
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          value: dropdownValue,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          items: list.map<DropdownMenuItem<int>>((int value) {
                            return DropdownMenuItem<int>(
                              value: value,
                              child: SizedBox(
                                width: double.infinity,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text('Level $value'),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            ref.read(appPreferencesProvider).setLevel(value!);
                            ref
                                .read(dropdownValueNotifierProvider.notifier)
                                .state = value;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Flexible(
                    //replace your ListView containing widget here
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 40),
                          child: Center(
                            child: index.isEven
                                ? Stack(
                                    children: [
                                      OddBox(
                                        title: 'Level ${index + 1} content',
                                      ),
                                      Transform.translate(
                                        offset: const Offset(180, -15),
                                        child: SizedBox(
                                          height: 50,
                                          child: CustomPaint(
                                            painter: PathPainter(ref, index),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(180, 160),
                                        child: SizedBox(
                                          height: 50,
                                          child: CustomPaint(
                                            painter: PathPainter1(ref, index),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(305, 45),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: currentLevel > index
                                                  ? Colors.yellow
                                                  : Colors.white,
                                              width: 5,
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Tapped on level ${index + 1}',
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(),
                                                            child: const Text(
                                                                'Close'),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon: const Icon(Icons.hiking),
                                          ),
                                        ),
                                      ),
                                      if (index == 0) ...[
                                        Transform.translate(
                                          offset: const Offset(160, 148),
                                          child: const Icon(Icons.start),
                                        )
                                      ],
                                      if (index == 4) ...[
                                        Transform.translate(
                                          offset: const Offset(170, -37),
                                          child: const Icon(Icons.flag),
                                        )
                                      ],
                                    ],
                                  )
                                : Stack(
                                    children: [
                                      EvenBox(
                                        title: 'Level ${index + 1} content',
                                      ),
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..scale(-1.0, 1.0, 1.0)
                                          ..translate(0.0, -20, 0.0),
                                        origin: const Offset(90, 0),
                                        child: SizedBox(
                                          height: 50,
                                          child: CustomPaint(
                                            painter: PathPainter2(ref, index),
                                          ),
                                        ),
                                      ),
                                      Transform(
                                        transform: Matrix4.identity()
                                          ..scale(-1.0, 1.0, 1.0)
                                          ..translate(0.0, 165, 0.0),
                                        origin: const Offset(90, 0),
                                        child: SizedBox(
                                          height: 50,
                                          child: CustomPaint(
                                            painter: PathPainter3(ref, index),
                                          ),
                                        ),
                                      ),
                                      Transform.translate(
                                        offset: const Offset(20, 40),
                                        child: Container(
                                          width: 50,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: currentLevel > index
                                                  ? Colors.yellow
                                                  : Colors.white,
                                              width: 5,
                                            ),
                                          ),
                                          child: IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      color: Colors.white,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Tapped on level ${index + 1}',
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () =>
                                                                Navigator.of(
                                                                        context)
                                                                    .pop(),
                                                            child: const Text(
                                                                'Close'),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            icon: const Icon(Icons.hiking),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.09,
              left: 0,
              child: Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              ),
            )
          ],
        ),
      ),
    );
  }
}
