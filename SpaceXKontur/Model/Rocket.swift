//
//  Rocket.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 14.06.2022.
//

import Foundation

struct Rocket: Codable, Identifiable {
    let firstFlight, name, country, id: String
    let costPerLaunch: Int
    let secondStage, firstStage: StageInfo
    let height: HeightInfo
    let mass: MassInfo
    let diameter: DiameterInfo
    let payloadWeights: [PayloadElement]
    let flickrImages: [String]
}

struct PayloadElement: Codable {
    let id:String
    let name: String
    let kg: Double
    let lb: Double
}

struct DiameterInfo: Codable {
    let meters: Double
    let feet: Double
}

struct HeightInfo: Codable {
    let meters: Double?
    let feet: Double?
}

struct MassInfo: Codable {
    let kg: Double
    let lb: Double
}

struct StageInfo: Codable {
    let engines: Int
    let fuelAmountTons: Double
    let burnTimeSec: Int?
}
