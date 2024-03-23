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
    var height: CGFloat = 25
    var width: CGFloat = 25
    var padding: CGFloat = 2
    var point: CGPoint = CGPoint(x: 0, y: 0)
}
