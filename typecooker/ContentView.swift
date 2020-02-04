//
//  ContentView.swift
//  typecooker
//
//  Created by Shana Hu on 2/3/20.
//  Copyright © 2020 Shana Hu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var currLevel = 2
    
    let levels: [String] = ["Starter", "Easy", "Class", "Experienced", "Pro"]
    
    struct Param: Hashable  {
        var name: String
        var values: [String]
        var level: Int
    }
    
    let params = [
        Param(name: "Width",values: ["Condensed","Normal","Wide"],level: 1),
        Param(name: "Weight",values: ["Hairline", "Light", "Regular", "Medium", "Semibold", "Bold", "Black"],level: 1),
        Param(name: "Construction",values: ["Roman", "Geometric", "Neo-grotesque"],level: 1),
        Param(name: "Stroke endings",values: ["Tuscan","Flared","Bracketed","Blobby"],level: 1),
        Param(name: "Contrast amount", values: ["Low", "Medium", "High"], level: 1),
        Param(name: "Ascender",values: ["None","Short","Regular","Tall"],level: 2),
        Param(name: "Descender",values: ["None","Short","Regular","Tall"], level: 2),
        Param(name: "Stems",values: ["Concave", "Convex"],level: 2),
        Param(name: "Application", values: ["Book"], level: 2),
        Param(name: "Size", values: ["Condensed","Normal","Wide"], level: 3),
        Param(name: "Special", values: ["Swash cap"], level: 3),
        Param(name: "Variable",values: ["Roman", "Geometric", "Neo-grotesque"],level: 3),
        Param(name: "Also",values: ["hey"], level: 3)
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text("Easy").onTapGesture { self.currLevel = 1 }
                Text("Class").onTapGesture { self.currLevel = 2 }
                Text("Pro").onTapGesture { self.currLevel = 3 }
            }
                HStack {
                    VStack(alignment: .trailing) {
                        ForEach(params, id:\.name) { param in
                            Group {
                                if param.level <= self.currLevel {
                                    Text(param.name).bold()
                                }
                            }
                        }
                    }
                    VStack(alignment: .leading) {
                        ForEach(params, id:\.name) { param in
                            Group {
                                if param.level <= self.currLevel {
                                    Text(param.values.randomElement()!)
                                }
                            }
                        }
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
