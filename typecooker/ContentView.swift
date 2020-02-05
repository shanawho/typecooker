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
        var minLevel: Int
        var values: [Value]
        
        init(name: String, values : [Value], minLevel : Int = 1) {
            self.name = name
            self.minLevel = minLevel
            self.values = values
        }
    }
    
    struct Value: Hashable {
        var name: String
        var description: String
        var level: Int
        var weight: Int // a value from 1 to 3
        init(_ name: String,  _ description: String, level: Int, weight: Int = 1) {
            self.name = name
            self.level = level
            self.description = description
            self.weight = weight
        }
    }
    
    let params = [
        Param(name: "Width",values: [Value("Compressed","",level:1),
                                     Value("Extra condensed","",level:1),
                                     Value("Condensed","",level:1),
                                     Value("Narrow","",level:1),
                                     Value("Normal","",level:1),
                                     Value("Wide","",level:1),
                                     Value("Very wide","",level:1),
                                     Value("Monospace","",level:1),
                                     Value("Monospace condensed","",level:1)]),
        Param(name: "Weight",values: [Value("Hairline","",level:1),
                                      Value("Very thin","",level:1),
                                      Value("Light","",level:1),
                                      Value("Book","",level:1),
                                      Value("Regular","",level:1),
                                      Value("Medium","",level:1),
                                      Value("Semibold","",level:1),
                                      Value("Bold","",level:1),
                                      Value("Extra bold","",level:1),
                                      Value("Black","",level:1)]),
        Param(name: "Construction",values: [Value("Roman","",level:1),
                                            Value("Capitals","",level:1),
                                            Value("Italic","",level:1),
                                            Value("Smallcaps","",level:1),
                                            Value("Capital + italic","",level:1),
                                            Value("Capital + roman","",level:1)]),
        Param(name: "Stroke endings",values: [Value("No serif","",level:1),
                                              Value("Serif","",level:1),
                                              Value("Rounded","",level:1),
                                              Value("Asymmetric serif","",level:1),
                                              Value("Bifurcated","",level:1),
                                              Value("Bracketed","",level:1),
                                              Value("Wedge","",level:1),
                                              Value("Slab serif","",level:1)]),
        Param(name: "Contrast amount", values: [Value("Inverted","",level:1),
                                                Value("No contrast","",level:1),
                                                Value("Not visible","",level:1),
                                                Value("Very low","",level:2),
                                                Value("Low","",level:1),
                                                Value("Some","",level:1),
                                                Value("Visible","",level:1),
                                                Value("A lot","",level:1),
                                                Value("High","",level:1),
                                                Value("Very high","",level:2),
                                                Value("Extreme","",level:1)]),
        Param(name: "Contrast type", values: [Value("Translation","",level:1),
                                              Value("Expansion","",level:1),
                                              Value("Transitional","",level:2),
                                              Value("Speedball","",level:3),
                                              Value("Brush","",level:3)]),
        Param(name: "Ascender", values: [Value("None","",level:2),
                                        Value("Much shorter than normal","",level:2),
                                        Value("Shorter than normal","",level:2),
                                        Value("Longer than normal","",level:2),
                                        Value("Much longer than normal","",level:2),
                                        Value("Normal","",level:2)],
              minLevel:  2),
        Param(name: "Descender", values: [Value("None","",level:2),
                                        Value("Much shorter than normal","",level:2),
                                        Value("Shorter than normal","",level:2),
                                        Value("Longer than normal","",level:2),
                                        Value("Much longer than normal","",level:2),
                                        Value("Normal","",level:2)],
              minLevel: 2),
        Param(name: "Stems", values: [Value("Straight","",level:2),
                                    Value("Slightly concave","",level:2),
                                    Value("Visibly concave","",level:2),
                                    Value("Flaring","",level:2),
                                    Value("Slightly convex","",level:2),
                                    Value("Visibly convex","",level:2)],
              minLevel: 2),
        Param(name: "Application", values: [Value("Billboard","",level:2),
                                            Value("Multi-purpose","",level:2),
                                            Value("Newsprint","",level:2),
                                            Value("Engraving","",level:2),
                                            Value("Signage","",level:2),
                                            Value("Packaging","",level:2),
                                            Value("Subtitles","",level:2),
                                            Value("Rubber stamps","",level:2),
                                            Value("Laptop reading","",level:2),
                                            Value("Phone reading","",level:2),
                                            Value("Poster","",level:2)],
              minLevel: 2),
        Param(name: "Special", values: [Value("Only straight lines","",level:2),
                                      Value("Rough contours","",level:2),
                                      Value("Sketchy","",level:2),
                                      Value("Cut as a stencil","",level:2),
                                      Value("At least 1 ligature","",level:2),
                                      Value("Initial and final swashes","",level:2),
                                      Value("At least 2 ligatures","",level:3),
                                      Value("Inktraps","",level:3),
                                      Value("Do it blindfolded","",level:3),
                                      Value("Use physical materials","",level:3),
                                      Value("Do it in 1 minute","",level:3),
                                      Value("Use a non-Latin language","",level:3)],
            minLevel: 3),
        Param(name: "Variable",values: [Value("Width axis","",level:2),
                                        Value("Weight axis","",level:2),
                                        Value("Optical axis","",level:2)],
            minLevel: 3),
        Param(name: "Also",values: [Value("As a bold","",level:2),
                                      Value("As a hairline","",level:2),
                                      Value("Reverse contrast","",level:2),
                                      Value("As an italic","",level:2),
                                      Value("With smallcaps","",level:2)],
            minLevel: 3)
    ]
    
    var body: some View {
        
//        var geometry = GeometryReader()
        VStack {
            HStack {
                Text("Easy").onTapGesture {
                    if self.currLevel == 1 {
                        self.currLevel = 0
                    }
                    self.currLevel = 1
                }
                Text("Class").onTapGesture {
                    if self.currLevel == 2 {
                        self.currLevel = 0
                    }
                    self.currLevel = 2
                }
                Text("Pro").onTapGesture {
                    if self.currLevel == 3 {
                        self.currLevel = 0
                    }
                    self.currLevel = 3
                }
            }
            
                HStack {
                    VStack(alignment: .trailing) {
                        ForEach(params, id:\.name) { param in
                            Group {
                                if param.minLevel <= self.currLevel {
                                    Text(param.name).bold()
                                }
                            }
                        }
                    }.frame(width: UIScreen.main.bounds.width, height: .infinity, alignment: .trailing)

                    VStack(alignment: .leading) {
                        ForEach(params, id:\.name) { param in
                            Group {
                                if param.minLevel <= self.currLevel {
                                    Text(param.values.filter{$0.level<=self.currLevel}.randomElement()!.name)
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
