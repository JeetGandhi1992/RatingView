//
//  ContentView.swift
//  RatingView
//
//  Created by Jeet Gandhi on 6/5/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var ratingView = RatingView(initialRating: 2.5)
    @State var rating: Double = 0
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(String(format: "%.2f", rating))")
                .font(.system(size: 70,
                              weight: .semibold,
                              design: .rounded))
            ratingView
        }
        .onReceive(ratingView.vm.$rating, perform: { value in
            rating = Double(value)
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
