//
//  OrderDetail.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/24/24.
//

import SwiftUI

struct OrderDetail: View {
    var item: menuItemInput
    @Environment(\.dismiss) var backHome
    
    
    var body: some View {
        ZStack{
            Color(UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30){
                // 번호
                Text("Your Number")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
 
               
                Text("003")
                    .frame(width: 330, height: 200)
                    .background(.white)
                    .cornerRadius(10)
                    .font(.system(size: 50))
                    .bold()
                VStack{
                    //제품 이름
                    Text("\(item.name)")
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                        .padding()
                    
                    //제품 가격
                    Text("\(item.price)") //item.price 이 칸에 데이터 값
                        .foregroundStyle(.white)
                        .font(.system(size: 30))
                        .padding()
                        .bold()
                }
                .padding()
                .frame(width: 330)
                .background(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
                .cornerRadius(10)
                
                //감사문구
                Text("Thanks for your purchase. \n   Enjoy coffee every day.")
                    .foregroundStyle(.gray)
              
                Spacer()
            }
            
                VStack{
                    Spacer()
                    Button(action: {
                        backHome()
                    }){
                        Text("Go to shop")
                            .customButtonStyleBlue()
                    }.navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        OrderDetail(item: menuItemInput(name: "Sample Coffee", price: "23 $", imageName: "cup.and.saucer.fill", note: "tasty"))
    }
}

