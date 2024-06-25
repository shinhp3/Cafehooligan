//
//  CustomStyle.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/19/24.
//

import SwiftUI



//빨간버튼
struct CustomButtonStyleRed: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor(red: 190.0 / 255.0, green: 0.0 / 255.0, blue: 74.0 / 255.0, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

//파란버튼
struct CustomButtonStyleBlue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor(red: 25.0 / 255.0, green: 95.0 / 255.0, blue: 131.0 / 255.0, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

//회색버튼
struct CustomButtonStyleGray: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor(red: 98.0 / 255.0, green: 98.0 / 255.0, blue: 98.0 / 255.0, alpha: 1)))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}


//텍스트 필드
struct CustomTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
            .cornerRadius(10)
//            .padding(.horizontal)
            .font(.body)
                
    }
}
//상세설명 창 텍스트 스타일
struct CustomTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal,50)
            .foregroundColor(.white)
    }
}

struct CustomRoundButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60)
            .background(Color.black)
            .foregroundColor(.white)
            .cornerRadius(50)
            .font(.system(size: 50))
    }
}
    

extension View {
    
    func customButtonStyleRed() -> some View {
        self.modifier(CustomButtonStyleRed())
    }
    
    func customButtonStyleBlue() -> some View {
        self.modifier(CustomButtonStyleBlue())
    }
    
    func customButtonStyleGray() -> some View {
        self.modifier(CustomButtonStyleGray())
    }
    
    func customTextFieldStyle() -> some View {
        self.modifier(CustomTextFieldStyle())
    }
    
    func customTextStyle() -> some View {
        self.modifier(CustomTextStyle())
    }
    
    func customRoundButtonStyle() -> some View {
        self.modifier(CustomRoundButtonStyle())
    }
}


