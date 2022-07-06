//
//  TestView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 07.06.2022.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack {
            Text("SSSS")
                .foregroundColor(.white)
            Text("SSSS")
                .foregroundColor(.white)
        }.frame(width: 300, height: 300, alignment: .leading)
            .background(.black)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
