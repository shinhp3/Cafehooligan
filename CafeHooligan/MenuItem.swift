//
//  MenuItem.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/19/24.
//

import SwiftUI


//메뉴 스타일
struct CustomMenuStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .padding(.vertical, -5)
//            .padding(.horizontal, 8)
    }
}
extension View {
    func customMenuStyle() -> some View {
        self.modifier(CustomMenuStyle())
    }
}



//메뉴 아이템 데이터 모델
struct menuItemInput: Identifiable{
    var id = UUID()
    var name: String
    var price: String
    var imageName: String
    var note: String
}

//메뉴 아이템 뷰
struct MenuItemView: View {
    var item: menuItemInput
    
    var body: some View {
        HStack(spacing: 20) {
            
        
            Image(item.imageName)
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.horizontal, 20)
//                .background(.pink)
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                    .padding(3)
//                    .background(.pink)
                Text(item.price)
                    .font(.system(size: 20))
            }
        }
        .customMenuStyle()
        
    }
}


//메뉴 추가
class MenuData: ObservableObject{
    @Published var menuItems: [menuItemInput] = [
        menuItemInput(name: "coffee", price: "25$", imageName: "coffeeImage", note: "tasty asldkjfhal"),
        menuItemInput(name: "bread", price: "24$", imageName: "breadImage", note: "tasty bread")
    ]
    
}
