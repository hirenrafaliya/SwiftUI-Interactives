//
//  InterBallViewModel.swift
//  SwiftUI-Interactives
//
//  Created by Hiren Rafaliya on 24/03/24.
//

import Foundation
import SwiftUI


class InterBallViewModel : ObservableObject {
    
    @Published private (set) var interBalls: [[InterBall]] = []
    
    private let CLICK_RADIUS: CGFloat = 30
    private let ACTIVE_PADDING : CGFloat = 5
    private let INACTIVE_PADDING: CGFloat = 2
    
    init() {
        interBalls = getInterBalls()
    }
    
    func updateInterBall(from point: CGPoint, row: Int, col: Int) {
        interBalls[row][col].point = point
    }
    
    func updateInterBalls(for point: CGPoint) {
        for row in interBalls {
            for item in row {
//                print("\(point.x.formatted()) \(item.point.x.formatted()) = \((point.x - item.point.x).formatted())")
                if abs(point.x - item.point.x) < CLICK_RADIUS {
                    print("\(item.row) \(item.col)")
                    withAnimation {
                        interBalls[item.row][item.col].padding = ACTIVE_PADDING
                    }
                } else {
                    withAnimation {
                        interBalls[item.row][item.col].padding = INACTIVE_PADDING
                    }
                }
            }
        }
    }
    
    private func getInterBalls() -> [[InterBall]] {
        var iList: [[InterBall]] = []
        for i in 0..<10 {
            var jList: [InterBall] = []
            for j in 0..<10 {
                jList.append(InterBall(row: i, col: j))
            }
            iList.append(jList)
        }
        return iList
    }
}
