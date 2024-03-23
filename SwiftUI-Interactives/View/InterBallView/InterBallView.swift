//
//  InterBallView.swift
//  SwiftUI-Interactives
//
//  Created by Hiren Rafaliya on 23/03/24.
//

import Foundation
import SwiftUI

struct InterBallView: View {
    
    @StateObject var viewModel = InterBallViewModel()
    @State var currentPoint: CGPoint = CGPoint(x: 0, y: 0)
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 0) {
                ForEach(viewModel.interBalls.indices, id: \.self) { i in
                    let row = viewModel.interBalls[i]
                    
                    HStack(spacing: 0) {
                        ForEach(row.indices, id: \.self) { j in
                            let col = row[j]
                            
                            GeometryReader { geo in
                                
                                ZStack {
                                    Circle()
                                        .foregroundColor(.blue.opacity(1))
                                        .frame(width: 25, height: 25)
                                        .onAppear {
                                            viewModel.updateInterBall(from: geo.frame(in: .global).origin, row: i, col: j)
                                        }
                                    
                                    Text("\(col.padding.formatted())")
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                    
                                }
                            }
                            .frame(width: 25,height: 25)
                            .padding(col.padding)
                        }
                    }
                }
            }
            
            
                        GeometryReader { geometry in
                            Rectangle()
                                .fill(Color.clear)
                                .contentShape(Rectangle())
                                .onTapGesture { gesture in
                                    currentPoint = CGPoint(x: gesture.x, y: gesture.y)
                                    print(currentPoint)
                                    
                                    viewModel.updateInterBalls(for: currentPoint)
            
//                                    for row in viewModel.interBalls {
//                                        for ball in row {
//                                            if abs(ball.point.x - currentPoint.x) < 20 {
//                                                ball.padding = 5
//                                                print("\(ball.row) \(ball.col) \(ball.padding)")
//            
//                                            }
//                                            else {
//                                                ball.padding = 3
//                                            }
//                                            if abs(ball.point.y - currentPoint.y) < 20 {
//                                                ball.padding = 5
//                                                print("\(ball.row) \(ball.col) \(ball.padding)")
//            
//                                            }
//                                            else {
//                                                ball.padding = 3
//                                            }
//                                        }
//                                    }
            
            
                                }
                        }
        }
        
    }
}

#Preview {
    InterBallView()
}
