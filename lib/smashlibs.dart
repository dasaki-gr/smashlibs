library smashlibs;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:after_layout/after_layout.dart';
import 'package:dart_hydrologis_db/dart_hydrologis_db.dart';
import 'package:dart_hydrologis_utils/dart_hydrologis_utils.dart' as HU;
import 'package:dart_jts/dart_jts.dart' as JTS;
import 'package:device_info_plus/device_info_plus.dart'
    if (dart.library.html) 'web_stubs.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:flutter_tags_x/flutter_tags_x.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_ex/path_provider_ex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:proj4dart/proj4dart.dart';
import 'package:flutter_screen_wake/flutter_screen_wake.dart';
import 'package:share_extend/share_extend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smashlibs/smash/flutterlibs/utils/logging.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wkt_parser/wkt_parser.dart' as wkt_parser;

part 'smash/dartlibs/dartlibs.dart';
part 'smash/flutterlibs/camera/camera.dart';
// part 'com/hydrologis/flutterlibs/gps/gps.dart';
part 'smash/flutterlibs/filesystem/filemanagement.dart';
part 'smash/flutterlibs/filesystem/workspace.dart';
part 'smash/flutterlibs/forms/forms.dart';
part 'smash/flutterlibs/forms/forms_widgets.dart';
part 'smash/flutterlibs/network/download_file_listtile.dart';
part 'smash/flutterlibs/network/download_file_progress.dart';
part 'smash/flutterlibs/network/network_helper.dart';
part 'smash/flutterlibs/theme/colors.dart';
part 'smash/flutterlibs/theme/icons.dart';
part 'smash/flutterlibs/theme/theme.dart';
part 'smash/flutterlibs/ui/dialogs.dart';
part 'smash/flutterlibs/ui/progress.dart';
part 'smash/flutterlibs/ui/sld.dart';
part 'smash/flutterlibs/ui/tables.dart';
part 'smash/flutterlibs/ui/ui.dart';
part 'smash/flutterlibs/utils/device.dart';
part 'smash/flutterlibs/utils/permissions.dart';
part 'smash/flutterlibs/utils/preferences.dart';
part 'smash/flutterlibs/utils/projection.dart';
part 'smash/flutterlibs/utils/screen.dart';
// part 'smash/flutterlibs/utils/notifier.dart';
part 'smash/flutterlibs/utils/share.dart';
part 'smash/flutterlibs/utils/validators.dart';
part 'smash/flutterlibs/projectdb/project_db.dart';
part 'smash/flutterlibs/projectdb/images.dart';
part 'smash/flutterlibs/projectdb/logs.dart';
part 'smash/flutterlibs/projectdb/notes.dart';
part 'smash/flutterlibs/projectdb/othertables.dart';
