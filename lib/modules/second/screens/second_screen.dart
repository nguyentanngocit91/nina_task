import 'package:flutter/material.dart';
import '/constants/app_fonts.dart';
import '/utils/helpers/device_info.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Map<String, dynamic> _deviceData = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  _getDeviceInfo() async {
    dynamic deviceData = await DeviceInfo.readDeviceInfo();
    setState(() {
      _deviceData = deviceData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _deviceData['name'] ?? 'Device Info',
          style: TextStyle(
              fontFamily: AppFonts.robotoSlab, fontWeight: FontWeight.w900),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: _deviceData.length,
            itemBuilder: (BuildContext context, int index) {
              String key = _deviceData.keys.elementAt(index);
              return Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: Text(
                      '${_deviceData[key]}',
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
                ],
              );
            }),
      ),
    );
  }
}
