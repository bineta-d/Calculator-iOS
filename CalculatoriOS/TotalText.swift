//
//  TotalText.swift
//  CalculatoriOS
//
//  Created by Bineta Diatta on 6/9/25.
//

import SwiftUI

struct TotalText: View {
    var value  = "0"
    let color = Color(hue: 1.0, saturation: 1.0, brightness: 1.0)
    let width : CGFloat = 300
    let height  = 50;
    
    
    var body: some View {
        Text(value)
            .frame(width:300, height:100, alignment: .bottomTrailing)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .fontWeight(.light)
            .font(.system(size:80))
            .foregroundColor(.black)
            .font(.largeTitle)
            .padding()
            .lineLimit(2)
            
    }
}

#Preview {
    TotalText()

}
