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
                                    
//                                    Text("\(col.padding.formatted())")
//                                        .fontWeight(.bold)
//                                        .foregroundStyle(.white)
                                    
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
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                currentPoint = value.location

                                viewModel.updateInterBalls(for: currentPoint)
                            }.onEnded { value in
                                currentPoint = value.location
                                
                                viewModel.clearAnimation()
                            }
                    )
            }
        }
        
    }
}

#Preview {
    InterBallView()
}
