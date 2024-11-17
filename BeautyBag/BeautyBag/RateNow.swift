//
//  RateNow.swift
//  BeautyBag
//
//  Created by Stephanie Kim on 11/16/24.
//
//
//import SwiftUI
//
//struct RateNow: View {
//    let onRatingComplete: (Int, Double) -> Void
//    let product: Product
//    let questions = [
//            "Application",
//            "Effectiveness",
//            "Formula",
//            "Finish",
//        ]
//    @State private var currentQuestionIndex = 0
//    @State private var ratings: [Int] = [0, 0, 0, 0]
//    @State private var showCalculateButton = false
//    var averageRating: Double {
//        
//            let total = ratings.reduce(0, +)
//            return total == 0 ? 0 : Double(total) / Double(ratings.count)
//        }
//
//        var body: some View {
//            VStack{
//                VStack {
//                    product.image
//                        
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 125, height: 124)
//                
//                        .padding()
//
//                    VStack(spacing:10) {
//                        Text(product.name)
//                            .font(.headline)
//                        
//                        
//                        Text("Brand: \(product.brand)")
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
//                        
//                        
//                        Spacer()
//                    }
//                }
//                
//                
//                
//            }
//            
//            .navigationTitle("Rate Now")
//            
//        }
//}
//
//#Preview {
//    RateNow(
//            product: Product(
//                id: 1,
//                name: "Vanish Airbrush Concealer",
//                brand: "Hourglass",
//                type: "Face",
//                imageName: "hourglass-vanish-concealer"
//            )
//        )
//}

/*
import SwiftUI
struct RateNow: View {
    let product: Product
        var body: some View {
            VStack {
                product.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
            
                    .padding()
                Text("Rate \(product.name)")
                    .font(.largeTitle)
                    .padding()
                Text("Brand: \(product.brand)")
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            }
            .navigationTitle("Rate Now")
            .navigationBarTitleDisplayMode(.inline)
        }
}
#Preview {
    RateNow(
            product: Product(
                id: 1,
                name: "Vanish Airbrush Concealer",
                brand: "Hourglass",
                type: "Face",
                imageName: "hourglass-vanish-concealer"
            )
        )
}
*/
/*
import SwiftUI
struct RateNow: View {
    @Binding var product: Product
    @State private var currentRating: Int = 0
    
    var body: some View {
        VStack {
            product.image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()
            
            Text("Rate \(product.name)")
                .font(.largeTitle)
                .padding()
            
            Text("Brand: \(product.brand)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()
            
            // Rating Picker
            Picker("Rating", selection: $currentRating) {
                ForEach(1...5, id: \.self) { value in
                    Text("\(value) Stars").tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Save Rating") {
                product.rating = currentRating
            }
            .buttonStyle(.borderedProminent)
            .padding()
            
            Spacer()
        }
        .onAppear {
            currentRating = product.rating ?? 0
        }
        .navigationTitle("Rate Now")
        .navigationBarTitleDisplayMode(.inline)
    }
}

*/
import SwiftUI
struct RateNow: View {
    @Binding var product: Product
    @State private var currentRating: Int = 0

    var body: some View {
        VStack {
            product.image
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()

            Text("Rate \(product.name)")
                .font(.largeTitle)
                .padding()

            Text("Brand: \(product.brand)")
                .font(.headline)
                .foregroundColor(.gray)
                .padding()

            // Rating Picker
            Picker("Rating", selection: $currentRating) {
                ForEach(1...5, id: \.self) { value in
                    Text("\(value) Stars").tag(value)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button("Save Rating") {
                product.rating = currentRating
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Spacer()
        }
        .onAppear {
            currentRating = product.rating ?? 0
        }
        .navigationTitle("Rate Now")
        .navigationBarTitleDisplayMode(.inline)
    }
}
