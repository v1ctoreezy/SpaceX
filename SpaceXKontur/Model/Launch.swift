//
//  Start.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 28.06.2022.
//

import Foundation

struct Launch: Codable, Identifiable {
    let rocket: String
    let id: String
    let name: String
    let dateUnix: Int
    let success: Bool?
}
