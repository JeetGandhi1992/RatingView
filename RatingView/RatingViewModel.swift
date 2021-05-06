//
//  RatingViewModel.swift
//  RatingView
//
//  Created by Jeet Gandhi on 6/5/21.
//

import Foundation
import UIKit
import Combine

class RatingViewModel: ObservableObject {
    
    @Published public var rating: CGFloat = 0
}
