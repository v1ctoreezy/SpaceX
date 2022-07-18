//
//  Testsss.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 06.07.2022.
//

import SwiftUI

struct MainViewModel: View {
    var completeRocket: CompleteRocket
    var rocket: Rocket
    
    var body: some View {
        VStack(spacing: 0) {
            AsyncImage(url: URL(string: rocket.flickrImages[Int.random(in:0...rocket.flickrImages.count - 1)]),
                       scale: CGFloat(2),
                       transaction: .init(animation: .easeIn)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .frame(height: 400)
                }
                else {
                    Color.black
                        .frame(height: 400) //acts like placeholder
                }
            }
            RocketViewModel(
                rocket: rocket,
                launch: completeRocket.launchesFor(rocket)
            )
            .offset(y: -50)
        }
    }
}
