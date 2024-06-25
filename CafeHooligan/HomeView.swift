//
//  HomeView.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/18/24.
//

import SwiftUI


struct HomeView: View {
    @StateObject var menuData = MenuData()
    @State private var showCreateMenuView = false
    
    var body: some View {
        NavigationView{
            VStack{
                
                //상단 텍스트
                Text("Cafe Hooligan")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
                
                //메뉴
                
                List {
                    ForEach(menuData.menuItems) { item in
                        NavigationLink(destination: MenuDetail(item: item)) {
                            MenuItemView(item: item)
                        }
                            .listRowBackground(Color.clear)
                            .customMenuStyle()
                    }
                }
                .listStyle(PlainListStyle())
                
                //메뉴 생성 버튼
                Button(action: {
                    self.showCreateMenuView = true
                }) {
                    Text("Create a menu")
                        .customButtonStyleRed()
                }
                .fullScreenCover(isPresented: $showCreateMenuView, content: {
                    CreateMenuView()
                })
                
                //기본 배경 색
            }
            .background(Color(UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0)))
            
            
        }
    }
}
#Preview {
    HomeView()
}
