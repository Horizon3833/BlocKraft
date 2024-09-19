import 'package:blockraft/file_templates/scm_content.dart';
import 'package:yaml/yaml.dart';
import 'dart:io';

class ParsingYaml {
  final File file;
  final Directory cd;
  final String appName;

  ParsingYaml(this.file, this.cd, this.appName);

  // Function to load and parse blockraft.yaml
  Future<Map<String, dynamic>> loadConfig() async {
    try {
      final yamlString = await file.readAsString();
      final yamlMap = loadYaml(yamlString);
      print(yamlMap);
      return yamlMap;
    } catch (e) {
      print('Error loading config: $e');
      rethrow;
    }
  }

  // Function to create Screens based on config
  void createScreens(Map<String, dynamic> config) {
    final screens = config['screens']['include'] as List;
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
  void handleExtensions(Map<String, dynamic> config) {
    final enabledExtensions = config['extensions']['enabled'] as Map;
    for (var ext in enabledExtensions.keys) {
      // Logic to include or activate the extension
      // Add error handling if necessary
    }
  }
}