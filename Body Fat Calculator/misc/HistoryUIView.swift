//
//  HistoryUIView.swift
//  Body Fat Calculator
//
//  Created by Michael Green on 2022-07-12.
//

import SwiftUI

struct HistoryUIView: View {
    var body: some View {
        
    let entries = [1,2,3,4,5,6,7]
        
        ScrollView([.vertical, .horizontal], showsIndicators: false){
            
            VStack(spacing: 20){
                
                ForEach(0..<5) { row in
                    Text("TESTING = \(entries[0])")
                }
            }
        }
    }
}

struct HistoryUIView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryUIView()
    }
}
