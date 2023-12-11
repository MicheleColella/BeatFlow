//
//  SongsModel.swift
//  BeatFlow
//
//  Created by Michele Colella on 10/12/23.
//

import Foundation

struct SongValue{
    var name: String
    var songName: String
    var gameDuration: TimeInterval
    var bpm: Double
    var columnSequence1: [Int]
    var columnSequence2: [Int]
    var columnSequence3: [Int]
    var cutDirections1: [CutDirection]
    var cutDirections2: [CutDirection]
    var cutDirections3: [CutDirection]
    var startDelay: Double
}

class SongSelection{
    var song: [SongValue] = [
        SongValue(name: "Jingle", songName: "JingleBeat", gameDuration: 100, bpm: 120.0, 
                  columnSequence1: [1, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1],
                  columnSequence2: [0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0],
                  columnSequence3: [0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0],
                  cutDirections1: [.leftToRight, .rightToLeft, .topToBottom, .rightToLeft, .leftToRight, .leftToRight, .leftToRight, .rightToLeft, .leftToRight, .bottomToTop, .bottomToTop, .topToBottom, .bottomToTop],
                  cutDirections2: [.leftToRight, .rightToLeft, .topToBottom, .rightToLeft, .leftToRight, .leftToRight, .leftToRight, .rightToLeft, .leftToRight, .bottomToTop, .bottomToTop, .topToBottom, .bottomToTop],
                  cutDirections3: [.leftToRight, .rightToLeft, .topToBottom, .rightToLeft, .leftToRight, .leftToRight, .leftToRight, .rightToLeft, .leftToRight, .bottomToTop, .bottomToTop, .topToBottom, .bottomToTop],
                  startDelay: 1.9
                 )
    ]
}
