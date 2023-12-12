//
//  SongList.swift
//  BeatFlow
//
//  Created by Ivan Alaia on 12/12/23.
//

import SwiftUI

struct SongList: View {
    var body: some View {
        NavigationView {
            VStack{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Songs List")
                        .font(.largeTitle)
                        .padding(.top, 20)
                        .padding(.horizontal)
                    
                    
                }
                
                ScrollView {
                    
                    VStack(spacing: 20) {
                        NavigationLink(destination: GameView(songInt: 0)) { Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 120)
                                .overlay(
                                    Text("canzone 1")
                                        .foregroundColor(.white)
                                        .padding()
                                )
                                .cornerRadius(30)
                                .padding(.horizontal)
                        }
                        
                        NavigationLink(destination: GameView(songInt: 1)) { Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 120)
                                .overlay(
                                    Text("canzone 2")
                                        .foregroundColor(.white)
                                        .padding()
                                )
                                .cornerRadius(30)
                                .padding(.horizontal)
                        }
                        NavigationLink(destination: GameView(songInt: 2)) { Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 120)
                                .overlay(
                                    Text("canzone 3")
                                        .foregroundColor(.white)
                                        .padding()
                                )
                                .cornerRadius(30)
                                .padding(.horizontal)
                        }
                        NavigationLink(destination: GameView(songInt: 3)) { Rectangle()
                                .foregroundColor(.purple)
                                .frame(height: 120)
                                .overlay(
                                    Text("canzone 4")
                                        .foregroundColor(.white)
                                        .padding()
                                )
                                .cornerRadius(30)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SongList()
}
