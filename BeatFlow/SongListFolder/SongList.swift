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
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.33, green: 0.16, blue: 0.53), location: 0.00),
            Gradient.Stop(color: Color(red: 0.7, green: 0.22, blue: 0.93).opacity(0.88), location: 0.50),
            Gradient.Stop(color: Color(red: 0.02, green: 0.57, blue: 0.73).opacity(0.54), location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
            ).overlay(
                /// 1a canzone
                VStack{
                    VStack(alignment: .leading, spacing: 10) {
                        Text("SONG SELECTION")
                            .foregroundColor(.white)
                            .font(Font.custom("SF Compact Rounded", size: 36))
                            .multilineTextAlignment(.center)
                    }
                    

                    
                    ScrollView {
                        
                        VStack(spacing: 20) {
                            NavigationLink(destination: GameView(songInt: 0)) {
                                Rectangle()
                                    .foregroundColor(.purple)
                                    .frame(height: 120)
                                    .overlay(
                                        /// canzone 1
                                        VStack(alignment: .leading){
                                            VStack{Text("THUNDER")
                                                    .foregroundColor(.white)
                                                
                                                    .font(Font.custom("SF Compact Rounded", size: 24))
                                                Text("Imagine Dragon")
                                                    .foregroundColor(.white)
                                                    .offset(x: -8)
                                                .font(Font.custom("SF Compact Rounded", size: 13))}.offset(y:40)
                                            
                                            

                                            HStack(alignment: .center) {
                                                HStack{
                                                    Image(systemName: "speaker.wave.2.circle")
                                                        .font(.system(size: 30))
                                                        .foregroundColor(.white)
                                                    Image(systemName: "chart.bar.fill")
                                                        .font(.system(size: 20))
                                                        .foregroundColor(.white)
                                                }.offset(y: 10)
                                                HStack{
                                                    Text("168 BPM")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 13))
                                                    Image(systemName: "music.note")
                                                        .foregroundColor(.white)
                                                    Text("200")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 13))
                                                    
                                                }.offset(x: 25, y: 10)
                                                ZStack{
                                                    
                                                    Rectangle()
                                                      .foregroundColor(.clear)
                                                      .frame(width: 122, height: 122)
                                                      .background(
                                                        Image("ImageThunder")
                                                          .resizable()
                                                          .aspectRatio(contentMode: .fill)
                                                          .frame(width: 122, height: 122)
                                                          .clipped()
                                                          .opacity(0.7)
                                                      )
                                                      .cornerRadius(19)
                                                      .offset(x: 26, y: -24)
                                                    HStack {
                                                        Image(systemName: "timer")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 13))
                                                        Text("3:36")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 12))
                                                            
                                                    }.offset(x:-70 , y:-60)
                                                    Image(systemName:"play.circle")
                                                        .font(.system(size: 64))
                                                        .foregroundColor(.white)
                                                        .offset(x: 26, y: -24)
                                                }
                                              
                                                
                                            }
    
                                                
                                        }.padding()
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                            
                                        
                                    )
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                            }
                            
                            NavigationLink(destination: GameView(songInt: 1)) { Rectangle()
                                    .foregroundColor(.purple)
                                    .frame(height: 120)
                                    .overlay(
                                        /// 2a canzone
                                            VStack(alignment: .leading){
                                                VStack{Text("MAMMAMIA")
                                                        .foregroundColor(.white)
                                                    
                                                        .font(Font.custom("SF Compact Rounded", size: 24))
                                                    Text("Maneskin")
                                                        .foregroundColor(.white)
                                                        .offset(x: -39)
                                                    .font(Font.custom("SF Compact Rounded", size: 13))}.offset(y:40)
                                                
                                                

                                                HStack(alignment: .center) {
                                                    HStack{
                                                        Image(systemName: "speaker.wave.2.circle")
                                                            .font(.system(size: 30))
                                                            .foregroundColor(.white)
                                                        Image(systemName: "chart.bar.fill")
                                                            .font(.system(size: 20))
                                                            .foregroundColor(.white)
                                                    }.offset(y: 10)
                                                    HStack{
                                                        Text("142 BPM")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 13))
                                                        Image(systemName: "music.note")
                                                            .foregroundColor(.white)
                                                        Text("200")
                                                            .foregroundColor(.white)
                                                            .font(.system(size: 13))
                                                        
                                                    }.offset(x: 25, y: 10)
                                                    ZStack{
                                                        
                                                        Rectangle()
                                                          .foregroundColor(.clear)
                                                          .frame(width: 122, height: 122)
                                                          .background(
                                                            Image("ImageMammamia")
                                                              .resizable()
                                                              .aspectRatio(contentMode: .fill)
                                                              .frame(width: 122, height: 122)
                                                              .clipped()
                                                              .opacity(0.7)
                                                          )
                                                          .cornerRadius(19)
                                                          .offset(x: 26, y: -24)
                                                        HStack {
                                                            Image(systemName: "timer")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 13))
                                                            Text("3:18")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 12))
                                                                
                                                        }.offset(x:-70 , y:-60)
                                                        Image(systemName:"play.circle")
                                                            .font(.system(size: 64))
                                                            .foregroundColor(.white)
                                                            .offset(x: 26, y: -24)
                                                    }
                                                  
                                                    
                                                }
        
                                                    
                                            }.padding()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        )
                                    
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                            }
                            NavigationLink(destination: GameView(songInt: 2)) { Rectangle()
                                    .foregroundColor(.purple)
                                    .frame(height: 120)
                                    .overlay(
                                        /// 3a canzone
                                        VStack(alignment: .leading){
                                        VStack{Text("DOMINION")
                                                .foregroundColor(.white)
                                            
                                                .font(Font.custom("SF Compact Rounded", size: 24))
                                            Text("Skillet")
                                                .foregroundColor(.white)
                                                .offset(x: -43)
                                            .font(Font.custom("SF Compact Rounded", size: 13))}.offset(y:40)
                                        
                                        

                                        HStack(alignment: .center) {
                                            HStack{
                                                Image(systemName: "speaker.wave.2.circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(.white)
                                                Image(systemName: "chart.bar.fill")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.white)
                                            }.offset(y: 10)
                                            HStack{
                                                Text("165 BPM")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13))
                                                Image(systemName: "music.note")
                                                    .foregroundColor(.white)
                                                Text("200")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13))
                                                
                                            }.offset(x: 25, y: 10)
                                            ZStack{
                                                
                                                Rectangle()
                                                  .foregroundColor(.clear)
                                                  .frame(width: 122, height: 122)
                                                  .background(
                                                    Image("ImageDominion")
                                                      .resizable()
                                                      .aspectRatio(contentMode: .fill)
                                                      .frame(width: 122, height: 122)
                                                      .clipped()
                                                      .opacity(0.7)
                                                  )
                                                  .cornerRadius(19)
                                                  .offset(x: 26, y: -24)
                                                HStack {
                                                    Image(systemName: "timer")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 13))
                                                    Text("3:52")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12))
                                                        
                                                }.offset(x:-70 , y:-60)
                                                Image(systemName:"play.circle")
                                                    .font(.system(size: 64))
                                                    .foregroundColor(.white)
                                                    .offset(x: 26, y: -24)
                                            }
                                          
                                            
                                        }

                                            
                                    }.padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                )
                                       
                                    
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                            }
                            NavigationLink(destination: GameView(songInt: 3)) { Rectangle()
                                    .foregroundColor(.purple)
                                    .frame(height: 120)
                                    .overlay(
                                        /// canzone 4
                                        VStack(alignment: .leading){
                                        VStack{Text("ANIMALS")
                                                .foregroundColor(.white)
                                            
                                                .font(Font.custom("SF Compact Rounded", size: 24))
                                            Text("Maroon 5")
                                                .foregroundColor(.white)
                                                .offset(x: -25)
                                            .font(Font.custom("SF Compact Rounded", size: 13))}.offset(y:40)
                                        
                                        

                                        HStack(alignment: .center) {
                                            HStack{
                                                Image(systemName: "speaker.wave.2.circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(.white)
                                                Image(systemName: "chart.bar.fill")
                                                    .font(.system(size: 20))
                                                    .foregroundColor(.white)
                                            }.offset(y: 10)
                                            HStack{
                                                Text("190 BPM")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13))
                                                Image(systemName: "music.note")
                                                    .foregroundColor(.white)
                                                Text("200")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 13))
                                                
                                            }.offset(x: 25, y: 10)
                                            ZStack{
                                                
                                                Rectangle()
                                                  .foregroundColor(.clear)
                                                  .frame(width: 122, height: 122)
                                                  .background(
                                                    Image("ImageAnimals")
                                                      .resizable()
                                                      .aspectRatio(contentMode: .fill)
                                                      .frame(width: 122, height: 122)
                                                      .clipped()
                                                      .opacity(0.7)
                                                  )
                                                  .cornerRadius(19)
                                                  .offset(x: 26, y: -24)
                                                HStack {
                                                    Image(systemName: "timer")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 13))
                                                    Text("4:41")
                                                        .foregroundColor(.white)
                                                        .font(.system(size: 12))
                                                        
                                                }.offset(x:-70 , y:-60)
                                                Image(systemName:"play.circle")
                                                    .font(.system(size: 64))
                                                    .foregroundColor(.white)
                                                    .offset(x: 26, y: -24)
                                            }
                                          
                                            
                                        }

                                            
                                    }.padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)                           )
                                    .cornerRadius(30)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }.offset(y:100)
            ).ignoresSafeArea()
            
        }.navigationBarBackButtonHidden(true)    }
}

#Preview {
    SongList()
}
