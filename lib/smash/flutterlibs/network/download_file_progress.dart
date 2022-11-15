part of smashlibs;
/*
 * Copyright (c) 2019-2020. Antonello Andrea (www.hydrologis.com). All rights reserved.
 * Use of this source code is governed by a GPL3 license that can be
 * found in the LICENSE file.
 */

/// A simple circular progress with a progress string below.
///
/// Though for a simple full view visualization.
class DownloadCircularProgressWidget extends StatefulWidget {
  String _downloadUrl;
  String _destinationFilePath;

  DownloadCircularProgressWidget(this._downloadUrl, this._destinationFilePath);

  @override
  State<StatefulWidget> createState() {
    return DownloadCircularProgressWidgetState();
  }
}

class DownloadCircularProgressWidgetState
    extends State<DownloadCircularProgressWidget> {
  bool _downloading = false;
  String _progressString = "";

  @override
  void initState() {
    super.initState();

    downloadFile();
  }

  Future<void> downloadFile() async {
    Dio dio = Dio();

    try {
      await dio.download(widget._downloadUrl, widget._destinationFilePath,
          onReceiveProgress: (rec, total) {
        setState(() {
          _downloading = true;
          _progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });

//      File f = File(widget._destinationFilePath);
//      if (f.existsSync()) {
//        TileSource ts = TileSource.Mapsforge(f.path);
//        LayerManager().addLayer(ts);
//      }
    } on Exception catch (e, s) {
      SMLogger().e(
          "An error occurred while downloading from: ${widget._downloadUrl}",
          e,
          s);
    }

    setState(() {
      _downloading = false;
      _progressString = "Completed";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: _downloading
            ? Container(
                height: 120,
                width: 200,
                child: Card(
                  color: SmashColors.mainBackground,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SmashCircularProgress(
                          label: "Downloading file: $_progressString"),
                    ],
                  ),
                ),
              )
            : SmashUI.normalText("Not downloading."));
  }
}
