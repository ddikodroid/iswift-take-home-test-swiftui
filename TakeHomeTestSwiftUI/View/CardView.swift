//
//  CardView.swift
//  TakeHomeTestSwiftUI
//
//  Created by Ahmad Syarifuddin Randiko on 09/12/22.
//

import SwiftUI

struct CardView: View {
    @State var content: CardViewModel
    var body: some View {
        VStack(spacing:0) {
            Image(content.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(radius: 20.0, corners: [.topLeft, .topRight])
                .padding(.bottom, 16)
            
            LeadingText(text: content.category)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .foregroundColor(.gray)
                .padding(.bottom, 4)
            
            LeadingText(text: content.heading)
                .font(.system(size: 30, weight: .black, design: .rounded))
                .padding(.bottom, 8)
            
            LeadingText(text: content.author.uppercased())
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.bottom, 12)
            
            RatingView(rating: content.rating)
                .padding(.bottom, 12)
            
            Text(content.excerpt)
                .foregroundColor(.gray)
            
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(content: cardViews[0])
    }
}

struct LeadingText: View {
    @State var text: String
    var body: some View {
        Text(text).frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct RatingView: View {
    @State var rating: Int
    var body: some View {
        HStack {
            ForEach(0..<rating, id: \.self) { value in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                    .font(.caption2)
            }
            
        }   .frame(maxWidth: .infinity, alignment: .leading)
    }
}


/**
 Create custom .cornerRadius
 Source: https://prafullkumar77.medium.com/swiftui-how-to-round-specific-corners-of-any-view-db707da66bde
 */

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}

