//
//  HomeCardView.swift
//  M5Learning
//
//  Created by Craig on 2/13/23.
//

import SwiftUI

struct HomeCardView: View {
    var image: String
    var title: String
    var description: String
    var count: String
    var time: String
    
    var body: some View {
        ZStack {
            
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .aspectRatio(CGSize(width: 335, height: 175), contentMode: .fit)
            
            HStack {
                
                Image(image)
                    .resizable()
                    .frame(width: 118, height: 118)
                    .clipShape(Circle())
                
                Spacer()
                
                VStack (alignment: .leading, spacing: 15) {
                    Text(title)
                        .bold()
                    Text(description)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10)
                        .font(.caption)
                    HStack {
                        
                        Image(systemName: "text.book.closed")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(count)
                            .font(.caption)
                        Spacer()
                        Image(systemName: "clock")
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text(time)
                            .font(.caption)
                    }
                }
                .padding(.leading, 20)
            }
            .padding(.horizontal, 20)
        }
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(image: "swift",
                     title: "preview title",
                     description: "preview description long enough to make sure it is leading",
                     count: "100 lessons",
                     time: "3 decades")
    }
}
