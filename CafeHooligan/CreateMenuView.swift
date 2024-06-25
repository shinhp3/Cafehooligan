//
//  CreateMunuView.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/18/24.
//

import SwiftUI

struct CreateMenuView: View {
    @Environment(\.presentationMode) var backButton
    @State private var name: String = ""
    @State private var price: String = ""
    @State private var note: String = ""
    @State private var isImagePick = false
   
    
    var body: some View {
        NavigationView{
            //배경 색상
            ZStack{
                Color(UIColor(red: 56/255, green: 56/255, blue: 56/255, alpha: 1.0))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    ScrollView{
                        //New Menu 이름
                        VStack{
                            Text("New Menu")
                                .font(.largeTitle)
                                .padding()
                                .foregroundColor(.white)
                        }
                        
                        //이미지 추가 버튼
                        
                        VStack {
                            Button(action: {
                                self.isImagePick = true
                            }) {
                                ZStack {
                                    Rectangle()

                                        .fill(Color(UIColor(red: 38.0 / 255.0, green: 38.0 / 255.0, blue: 38.0 / 255.0, alpha: 1)))
                                        .frame(width: 300, height: 300)
                                        .cornerRadius(10)
                                        .padding()
                                    
                                    
                                    Text("Add an image")
                                        .foregroundColor(.white)
                                    
                                }
                            }
                            
                            //name 입력 창
                            Text("Name")
                                .customTextStyle()
                            TextField("Name", text: $name)
                                .foregroundColor(.white)
                                .customTextFieldStyle()
                                .frame(width: 300)
                            
                            //price 입력 창
                            Text("Price")
                                .customTextStyle()
                            TextField("price", text: $price)
                                .foregroundColor(.white)
                                .customTextFieldStyle()
                                .frame(width: 300)
                            
                            //note 입력 창
                            Text("Note")
                                .customTextStyle()
                            TextField("Note", text: $note)
                                .foregroundColor(.white)
                                .customTextFieldStyle()
                                .frame(width: 300)
                        }
                        
                    }
                    
                                        
                    HStack(spacing: -20) {
                        Button(action: {
                            self.backButton.wrappedValue.dismiss()
                        }) {
                            Text("Back")
                                .customButtonStyleGray()
                                .frame(width: 150)
                        }
                        Button(action: {
                            //메뉴 저장 로직 (여기에 저장로직 적으면 되십니다.)
                        }) {
                            Text("Save")
                                .customButtonStyleBlue()
                                .frame(width: 200)
                        }
                        
                    }
                }
            }
        }  .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    CreateMenuView()
}
