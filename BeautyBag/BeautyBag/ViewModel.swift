//
//  ViewModel.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//

//import Foundation
//import SwiftUI
//import VisionKit
//import AVKit
//import Combine
//
//enum ScanType: String {
//    case barcode, text
//}
//
//enum DataScannerAccessStatusType {
//    case notDetermined
//    case cameraAccessNotGranted
//    case cameraNotAvailable
//    case scannerAvailable
//    case scannerNotAvailable
//    
//}
//
//@MainActor
//final class ViewModel: ObservableObject {
//    @Published var products: [Products] = []
//    
//    @Published var dataScannerAccessStatus: DataScannerAccessStatusType = .notDetermined
//    @Published var recognizedItems: [RecognizedItem] = []
////    @Published var scanType: ScanType = .barcode
//    @Published var textContentType: DataScannerViewController.TextContentType?
//    @Published var recognizesMultipleItems = true
//    @Published var errorMessage: String?
//    
//    @Published var recognizedText: String?
//    
//    func fetchProducts(for query: String) {
//        SephoraAPIService().fetchProducts(query: query) { [weak self] products, error in
//            DispatchQueue.main.async {
//                if let products = products {
//                    self?.products = products
//                } else if let error = error {
//                    print("Error fetching products: \(error.localizedDescription)")
//                }
//            }
//        }
//    }
// 
//    
////    var recognizedDataType: DataScannerViewController.RecognizedDataType {
////        scanType == .barcode ? .barcode() :
////            .text(textContentType: textContentType)
////    }
////    var headerText: String {
////        if recognizedItems.isEmpty {
////            return "Scanning \(scanType.rawValue)"
////        }
////        else {
////            return "Recognized \(recognizedItems.count) item(s)"
////        }
////    }
//    
////    var dataScannerViewId: Int {
////        var hasher = Hasher()
////        hasher.combine(scanType)
////        hasher.combine(recognizesMultipleItems)
////        if let textContentType {
////            hasher.combine(textContentType)
////        }
////        return hasher.finalize()
////    }
//    private var isScannerAvailable: Bool {
//        DataScannerViewController.isAvailable && DataScannerViewController.isSupported
//    }
//    
//    func requestDataScannerAccessStatus() async {
//        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
//            dataScannerAccessStatus = .cameraNotAvailable
//            return
//        }
//        
//        switch AVCaptureDevice.authorizationStatus(for: .video) {
//            
//        case .authorized:
//            dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable : .scannerNotAvailable
//            
//        case .restricted, .denied:
//            dataScannerAccessStatus = .cameraAccessNotGranted
//            
//        case .notDetermined:
//            let granted = await AVCaptureDevice.requestAccess(for: .video)
//            if granted {
//                dataScannerAccessStatus = isScannerAvailable ? .scannerAvailable : .scannerNotAvailable
//            
//            } else {
//                dataScannerAccessStatus = .cameraAccessNotGranted
//            }
//            
//        default: break
//            
//        }
//        
//    }
//    
//}


import Foundation
import VisionKit
import AVFoundation
import Combine

@MainActor
final class ViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var products: [Products] = [] // List of products fetched
    @Published var recognizedText: String = "" // Recognized text from the scanner
    @Published var scannerStatus: DataScannerAccessStatusType = .notDetermined // Scanner availability
    @Published var recognizedItems: [RecognizedItem] = [] // Items recognized by the scanner
    @Published var recognizesMultipleItems = true // Whether multiple items are recognized
    @Published var errorMessage: String? // Error message for UI
    
    // MARK: - Fetch Products
    func fetchProducts(for query: String) {
        SephoraAPIService().fetchProducts(query: query) { [weak self] products, error in
            DispatchQueue.main.async {
                if let products = products {
                    self?.products = products
                } else if let error = error {
                    self?.errorMessage = "Error fetching products: \(error.localizedDescription)"
                    print("Error fetching products: \(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - Scanner Access
    func requestDataScannerAccessStatus() async {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            scannerStatus = .cameraNotAvailable
            return
        }

        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            scannerStatus = DataScannerViewController.isAvailable ? .scannerAvailable : .scannerNotAvailable
        case .restricted, .denied:
            scannerStatus = .cameraAccessNotGranted
        case .notDetermined:
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            scannerStatus = granted && DataScannerViewController.isAvailable ? .scannerAvailable : .scannerNotAvailable
        @unknown default:
            scannerStatus = .notDetermined
        }
    }
    
    // MARK: - Scanner Availability
    private var isScannerAvailable: Bool {
        DataScannerViewController.isAvailable && DataScannerViewController.isSupported
    }
}

enum DataScannerAccessStatusType {
    case notDetermined
    case cameraAccessNotGranted
    case cameraNotAvailable
    case scannerAvailable
    case scannerNotAvailable
}
