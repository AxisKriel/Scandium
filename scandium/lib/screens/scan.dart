import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:scandium/models/receipt.dart';
import 'package:scandium/screens/receipt/detail.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  final String title = 'Scan';

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  // SRC: https://pub.dev/packages/mobile_scanner
  var cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
  );

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      fit: BoxFit.cover,
      controller: cameraController,
      //scanWindow: const Rect.fromLTRB(300, 300, 300, 300),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        //final Uint8List? image = capture.image;
        for (final barcode in barcodes) {
          debugPrint('Barcode found! ${barcode.rawValue}');
          cameraController.stop();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ReceiptDetailView(
                    receipt: Receipt.fromString(barcode.rawValue ?? '')),
              )).then(
            (value) {
              cameraController.start();
            },
          );
          return;
        }
      },
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Mobile Scanner'),
    //     actions: [
    //       IconButton(
    //         color: Colors.white,
    //         icon: ValueListenableBuilder(
    //           valueListenable: cameraController.torchState,
    //           builder: (context, state, child) {
    //             switch (state as TorchState) {
    //               case TorchState.off:
    //                 return const Icon(Icons.flash_off, color: Colors.grey);
    //               case TorchState.on:
    //                 return const Icon(Icons.flash_on, color: Colors.yellow);
    //             }
    //           },
    //         ),
    //         iconSize: 32.0,
    //         onPressed: () => cameraController.toggleTorch(),
    //       ),
    //       IconButton(
    //         color: Colors.white,
    //         icon: ValueListenableBuilder(
    //           valueListenable: cameraController.cameraFacingState,
    //           builder: (context, state, child) {
    //             switch (state as CameraFacing) {
    //               case CameraFacing.front:
    //                 return const Icon(Icons.camera_front);
    //               case CameraFacing.back:
    //                 return const Icon(Icons.camera_rear);
    //             }
    //           },
    //         ),
    //         iconSize: 32.0,
    //         onPressed: () => cameraController.switchCamera(),
    //       ),
    //     ],
    //   ),
    //   body: MobileScanner(
    //     // fit: BoxFit.contain,
    //     controller: cameraController,
    //     onDetect: (capture) {
    //       final List<Barcode> barcodes = capture.barcodes;
    //       final Uint8List? image = capture.image;
    //       for (final barcode in barcodes) {
    //         debugPrint('Barcode found! ${barcode.rawValue}');
    //       }
    //     },
    //   ),
    // );
  }
}
