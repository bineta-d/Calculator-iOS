//
//  CalcImageIView.swift
//  CalculatoriOS
//
//  Created by Bineta Diatta on 6/10/25.
//

import SwiftUI

struct CalcImageIView: View {
    var buttonColor = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var width:CGFloat = 70
    var action: (CalcImageIView) -> Void = { _ in  }
    var mode: CalcMode = .notSet
     var buttonText = "plus"
    var body: some View {
        Button(action: {
            action(self)
        }, label:{
            Image(systemName: buttonText)
                .frame(width:width, height: 75, alignment: .center)
                . background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundStyle(.white)
                .font(.largeTitle)})

    }
    
}

#Preview {
    CalcImageIView()
}
