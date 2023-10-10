//
//  CardView.swift
//  MemoryGame
//
//  Created by student on 10/10/2023.
//

import SwiftUI

struct CardView: View {
    
    @Binding var value: String
    @State var isOpen: Bool = false
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12.0).stroke(.blue, lineWidth: 2).background(isOpen ? nil : RoundedRectangle(cornerRadius: 12.0).fill(.blue)).frame(width: 100, height: 100)
                Text(isOpen ? value : "").font(.largeTitle).frame(width: 100, height: 100)
            }.onTapGesture {
                isOpen = !isOpen
            }
        }.padding()
    }
}

#Preview {
    CardView(value:.constant(""))
}
