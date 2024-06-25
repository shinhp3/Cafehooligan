//
//  MenuDetail.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/21/24.
//

import SwiftUI

struct MenuDetail: View {
    var item: menuItemInput
    //기본 설정 주문개수
    @State private var countProduct: Int = 1
    @Environment(\.presentationMode) var backButton
    @State private var showEditAlert = false
    @State private var showDeleteAlert = false
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Color(UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    //아이템 이름
                    Text(item.name)
                        .font(.largeTitle)
                        .padding()
                        .foregroundColor(.white)
                    VStack {
                       
                        
                        // 아이템 이미지
                        Image(item.imageName)
                        
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                            .padding()
                            .background()
                            .cornerRadius(10)
                        
                        //아이템 가격
                        Text(item.price)
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                        
                        //아이템 상세설명
                        ScrollView{
                            Text(item.note)
                                .font(.subheadline)
                                .padding()
                                .padding(.bottom, 20)
                                .foregroundColor(.white)
                                .frame(maxWidth: 280)
                            //  .background(.pink)
                        }.frame(height: 100)
                        
                        
                    }
                    .padding()
                    .padding(.horizontal, 10)
                    .padding(.top, 10)
                    .background(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
                    .cornerRadius(10)
                    
                  
                    
                    HStack(spacing: 20){
                        
                        // - 버튼 조절
                        Button(action: {
                            if countProduct > 1 {
                                countProduct -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.system(size: 40))
                                .customRoundButtonStyle()
                            
                                
                        }
                        
                        
                        // 상품 개수
                        VStack{
                            Text("Amount")
                                .foregroundStyle(.white)
                            Text("\(countProduct)")
                                .foregroundStyle(.white)
                                .font(.system(size: 30))
                                .frame(width: 100, height: 60)
                                .background(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
                                .cornerRadius(10)
                            
                        }.padding()
                        
                        // + 버튼 조절
                        Button(action: {
                            if countProduct < 20 {
                                countProduct += 1
                            }
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 40))
                                .customRoundButtonStyle()
                        }
                    }
//                    .padding()
                    
                    HStack(spacing: -10){
                        //아이템 가격
                        Text("\(item.price)")
                            .foregroundStyle(.white)
                            .font(.system(size: 20))
                            .frame(width: 180, height: 60)
                            .background(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
                            .cornerRadius(10)
                        //pay 버튼
                        NavigationLink(destination: OrderDetail(item: item)) {
                            Text("Pay")
                                .customButtonStyleRed()
                                .frame(width: 150)
                        
                        }
                    }
                }
                VStack{
                    HStack{
                        // x 버튼
                        Button(action: {
                            backButton.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 30)
                            
                        }
                        Spacer()
                        // 더보기 옵션 버튼
                        Menu{
                            Button(action:{
                                //편집 액션 추가 *******
                                self.showEditAlert = true
                            }) {
                                Label("Edit", systemImage: "pencil")
                            }
                            Button(action: {
                                self.showDeleteAlert = true
                            }) {
                                Label("Delete", systemImage: "trash")
                                    .foregroundColor(.red)
                            }
                        } label: {
                            
                            Image(systemName: "ellipsis.circle")
                                .font(.system(size: 30))
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                        
                        }
                    }
                    Spacer()
                }
            }
        }  .navigationBarBackButtonHidden(true)
        // 삭제 확인 팝업
            .alert(isPresented: $showDeleteAlert){
                Alert(
                    title: Text("Delete Menu"),
                    message: Text("Do you want to delete the menu?"),
                    primaryButton: .destructive(Text("Delete")){
                        
                    //여기에 삭제 로직 추가 *********
                    
                    backButton.wrappedValue.dismiss()
                    },
                    secondaryButton: .cancel()
                )
            }
    }
}

//프리뷰 위한 임시 값(메인이랑 상관 x)
struct MenuDetail_Previews: PreviewProvider {
    static var previews: some View {
        MenuDetail(item: menuItemInput(name: "Sample Coffee", price: "23 $", imageName: "cup.and.saucer.fill", note: "tasty"))
    }
}

