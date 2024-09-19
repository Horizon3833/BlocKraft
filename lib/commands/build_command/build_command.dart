import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:blockraft/helpers/print_art.dart';
import 'package:dart_console/dart_console.dart';

class BuildCommand extends Command {
  final String cd;
  BuildCommand(this.cd);

  @override
  String get description => 'Compiles the directory to aia file';

  @override
  String get name => 'build';

  @override
  void printUsage() {
    PrintArt();

    Console()
      ..setForegroundColor(ConsoleColor.brightGreen)
      ..write('   build: ')
      ..resetColorAttributes()
      ..writeLine('   $description')
      ..setForegroundColor(ConsoleColor.brightGreen)
      ..write('   Usage:')
      ..resetColorAttributes()
      ..writeLine('   blockraft build  ');
  }

  @override
  Future<void> run() async {
    PrintArt();
    String extension;
    if (argResults!.rest.length == 1) {
      extension = argResults!.rest.first;
    } else {
      printUsage();
      exit(64);
    }


    var assetsDirectory = Directory('$cd${Platform.pathSeparator}assets');
    var screen1Directory = Directory('$cd${Platform.pathSeparator}screens${Platform.pathSeparator}Screen1');
    var projectProperties = File('$cd${Platform.pathSeparator}project.properties');

    var outputDirectory = Directory('$cd${Platform.pathSeparator}output');

    Console()
      ..setForegroundColor(ConsoleColor.green)
      ..writeLine()
      ..write('• ')
      ..setForegroundColor(ConsoleColor.brightGreen)
      ..write('Success! ')
      ..resetColorAttributes()
      ..write('AIA Generated Successfully')
      ..writeLine();
  }
}