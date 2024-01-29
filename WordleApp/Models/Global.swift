//
//  Global.swift
//  Wodle
//
//  Created by İbrahim Bayram on 30.01.2024.
//

import UIKit

enum Global {
    static var screenWidth : CGFloat {
        UIScreen.main.bounds.size.width
    }
    static var screenHeight : CGFloat {
        UIScreen.main.bounds.size.height
    }
    static var minDimension : CGFloat {
        min(screenWidth, screenHeight)
    }
    static var boardWidth : CGFloat {
        switch minDimension {
        case 0...320:
            return screenWidth - 55
        case 321...430:
            return screenWidth - 50
        case 431...1000:
            return 350
        default:
            return 500
        }
    }
    
    static var keyboardScale : CGFloat {
        switch minDimension {
        case 0...430:
            return screenWidth / 400
        case 431...1000:
            return CGFloat(1.2)
        default:
            return CGFloat(1.6)
        }
    }
    
    static let commonWords = ["AFAKİ", "AÇLIK", "ABİYE", "ABBAS", "BALON", "BAHRİ", "BAHÇE", "CACIK", "CAMCI", "CIBIL", "CÜMLE", "ÇÖPÇÜ", "ÇÜRÜK", "ÇİNLİ", "ÇİNKO", "ÇÖZÜM", "DİLİM", "DAİMİ", "DİLEK", "DIŞKI", "EZBER", "EVLAT", "ENFES", "FOSİL", "FELEK", "GAYET", "GİYİM", "GAZOZ", "HAMAK", "HOŞAF", "HAMSİ", "İNMEK", "İNKAR", "İBRAZ", "IRKÇI", "ILGAZ", "JOKEY", "JARSE", "KREDİ", "KALIN", "KABLO", "LÜZUM", "LOTUS", "LEĞEN", "MEVLA", "MASAL", "MELEZ", "NİŞAN", "NALAN", "NİNNİ", "OĞLAK", "ÖVMEK", "ÖRDEK", "PİLOT", "POSTA", "RAMPA", "ROMAN", "SAKIZ", "SAVCI", "ŞİFRE", "TEKNE", "UZMAN", "ÜZGÜN", "VAKIF", "YALIN", "ZEHİR", "ADANA", "ACABA", "ACELE", "ABİDE", "BAKIM", "BALIK", "BACAK", "BAHAR", "CIVIK", "CÜSSE", "CÜBBE", "CEZVE", "ÇOCUK", "ÇUVAL", "ÇAMUR", "ÇUBUK", "DİREK", "DAYAK", "DARBE", "EŞARP", "ECDAT", "ERKEK", "ENDAM", "ENDER", "FUNDA", "FULAR", "FIKRA", "GÜREŞ", "GÜMÜŞ", "GÜNAH", "GÖREV", "HAFTA", "HARAM", "HAVVA", "HOROZ", "İPTAL", "İPUCU", "İSHAL", "İLHAM", "IRGAT", "ISSIZ", "JAPON", "JİLET", "KÖMÜR", "KORNA", "KORSE", "KAYIK", "LEVHA", "LAVAŞ", "LİSAN", "LİDER", "METRE", "MAKAS", "MERAK", "MİRAS", "NABIZ", "NEZLE", "NARİN", "NAMAZ", "OMLET", "OĞLAN", "ÖNLÜK", "ÖDÜNÇ", "POŞET", "PASAK", "POLİS", "RİMEL", "RÜKÜŞ", "SAVAŞ", "SİNİR", "ŞAFAK", "ŞURUP", "TAVİZ", "TEPSİ", "UYSAL", "ÜÇGEN", "VİŞNE", "YAKIN", "ZIBIN"]
}
