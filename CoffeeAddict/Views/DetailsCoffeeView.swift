//
//  DetailsCoffeeView.swift
//  CoffeeAddict
//
//  Created by Muhammad Zalfa on 19/11/22.
//

import SwiftUI

struct DetailsCoffeeView: View {
    //MARK: Properties
    let CoffeeDetails: CoffeeShop
    // MARK: Body
    var body: some View {
        ZStack{
            LinearGradient(colors: [.green, .yellow, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack(alignment: .center) {
                Image(CoffeeDetails.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                    .clipShape(Circle())
                    .overlay {
                        ZStack{
                            Circle()
                                .opacity(0.6)
                        }
                        VStack {
                            Image(systemName: "person.crop.circle.fill.badge.plus")
                                .resizable()
                                .frame(width: 60,height: 60)
                                .foregroundStyle(.green, .blue)
                            Text(CoffeeDetails.name)
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                Text(CoffeeDetails.review)
                    .foregroundColor(.black)
                    .font(.system(.title3,design: .rounded))
                    .lineSpacing(4)
                    .padding()
                    .multilineTextAlignment(.center)
                HStack {
                    Image(systemName: "location")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                    Text(CoffeeDetails.location)
                        .foregroundColor(.red)
                        .font(.system(.title3, design: .rounded))
                }
                
            }
//            .padding()
        }
    }
}

//MARK: Preview
struct DetailsCoffeeView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsCoffeeView(CoffeeDetails: CoffeeShop(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"))
    }
}
