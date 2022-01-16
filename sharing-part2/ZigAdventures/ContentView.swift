//
//  ContentView.swift
//  ZigAdventures
//
//  Created by Loris Cro on 03/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var rawImg: ZigRawImage? = nil
    
    var body: some View {
        if let rawImg = rawImg {
            Image(uiImage: UIImage(pixels: rawImg.pixels, width: rawImg.width, height: rawImg.height)!)
                .resizable()
                .scaledToFit()
                .padding()
                .transition(.opacity)
        } else {
            Text("the image is set to null")
                .padding()
        }
        Button("Toggle Zero") {
            withAnimation {
                if (rawImg == nil) {
                    rawImg = ZigRawImage()
                } else {
                    rawImg = nil
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
