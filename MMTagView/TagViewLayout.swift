//
//  TagViewLayout.swift
//  MMTagView
//
//  Created by Миляев Максим on 09.04.2024.
//

import SwiftUI

struct TagViewLayout: View {
    var body: some View {
        ScrollView{
            TagLayout(hSpacing: 10,vSpacing: 10){
                Circle().fill(.red).frame(width: 100, height: 100)
                Rectangle().fill(.blue).frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 25.0).stroke(Color.orange, lineWidth: 1).frame(width: 100, height: 100)
                Circle().fill(.red).frame(width: 100, height: 100)
                Rectangle().fill(.blue).frame(width: 100, height: 100)
                Text("Hello World").fixedSize()
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Circle().fill(.orange).frame(width: 200,height: 200)
                Rectangle().fill(.blue).frame(width: 100, height: 100)
                RoundedRectangle(cornerRadius: 25.0).stroke(Color.orange, lineWidth: 1).frame(width: 100, height: 100)
                Circle().fill(.red).frame(width: 100, height: 100)
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Text("Goodbay")
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Text("Hellp")
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                Image(systemName: "sun.horizon")
                    .resizable()
                    .frame(idealWidth: 150, idealHeight: 150)//.scaledToFit()
                
            }
            .border(Color.black,width: 3)
            .padding(10)
            .frame(width: 340)
            //            .padding()
            .border(.red, width: 3)
            .background(.gray)
        }
    }
}

#Preview {
    TagViewLayout()
//    ContentView()
}

// MARK: - Layout

struct TagLayout: Layout{
    
    var hSpacing: Double
    var vSpacing: Double
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let totalWidth = proposal.width ?? proposal.replacingUnspecifiedDimensions().width
        var width = Double.zero
        var height = subviews.isEmpty ? 0: subviews[0].sizeThatFits(.unspecified).height
        var maxAddedHeight = Double.zero
        var firstElementHeight: Double = .zero
        
        for index in subviews.indices{
            let size = subviews[index].sizeThatFits(.unspecified)
            if (width + size.width) > totalWidth {
                //next row
                if index == subviews.count - 1 {
                    // if last
                    height += maxAddedHeight + size.height
                } else {
                    width = size.width
                    maxAddedHeight = size.height
                    height += maxAddedHeight + vSpacing
                    firstElementHeight = size.height
                }
            
            } else {
                //current row
                if index == subviews.count - 1 {
                    //if last
                    height -= firstElementHeight
                    maxAddedHeight = max(maxAddedHeight, size.height)
                    height += maxAddedHeight
                } else {
                    width += size.width + hSpacing
                    maxAddedHeight = max(maxAddedHeight, size.height)
                }
                }
        }
        return CGSize(width: totalWidth, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        var point = bounds.origin
        let maxX = bounds.width + bounds.origin.x
        var maxAddedHeight = Double.zero
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            if (point.x + size.width) <= maxX {
                //current row
                subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
                point.x += size.width + hSpacing
                maxAddedHeight = max(maxAddedHeight, size.height)
            } else {
                //next row
                point.x = bounds.origin.x
                point.y += maxAddedHeight + vSpacing
                maxAddedHeight = size.height
                subview.place(at: point, anchor: .topLeading, proposal: .unspecified)
                point.x += size.width + hSpacing
            }
        }
    }
}
