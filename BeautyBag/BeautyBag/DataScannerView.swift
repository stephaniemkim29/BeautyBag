//
//  DataScannerView.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

//import Foundation
//import SwiftUI
//import VisionKit
//
//struct DataScannerView: UIViewControllerRepresentable {
//    
//    @Binding var recognizedItems: [RecognizedItem]
//    
//    let recognizedDataType: DataScannerViewController.RecognizedDataType
//    let recognizesMultipleItems: Bool
//    var viewModel: ViewModel
//    
//    func makeUIViewController(context: Context) -> DataScannerViewController {
//        
//        let vc = DataScannerViewController(recognizedDataTypes: [recognizedDataType],
//                                           qualityLevel: .balanced,
//                                           recognizesMultipleItems: recognizesMultipleItems,
//                                           isGuidanceEnabled: true, isHighlightingEnabled: true)
//        vc.delegate = context.coordinator
//        return vc
//    }
//    
//    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
//        uiViewController.delegate = context.coordinator
//        try? uiViewController.startScanning()
//    }
//    func makeCoordinator() -> Coordinator {
//        Coordinator(recognizedItems: $recognizedItems, viewModel: viewModel)
//    }
//    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
//        uiViewController.stopScanning()
//    }
//}
//    
//class Coordinator: NSObject, DataScannerViewControllerDelegate {
//    @Binding var recognizedItems: [RecognizedItem]
//    var viewModel: ViewModel
//    
//    init(recognizedItems: Binding<[RecognizedItem]>, viewModel: ViewModel) {
//        self._recognizedItems = recognizedItems
//        self.viewModel = viewModel
//    }
//    func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem){
//        print("didTapOn \(item)")
//    }
//    func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//        for item in addedItems {
//            if case .text(let text) = item {
//                let recognizedText = text.transcript
//                print("Recognized text: \(recognizedText)")
//                viewModel.recognizedText = recognizedText
//
//                // Fetch products based on recognized text
//                viewModel.fetchProducts(for: recognizedText)
//            }
//        }
//    }
//
//    
//    func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
//        self.recognizedItems = recognizedItems.filter { item in
//            !removedItems.contains(where: {$0.id == item.id})
//        }
//    }
//    func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: DataScannerViewController.ScanningUnavailable) {
//        print("became unavailable with error \(error.localizedDescription)")
//    }
//}
//
import SwiftUI
import VisionKit

struct DataScannerView: UIViewControllerRepresentable {
    @Binding var recognizedText: String // Bind recognized text to the parent view
    
    func makeUIViewController(context: Context) -> DataScannerViewController {
        let scanner = DataScannerViewController(
            recognizedDataTypes: [.text()], // Only scan for text
            qualityLevel: .fast,
            recognizesMultipleItems: false,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        scanner.delegate = context.coordinator
        return scanner
    }
    
    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        // Update scanner properties if needed
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(recognizedText: $recognizedText)
    }
    
    static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: Coordinator) {
        uiViewController.stopScanning()
    }
    
    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        @Binding var recognizedText: String
        
        init(recognizedText: Binding<String>) {
            self._recognizedText = recognizedText
        }
        
        func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            for item in addedItems {
                if case .text(let text) = item {
                    recognizedText = text.transcript // Update recognized text
                }
            }
        }
    }
}
