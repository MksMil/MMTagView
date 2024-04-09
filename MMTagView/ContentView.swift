//
//  ContentView.swift
//  MMTagView
//
//  Created by Миляев Максим on 08.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var tags: [Color] = []
    var source: [Color] = [
//        "Color.red","Color.green","Color.blue","asdsfsdjgak",
//                           "Color.red","Color.green2","Color.blue3","a4sdsfsdjgak",
//                           "Color.red","Color.green7","Color.blue6","asds5fsdjgak"
        Color.red, Color.green, Color.blue
                          ]
    
    var body: some View {
        VStack {
            GenericTagView(sourceContent: source,
                           returnedTags: $tags) {
                RoundedRectangle(cornerRadius: 25.0).fill(.ultraThinMaterial)
            } cellView: { col in
                Circle().fill(col)
//                Text(col)
//                    .fixedSize().padding(.horizontal,4)
//                    .background(RoundedRectangle(cornerRadius: 5).fill( Color.blue))
                    .frame(width: 40,height: 40)
            }

        }
    }
}

#Preview {
    ContentView()
}
