//
//  InterBall.swift
//  SwiftUI-Interactives
//
//  Created by Hiren Rafaliya on 23/03/24.
//

import Foundation
import CoreGraphics
import SwiftUI

struct InterBall {
    var row: Int
    var col: Int
    var text: String = "😄"
    var height: CGFloat = 25
    var width: CGFloat = 25
    var padding: CGFloat = 9
    var point: CGPoint = CGPoint(x: 0, y: 0)
    var rotation: (Double, CGFloat, CGFloat, CGFloat) = (degree: 0, x: 0.0, y: 0.0, z: 0.0)
    var opacity: CGFloat = 1
}
