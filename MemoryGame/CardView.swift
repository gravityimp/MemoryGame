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
                RoundedRectangle(cornerRadius: 12.0).stroke(.blue, lineWidth: 2)
                Text(value).font(.largeTitle)
                RoundedRectangle(cornerRadius: 12.0).fill(.blue).onTapGesture {
                    isOpen = !isOpen
                }.opacity(isOpen ? 0 : 1)
            }
        }.onTapGesture {
            isOpen = !isOpen
        }.padding().aspectRatio(CGSize(width: 2, height: 3), contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
    }
}

//RoundedRectangle(cornerRadius: 12.0).stroke(.blue, lineWidth: 2).background(isOpen ? nil : RoundedRectangle(cornerRadius: 12.0).fill(.blue)).aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
//Text(isOpen ? value : "").font(.largeTitle)

#Preview {
    CardView(value:.constant(""))
}
