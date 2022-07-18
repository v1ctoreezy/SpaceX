//
//  CompleteRocket.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 03.07.2022.
//

import Foundation

class CompleteRocket: NetWorkService, ObservableObject {
    
    @Published var rockets = [Rocket]()
    @Published var launches = [Launch]()

    override init() {
        super.init()
        getRockets()
        getLaunches()
    }
    
    func getRockets() {
        super.getData(url: "https://api.spacexdata.com/v4/rockets") { rockets in
            self.rockets = rockets
        }
    }
    
    func getLaunches() {
        super.getData(url: "https://api.spacexdata.com/v4/launches") { launches in
            self.launches = launches
        }
    }
    
    func launchesFor(_ rocket: Rocket) -> [Launch] {
        return launches.filter{ $0.rocket == rocket.id }
    }
    
}
