//
//  Statistic.swift
//  WordleApp
//
//  Created by İbrahim Bayram on 31.01.2024.
//

import Foundation

struct Statistic : Codable {
    var frequencies = [Int](repeating: 0, count: 6)
    var games = 0
    var streak = 0
    var maxStreak = 0
    
    var wins : Int {
        frequencies.reduce(0,+)
    }
    
    func saveStat() {
        if let encoded = try? JSONEncoder().encode(self) {
            UserDefaults.standard.set(encoded, forKey: "stat")
        }
    }
    
    static func loadStats() -> Statistic {
        if let statData = UserDefaults.standard.object(forKey: "stat") as? Data {
            if let stat = try? JSONDecoder().decode(Statistic.self, from: statData) {
                return stat
            }else {
                return Statistic()
            }
        }else {
            return Statistic()
        }
    }
    
    mutating func update(win : Bool,index : Int? = nil) {
        games += 1
        streak = win ? streak + 1 : 0
        if win {
            frequencies[index!] += 1
            maxStreak = max(maxStreak, streak)
        }
        saveStat()
    }
}
