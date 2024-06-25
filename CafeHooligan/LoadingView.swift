//
//  LoadingView.swift
//  CafeHooligan
//
//  Created by 신효범 on 6/25/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isActive = false
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack{
                Image("loadingImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 500, height: 900)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        isActive = true
                    }
                }
            }
        }
    }
    
    struct SplashScreenView_Previews: PreviewProvider {
        static var previews: some View {
            LoadingView()
        }
    }
}
