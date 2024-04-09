//
//  ContentView.swift
//  MMTagView
//
//  Created by Миляев Максим on 08.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var tags: [Color] = []
    var source: [Color] = [Color.red, Color.green, Color.blue,
                           Color.red, Color.green, Color.blue,
                           Color.red, Color.green, Color.blue,
                           Color.red, Color.green, Color.blue,
                           Color.red, Color.green, Color.blue,Color.orange]
    
    var body: some View {
        ScrollView {
            Divider()
            //show all content cases
            SmartLayout(hSpacing: 5,vSpacing: 5){
                ForEach(source.indices, id: \.self) { index in
                    Circle().fill(source[index]).frame(width: 50)
                        .overlay {
                            Text("\(index)")
                        }
                }
            }
            
            Divider()
            
            //selected cases show
            SmartLayout(hSpacing: 5,vSpacing: 5){
                ForEach(tags.indices, id: \.self) { index in
                    Circle().fill(tags[index]).frame(width: 50)
                }
            }
            
            //selection manager :)
            AnyContentView(sourceContent: source,
                           selectedContent: $tags) {
                RoundedRectangle(cornerRadius: 25.0).fill(.ultraThinMaterial)
            } cellView: { col in
                Circle().fill(col).overlay(content: {
                    Text("\(col.description)")
                })
                    .frame(width: 70,height: 70)
            }
        }
    }
}

#Preview {
    ContentView()
}
