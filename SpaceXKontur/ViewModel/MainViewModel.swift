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
            AsyncImage(
                url: URL(string: rocket.flickrImages[Int.random(in:0...rocket.flickrImages.count - 1)]),
                content: { image in
                    image
                        .resizable()
                        .frame(height: 325)
                }, placeholder: {
                    ProgressView()
                        .frame(height: 325)
                })
            RocketViewModel(
                rocket: rocket,
                starts: completeRocket.launchesFor(rocket)
            )
            .offset(y: -30)
        }
    }
}
