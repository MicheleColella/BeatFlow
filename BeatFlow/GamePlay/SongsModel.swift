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
}

class SongSelection{
    var song: [SongValue] = [
        SongValue(name: "Jingle", songName: "JingleBeat", gameDuration: 10, bpm: 120.0,
                  columnSequence1: [1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1],
                  columnSequence2: [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0],
                  columnSequence3: [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0],
                  cutDirections1: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up],
                  cutDirections2: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up],
                  cutDirections3: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up]
                 ),
        SongValue(name: "Thunder", songName: "Thunder", gameDuration: 180, bpm: 84.0,
                  columnSequence1: [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  columnSequence2: [0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  columnSequence3: [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                  cutDirections1: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left],
                  cutDirections2: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left],
                  cutDirections3: [.right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left, .down, .left, .right, .right, .right, .left, .right, .up, .up, .down, .up, .right, .left]
                 )
    ]
}
