//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jason on 2023/9/19.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10){
                Image("empty")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .padding(.vertical, 20)
                Text("Are you a productive person? I think you should click the add button and add a bunch of items to your todo list!")
                    .frame(width: 400)
                    .padding(.bottom, 20)
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 😊")
                            .foregroundStyle(Color.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: 300)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    }
                )
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(
            deadline: .now() + 1,
            execute: {
                withAnimation(
                    Animation.easeInOut(duration: 2).repeatForever()
                ){
                    animate.toggle()
                }
            }
        )
    }
}

#Preview {
    NoItemsView()
}
