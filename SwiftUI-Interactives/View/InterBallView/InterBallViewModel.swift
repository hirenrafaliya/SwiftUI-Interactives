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
    
    private let CLICK_RADIUS: CGFloat = 150
    private let ACTIVE_PADDING_MULTIPLIER : CGFloat = 0.035
    private let INACTIVE_PADDING: CGFloat = 0
    private let SIZE_MULTIPLIER: CGFloat = 0.4
    
    init() {
        interBalls = getInterBalls()
    }
    
    func clearAnimation() {
        updateInterBalls(for: CGPoint(x: CGFloat.infinity, y: CGFloat.infinity))
    }
    
    func updateInterBall(from point: CGPoint, row: Int, col: Int) {
        interBalls[row][col].point = point
    }
    
    func updateInterBalls(for point: CGPoint) {
        for row in interBalls {
            for item in row {
                let distance = distance(from: point, to: item.point)
                
                if distance < CLICK_RADIUS {
                    withAnimation {
                        interBalls[item.row][item.col].padding = abs(distance - CLICK_RADIUS) * ACTIVE_PADDING_MULTIPLIER
                        //                        interBalls[item.row][item.col].rotation = (distance * 1, 1.0, 1.0, 1.0)
                        interBalls[item.row][item.col].height = abs(distance - CLICK_RADIUS) * SIZE_MULTIPLIER
                        interBalls[item.row][item.col].width = abs(distance - CLICK_RADIUS) * SIZE_MULTIPLIER
                        interBalls[item.row][item.col].opacity = abs(distance - CLICK_RADIUS) * 0.01
                    }
                } else {
                    withAnimation {
                        interBalls[item.row][item.col].padding = INACTIVE_PADDING
                        //                        interBalls[item.row][item.col].rotation = (0, 0.0, 0.0, 0.0)
                        interBalls[item.row][item.col].height = 30
                        interBalls[item.row][item.col].width = 30
                        interBalls[item.row][item.col].opacity = distance * 0.0015

                    }
                }
            }
        }
    }
    
    let emojis = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈",
                  "🍒", "🍑", "🥭", "🍍", "🥥", "🥝", "🍅", "🍆", "🥑", "🥦",
                  "🥒", "🌶", "🌽", "🥕", "🥔"]
    
    private func getInterBalls() -> [[InterBall]] {
        var iList: [[InterBall]] = []
        for i in 0..<20 {
            var jList: [InterBall] = []
            for j in 0..<14 {
                jList.append(InterBall(row: i, col: j, text: emojis.randomElement() ?? "🎉"))
            }
            iList.append(jList)
        }
        return iList
    }
    
    private func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        let deltaX = to.x - from.x
        let deltaY = to.y - from.y
        return sqrt(deltaX * deltaX + deltaY * deltaY)
    }
}
