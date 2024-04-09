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
        Color.red, Color.green, Color.blue,Color.red, Color.green, Color.blue,Color.red, Color.green, Color.blue,Color.red, Color.green, Color.blue,Color.red, Color.green, Color.blue,Color.red,
                          ]
    
    var body: some View {
        ScrollView {
            TagLayout(hSpacing: 5,vSpacing: 5){
                
                    ForEach(source.indices, id: \.self) { index in
                        Circle().fill(source[index]).frame(width: 50)
                        Text("\(index)")
                    }.frame(maxWidth: .infinity)
                    Text("asdf")
                
            }.padding()
                .background {
                    RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial)
                }
            
            
//            GenericTagView(sourceContent: source,
//                           returnedTags: $tags) {
//                RoundedRectangle(cornerRadius: 25.0).fill(.ultraThinMaterial)
//            } cellView: { col in
//                Circle().fill(col)
////                Text(col)
////                    .fixedSize().padding(.horizontal,4)
////                    .background(RoundedRectangle(cornerRadius: 5).fill( Color.blue))
//                    .frame(width: 40,height: 40)
//            }
////            .padding()

        }
    }
}

#Preview {
    ContentView()
}
