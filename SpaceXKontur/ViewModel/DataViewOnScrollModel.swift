//
//  DataViewOnScroll.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 26.06.2022.
//

import Foundation
import SwiftUI

struct DataViewOnScrollModel: View {
    @Binding var height: Bool
    @Binding var diam: Bool
    @Binding var mass: Bool
    @Binding var load: Bool
    
    var rocket: Rocket
    var rows: [GridItem] = [GridItem(.fixed(100), spacing: 20)]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .center, spacing: 15){
                CircleDataView(discribtion: "Высота, \(height ? "ft" : "m")",
                               data: String(height ? rocket.height.feet ?? 0 : rocket.height.meters ?? 0))
                CircleDataView(discribtion: "Диаметр, \(diam ? "ft" : "m")",
                               data: String(diam ? rocket.diameter.feet : rocket.diameter.meters))
                CircleDataView(discribtion: "Масса, \(mass ? "lb" : "kg")",
                               data: String(mass ? rocket.mass.lb : rocket.mass.kg))
                CircleDataView(discribtion: "Нагрузка, \(load ? "lb" : "kg")",
                               data: String(load ? rocket.payloadWeights[0].lb : rocket.payloadWeights[0].kg))
            }.offset(x: 20)
        }
        .frame(maxWidth: 500, alignment: .center)
        .frame(height: 110)
    }
}
