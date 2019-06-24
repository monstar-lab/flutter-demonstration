import 'package:flutter_livecoding/utils/assets.dart' as Assets;

const exampleData = <ExampleDataType>[
  ExampleDataType(
    name: 'きつね',
    assetPath: Assets.ASSET_FOX_IMAGE_QUARTER,
  ),
];

class ExampleDataType {
  final String name;
  final String assetPath;

  const ExampleDataType({
    this.name,
    this.assetPath,
  });
}
