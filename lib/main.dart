// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show IFrameElement;

import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'IFrameElement bug demo',
      home: IFrameElementScreen(),
    );
  }
}

class IFrameElementScreen extends StatefulWidget {
  const IFrameElementScreen({super.key});

  @override
  State<IFrameElementScreen> createState() => _IFrameElementState();
}

class _IFrameElementState extends State<IFrameElementScreen> {
  final _iframeElement = IFrameElement();
  late Widget _iframeWidget;

  @override
  void initState() {
    super.initState();

    _iframeElement.src =
        'https://www.youtube.com/embed/RwP-ZfWV5TQ?si=wWETfSHEiJ0yoKaS';
    final viewType = '$this#$hashCode';
    ui.platformViewRegistry
        .registerViewFactory(viewType, (_) => _iframeElement);
    _iframeWidget = HtmlElementView(viewType: viewType);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('IFrameElement'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Aenean eu dolor laoreet, fringilla ligula at, semper dui. '
                  'Sed auctor nisi a augue efficitur, a bibendum magna tincidunt. '
                  'Sed sit amet elit vel orci mattis suscipit. '
                  'Phasellus consectetur, tellus non mollis iaculis, arcu leo aliquam libero, a vestibulum ante dui ac risus. '
                  'Sed vitae sollicitudin ante. Praesent commodo accumsan nulla, ut ultrices nisl bibendum a. '
                  'Duis eget orci odio. Vestibulum convallis libero sit amet sem rutrum consequat. '
                  'Donec tincidunt venenatis sodales. In hac habitasse platea dictumst. '
                  'Nunc faucibus rutrum quam vel porttitor. Duis egestas dictum odio, sit amet congue nisi placerat ac. '
                  'Duis ut eros vehicula, euismod dolor vel, accumsan enim. Vivamus vitae fringilla eros, vel eleifend urna. '
                  'Aliquam at tellus ultricies, imperdiet odio semper, volutpat orci. '
                  'Vestibulum nulla dui, rutrum in dictum eu, mattis vitae justo.\n',
                ),
                AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  child: _iframeWidget,
                ),
                const Text(
                  '\nDonec vitae interdum elit, sed euismod urna. Donec eu blandit augue. '
                  'Integer vitae est sit amet lectus pretium dignissim. '
                  'Sed dapibus semper mauris, sit amet tempor dui congue et. '
                  'Pellentesque accumsan gravida nibh. Integer sit amet tempus magna. '
                  'Sed convallis et augue a imperdiet. Suspendisse cursus neque sed rutrum volutpat. '
                  'Aliquam pellentesque ullamcorper massa vitae faucibus.',
                ),
              ],
            ),
          ),
        ),
      );
}
