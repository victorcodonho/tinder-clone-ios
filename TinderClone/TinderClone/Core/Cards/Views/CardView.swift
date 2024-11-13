//
//  CardView.swift
//  TinderClone
//
//  Created by Victor Codonho on 12/11/24.
//

import SwiftUI

struct CardView: View {
    @State private var xOffset: CGFloat = 0
    @State private var degress: Double = 0
    @State private var currentImageIndex = 0
    
    @State private var mockImages = [
        "megan-fox-1",
        "megan-fox-2",
        "megan-fox-3"
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(mockImages[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .overlay(
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: mockImages.count)
                    )
                
                SwipeActionIndicatorView(xOffset: $xOffset)
                    .padding(.horizontal, 20)
            }
            
            UserInfoView()
                .padding(.horizontal, 35)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degress))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degress = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffset = 0
            degress = 0
        }
    }
}

#Preview {
    CardView()
}
