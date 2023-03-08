//
//  Home.swift
//  ResizableHeader
//
//  Created by Abdullah Karaboğa on 7.03.2023.
//

import SwiftUI

struct Home: View {
    var body: some View {

        GeometryReader { proxy in
            let safeAreaTop = proxy.safeAreaInsets.top
            ScrollView(.vertical, showsIndicators: false) {

                VStack {
                    HeaderView(safeAreaTop)
                    
                    VStack{
                        ForEach(1...10,id:\.self) { _ in
                            RoundedRectangle(cornerRadius: 10,style: .continuous)
                                .fill(.blue.gradient)
                                .frame(height: 220)
                        }
                    }
                    .padding(15)
                }
            }
                .edgesIgnoringSafeArea(.top)
        }
    }

    @ViewBuilder
    func HeaderView(_ safeAreaTop: CGFloat) -> some View {

        VStack(spacing: 15) {
            HStack(spacing: 15) {
                HStack(spacing: 8) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)

                    TextField("Search", text: .constant(""))
                        .tint(.red)
                }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.black)
                        .opacity(0.15)
                }
            }

            HStack(spacing: 0) {
                CustomButton(symbolImage: "rectangle.potrait.and.arrow.forward", title: "Deposit") {

                }
                CustomButton(symbolImage: "dollarsign", title: "Withdraw") {

                }
                CustomButton(symbolImage: "qrcode", title: "QR Code") {

                }
                CustomButton(symbolImage: "qrcode.viewfinder", title: "Scanning") {

                }
            }
            .padding(.top, 10)
        }
            .environment(\.colorScheme, .dark)
            .padding([.horizontal, .bottom], 15)
            .padding(.top, safeAreaTop + 10)
            .background {
            Rectangle()
                .fill(.red.gradient)
        }
    }

    @ViewBuilder
    func CustomButton (symbolImage: String, title: String, onClick: @escaping() -> ()) -> some View {
        Button {

        } label: {
            VStack(spacing: 8) {
                Image(systemName: symbolImage)
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .frame(width: 35, height: 35)
                    .background {
                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                        .fill(.white)
                }
                Text(title)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .foregroundColor(.white)
            }
                .frame(maxWidth: .infinity)
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
