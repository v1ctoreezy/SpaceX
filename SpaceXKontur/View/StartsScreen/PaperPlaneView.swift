//
//  PaperPlaneView.swift
//  SpaceXKontur
//
//  Created by Виктор Черкасов on 01.07.2022.
//

import SwiftUI

struct PaperPlaneView: View {
    var succses: Bool
    
    var body: some View {
        ZStack {
            Image(systemName: "paperplane")
                .rotationEffect(succses ? .degrees(0) : .degrees(180))
                .font(Font.system(size: 35))
                .foregroundColor(Color.init(UIColor.lightGray))
            Image(systemName: succses ? "checkmark.circle.fill" : "xmark.circle.fill")
                .background(.white)
                .cornerRadius(10)
                .offset(x: 12, y: 12)
                .foregroundColor(succses ? .green : .red)
            
        }
    }
}

struct PaperPlaneView_Previews: PreviewProvider {
    static var previews: some View {
        PaperPlaneView(succses: true)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        PaperPlaneView(succses: false)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
