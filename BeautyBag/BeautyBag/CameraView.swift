//
//  CameraView.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//
//
//import SwiftUI
//import VisionKit
//
//struct CameraView: View {
//    @EnvironmentObject var vm: ViewModel // Bind to your ViewModel
//    @Binding var isPresented: Bool // Handle presentation state
//    
//    @Environment(\.dismiss) private var dismiss // Allow dismissing the view
//    
//    private let textContentTypes: [(title: String, textContentType: DataScannerViewController.TextContentType?)] = [
//        ("All", .none),
//        ("URL", .URL),
//        ("Phone", .telephoneNumber),
//        ("Email", .emailAddress),
//        ("Address", .fullStreetAddress)
//    ]
//    
//    var body: some View {
//        ZStack {
//            mainContentView // Main content, depending on camera access status
//            
//            VStack {
//                HStack {
//                    Button(action: {
//                        isPresented = false
//                        dismiss() // Dismiss the view
//                        print("Back button pressed")
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .foregroundColor(.blue)
//                            .imageScale(.large)
//                            .padding()
//                    }
//                    Spacer()
//                }
//                Spacer()
//            }
//        }
//        .onAppear {
//            Task {
//                await vm.requestDataScannerAccessStatus() // Request camera access
//            }
//        }
//        .onChange(of: isPresented) { newValue in
//            print("isPresented changed to: \(newValue)")
//        }
//    }
//    
//    private var mainContentView: some View {
//        Group {
//            switch vm.dataScannerAccessStatus {
//            case .notDetermined:
//                Text("Requesting camera access...").font(.headline).padding()
//            case .cameraAccessNotGranted:
//                Text("Camera access not granted. Please enable camera access in Settings.").font(.headline).padding()
//            case .cameraNotAvailable:
//                Text("Your device does not have a camera available.").font(.headline).padding()
//            case .scannerAvailable:
//                dataScannerWithOverlay
//            case .scannerNotAvailable:
//                Text("This device does not support scanning with this app.").font(.headline).padding()
//            }
//        }
//    }
//    
//    private var dataScannerWithOverlay: some View {
//        ZStack {
//            DataScannerView(
//                recognizedItems: $vm.recognizedItems,
//                recognizedDataType: vm.recognizedDataType,
//                recognizesMultipleItems: vm.recognizesMultipleItems,
//                viewModel: vm // Pass the ViewModel
//            )
//            .background(Color.gray.opacity(0.3))
//            .ignoresSafeArea()
//            
//            if let products = vm.productDetails {
//                productOverlay(products: products)
//            } else if let errorMessage = vm.errorMessage {
//                errorOverlay(message: errorMessage)
//            }
//        }
//    }
//    
//    private func productOverlay(products: Products) -> some View {
//        VStack {
//            Spacer()
//            VStack(spacing: 8) {
//                Text("Product: \(products.productName)")
//                    .font(.title2)
//                    .bold()
//                Text("Brand: \(products.brandName)")
//                    .font(.headline)
//                // You can add more product details here if available
//            }
//            .padding()
//            .background(Color.black.opacity(0.7))
//            .cornerRadius(10)
//            .padding(.bottom, 50)
//        }
//        .transition(.move(edge: .bottom))
//        .animation(.easeInOut, value: vm.productDetails)
//    }
//    
//    private func errorOverlay(message: String) -> some View {
//        VStack {
//            Spacer()
//            Text(message)
//                .font(.headline)
//                .bold()
//                .padding()
//                .background(Color.red.opacity(0.7))
//                .cornerRadius(10)
//                .padding(.bottom, 50)
//        }
//        .transition(.move(edge: .bottom))
//        .animation(.easeInOut, value: vm.errorMessage)
//    }
//    
//    private var headerView: some View {
//        VStack {
//            HStack {
//                Picker("Scan Type", selection: $vm.scanType) {
//                    Text("Barcode").tag(ScanType.barcode)
//                    Text("Text").tag(ScanType.text)
//                }
//                .pickerStyle(.segmented)
//                
//                Toggle("Scan multiple", isOn: $vm.recognizesMultipleItems)
//            }
//            .padding(.top)
//            
//            if vm.scanType == .text {
//                Picker("Text Content Type", selection: $vm.textContentType) {
//                    ForEach(textContentTypes, id: \.textContentType) { option in
//                        Text(option.title).tag(option.textContentType)
//                    }
//                }
//                .pickerStyle(.segmented)
//            }
//            
//            Text(vm.headerText).padding(.top)
//        }
//        .padding(.horizontal)
//    }
//}
//
//
////#Preview {
////    CameraView()
////}
//struct CameraView_Previews: PreviewProvider {
//    @State static var isPresented = true
//
//    static var previews: some View {
//        CameraView(isPresented: $isPresented)
//            .environmentObject(ViewModel())
//    }
//}
import SwiftUI

struct CameraView: View {
    @Binding var isPresented: Bool
    @EnvironmentObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text(viewModel.scannerStatus == .scannerAvailable ? "Scanner Ready" : "Scanner Not Available")
                .font(.headline)
                .padding()
            
            if !viewModel.recognizedText.isEmpty {
                Text("Recognized Text: \(viewModel.recognizedText)")
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
            }
            
            Button("Close Scanner") {
                isPresented = false
            }
            .padding()
        }
        .onAppear {
            Task {
                await viewModel.requestDataScannerAccessStatus()
            }
        }
    }
}


struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
         CameraView(isPresented: .constant(true))
             .environmentObject(ViewModel())
     }
}
