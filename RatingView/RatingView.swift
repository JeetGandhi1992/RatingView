//
//  RatingView.swift
//  GraphQLSwiftUIDemo
//
//  Created by Jeet Gandhi on 5/5/21.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: CGFloat
    @State var totalWidth: CGFloat = 0
    
    var body: some View {
        ZStack {
            starsView
                .overlay(overlayView.mask(starsView))
        }
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged{ (value) in
                    rating = value.location.x
                }
                .onEnded{ (value) in
                    rating = value.location.x
                }
        )
        .coordinateSpace(name: "MainV")
    }
    
    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack() {
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: max(0, min(rating, geometry.size.width)))
                    .animation(.easeInOut)
            }
            .onAppear {
                totalWidth = geometry.size.width
            }
        }
        .allowsHitTesting(false)
    }
    
    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = (CGFloat(index) / 5) * totalWidth
                        }
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 2)
    }
}
