//
//  ContentView.swift
//  CalculatoriOS
//
//  Created by Bineta Diatta on 6/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var total = "0"
    var body: some View {
        VStack {
            Spacer(minLength: 100)
            TotalText(value : total)
            ButtonGrid(total: $total)
        }
    }
}

#Preview {
    ContentView()
}
