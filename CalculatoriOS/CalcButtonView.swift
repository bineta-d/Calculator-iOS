//
//  CalcButtonView.swift
//  CalculatoriOS
//
//  Created by Bineta Diatta on 6/9/25.
//

import SwiftUI

struct CalcButtonView: View {
    var buttonText = "1"
    var buttonColor = Color(hue: 1.0, saturation: 0, brightness: 0.283)
    var width:CGFloat = 70
    var action: (CalcButtonView) -> Void = { _ in  }
    var mode: CalcMode = .notSet
    var body: some View {
        Button(action: {
            action(self)
        }, label:{ Text(buttonText)
                .frame(width:width, height: 75, alignment: .center)
                . background(buttonColor)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .foregroundStyle(.white)
                .font(.largeTitle)})

    }
    
 
}



#Preview {
    CalcButtonView()
}
