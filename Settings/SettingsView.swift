//
//  LeaderboardView.swift
//  BeatFlow
//
//  Created by Ilaria Poziello on 12/12/23.
//

import SwiftUI

struct SettingsView: View {
    
    @State private var toggleEnabled = true
    
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
                Text("SETTINGS")
                    .foregroundColor(.white)
                    .bold()
                    .font(.largeTitle)
                
                    
                    ZStack {
                        Rectangle()
                            .opacity(0.1)
                            .frame(width: 335, height: 70)
                            .cornerRadius(17)
                            .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                            .padding(.bottom, 5)
                        
                        
                        HStack {
                            Image(systemName: "iphone.radiowaves.left.and.right")
                                .resizable()
                                .frame(width: 40, height: 25)
                                .foregroundColor(.white)
                                
                            Spacer()
                                .frame(width: 10)

                            
                                
                            Text("Vibration").foregroundColor(.white).font(.title2)
                            
                            
                            
                           

                            
                            Toggle("", isOn: $toggleEnabled)

                        }
                        
                    
                }
                
                ZStack {
                    Rectangle()
                        .opacity(0.1)
                        .frame(width: 335, height: 70)
                        .cornerRadius(17)
                        .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                        .padding(.bottom, 5)
                    
                    
                    HStack {
                        Image(systemName: "music.note")
                            .resizable()
                            .frame(width: 15, height: 25)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(width: 20)
                            
                        
                            
                        Text("Music").foregroundColor(.white).font(.title2)
                        
                        Spacer()
                            .frame(width: 200)
                        
                        //toggle
                    }
            }
                
                ZStack {
                    Rectangle()
                        .opacity(0.1)
                        .frame(width: 335, height: 70)
                        .cornerRadius(17)
                        .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                        .padding(.bottom, 5)
                    
                    
                    HStack {
                        Image(systemName: "speaker.wave.2.fill")
                            .resizable()
                            .frame(width: 30, height: 23)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(width: 13)
                            
                            
                        Text("Sound Effects").foregroundColor(.white).font(.title2)
                        
                        Spacer()
                        .frame(width: 130)
                        
                        //toggle
                    }
            }
                
                ZStack {
                    Rectangle()
                        .opacity(0.1)
                        .frame(width: 335, height: 70)
                        .cornerRadius(17)
                        .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                        .padding(.bottom, 5)
                    
                    
                    HStack {
                        Image(systemName: "globe")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(width: 13)
                            
                        
                            
                        Text("Language").foregroundColor(.white).font(.title2)
                        
                        Spacer()
                            .frame(width: 50)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 40)
                                .cornerRadius(30)
                                .foregroundColor(.cyan)
                            .shadow(color: .black, radius: 2)
                            
                            Text("English").foregroundColor(.white)
                            
                        }
                        Spacer()
                        .frame(width: 10)
                        
                        
                    }
            }
                
                ZStack {
                    Rectangle()
                        .opacity(0.1)
                        .frame(width: 335, height: 70)
                        .cornerRadius(17)
                        .shadow(color: .black, radius: 7.5, x: 5, y: 10)
                        .padding(.bottom, 5)
                    
                    
                    HStack {
                        Image(systemName: "info.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(width: 13)
                               
                        Text("Tutorial").foregroundColor(.white).font(.title2)
                        
                            Spacer()
                            .frame(width: 185)
                        
                    }
            }
                
            }
                .offset(y: -90)
               
            
            
            
            
        ).ignoresSafeArea()
        
    }
    
}

#Preview {
    SettingsView()
}
