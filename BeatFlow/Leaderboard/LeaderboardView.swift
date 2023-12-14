//
//  LeaderboardView.swift
//  BeatFlow
//
//  Created by Ilaria Poziello on 12/12/23.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {

        
        LinearGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.33, green: 0.16, blue: 0.53), location: 0.00),
        Gradient.Stop(color: Color(red: 0.7, green: 0.22, blue: 0.93), location: 0.50),
        Gradient.Stop(color: Color(red: 0.02, green: 0.57, blue: 0.73).opacity(0.54), location: 1.00),
        Gradient.Stop(color: Color(red: 0.02, green: 0.57, blue: 0.73), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0),
        endPoint: UnitPoint(x: 0.5, y: 1)
        )
        .overlay(
            VStack {
                Text("LEADERBOARD")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                
                ForEach (1..<8) { number in
                    
                    ZStack {
                        Rectangle()
                            .opacity(0.1)
                            .frame(width: 335, height: 70)
                            .cornerRadius(17)
                            .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                            .padding(.bottom, 5)
                        
                        
                        
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color(red: 0.33, green: 0.16, blue: 0.53).opacity(0.55))
                                    .frame(width: 50, height: 50)
                                
                                
                                
                                
                                
                                Text("\(number)").foregroundColor(.white).font(.title2).bold()
                            }
                            Spacer()
                                .frame(width: 175)
                            
                            Text("27108 pt.").foregroundColor(.white).bold().font(.title3)
                        }
                        
                    }
                }
                
            }
            
            
            
            
        ).ignoresSafeArea()
        
    }
    
}

#Preview {
    LeaderboardView()
}
