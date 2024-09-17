import 'package:args/command_runner.dart';
import 'package:dart_console/dart_console.dart';

class AssetsCommand extends Command{
    @override
    String get name => 'assets';

    @override
    String get description => 'Operations on Assets';

      @override
        void printUsage() {
            PrintArt();

                Console()
                      ..setForegroundColor(ConsoleColor.brightGreen)
                            ..write('   assets: ')
                                  ..resetColorAttributes()
                                        ..writeLine('   $description')
                                              ..setForegroundColor(ConsoleColor.brightGreen)
                                                    ..write('   Usage:')
                                                          ..resetColorAttributes()
                                                                ..writeLine('   blockraft assets  ');
        }

    }