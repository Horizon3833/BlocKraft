import 'package:blockraft/file_templates/scm_content.dart';
import 'package:yaml/yaml.dart';
import 'dart:io';

class ParsingYaml {
  final Directory cd;

  ParsingYaml(this.cd);

  // Function to load and parse blockraft.yaml
  Future<YamlMap> loadConfig(File file) async{
    try {
      final yamlString = await file.readAsString();
      final yamlMap = loadYaml(yamlString);
      return yamlMap;
    } catch (e) {
      print('Error loading config: $e');
      rethrow;
    }
  }

  // Function to create Screens based on config
  void createScreens(YamlMap config) {
    final screens = config['screens']['include'];
    final appName = config['project']['name'].toString();
    for (var screen in screens) {
      try {
        final screenFile = File('${cd.path}/screens/$screen/$screen.scm')..createSync(recursive: true);
        screenFile.writeAsString(ScmContent(screen, appName).content);
      } catch (e) {
        print('Error creating screen $screen: $e');
      }
    }
  }

  // Function to handle extensions based on config
  void handleExtensions(YamlMap config) {
    final enabledExtensions = config['extensions']['enabled'];
    if (enabledExtensions != null) {
      for (var ext in enabledExtensions.keys) {
        // Logic to include or activate the extension
      }
    }
  }
}