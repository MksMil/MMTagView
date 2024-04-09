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
            TagLayout(hSpacing: 5,vSpacing: 5){
                
                ForEach(tags.indices, id: \.self) { index in
                    Circle().fill(tags[index]).frame(width: 50)
                }.frame(maxWidth: .infinity)
            }.padding()
                .background {
                    RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial)
                }
            
            
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
            //            .padding()
            
        }
    }
}

#Preview {
    ContentView()
}
