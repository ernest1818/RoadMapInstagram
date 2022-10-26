//
//  Prifile.swift
//  RMInstagram
//
//  Created by Ernest Avagovich on 22.10.2022.
//

import Foundation

/// Профиль пользователя
struct UserProfile {
    let topicalStories: TopicalStories
    let contentImageName: [String] = [
        "3", "9", "10", "12", "13",
        "14", "15", "16", "17", "18",
        "19", "39", "40", "41", "42",
        "43", "44", "45", "46", "47",
        "48", "49"
    ]
}

/// информация для ячейки актуальное
struct TopicalStories {
    let name: [String] = ["Armenia🇦🇲", "Russia🇷🇺", "Germany🇩🇪", "🇱🇧", "🇱🇷", "🇨🇳", "🇨🇴", "🇲🇶", "🇵🇪"]
    let imageName: [String] = ["30", "31", "32", "33", "34", "35", "36", "37", "38"]
}
