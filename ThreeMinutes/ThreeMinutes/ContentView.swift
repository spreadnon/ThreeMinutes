//
//  ContentView.swift
//  ThreeMinutes
//
//  Created by iOS123 on 2020/7/15.
//  Copyright © 2020 CQL. All rights reserved.
//

import SwiftUI

let items: [BottomBarItem] = [
    BottomBarItem(icon: "house.fill", title: "Home", color: .purple),
    BottomBarItem(icon: "heart", title: "Likes", color: .pink),
    BottomBarItem(icon: "magnifyingglass", title: "Search", color: .orange),
    BottomBarItem(icon: "person.fill", title: "Profile", color: .blue)
]
struct BasicView: View {
    let item: BottomBarItem

    var detailText: String {
    "\(item.title) Detail"
}

var followButton: some View {
    Button(action: openTwitter) {
        VStack {
            Text("Developed by Bezhan Odinaev")
                .font(.headline)
                .foregroundColor(item.color)

            Text("@smartvipere75")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

var destination: some View {
    Text(detailText)
        .navigationBarTitle(Text(detailText))
}

var navigateButton: some View {
    NavigationLink(destination: destination) {
        ZStack {
            Rectangle()
                .fill(item.color)
                .cornerRadius(8)
                .frame(height: 52)
                .padding(.horizontal)

            Text("Navigate")
                .font(.headline)
                .foregroundColor(.white)
        }
    }
}

func openTwitter() {
    guard let url = URL(string: "https://twitter.com/smartvipere75") else {
        return
    }
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
}

var body: some View {
    VStack {
        Spacer()

        followButton

        Spacer()

        navigateButton
        }
    }
}

struct ContentView : View {
    @State private var selectedIndex: Int = 0

    var selectedItem: BottomBarItem {
        items[selectedIndex]
    }

var body: some View {
        NavigationView {
            VStack {
                BasicView(item: selectedItem)
                    .navigationBarTitle(Text(selectedItem.title))
                BottomBar(selectedIndex: $selectedIndex, items: items)
            }
        }
    }
}


/*
struct Pokemon: Identifiable {
  let id = UUID()
  let name: String
  let type: String
  let color: Color
}

var foreverAnimation: Animation {
//       Animation.linear(duration: 0.3)
    Animation.easeIn
       .repeatForever()
}

extension View {
    public func flip() -> some View {
        return self
            .rotationEffect(.radians(.pi))
            .scaleEffect(x: -1, y: 1, anchor: .center)
    }
}

struct PushContainer<Content: View> : View {
    let main: AnyView
    var body: some View {
        GeometryReader { proxy in
            self.generateBody(proxy: proxy)
        }.animation(.default)
    }
    init(content: Content) {
        self.main = AnyView.init(content)
    }
    func generateBody(proxy: GeometryProxy) -> some View {
        return ZStack {
            self.main
        }}}

class BaseNavigationModel: ObservableObject {
    @Published var isPushActive: Bool = false
    @Published
    private(set) var mainView: AnyView?
    public func pushMain<Main: View>(view: Main) {
        // First pop if any other view has been pushed
        isPushActive = false
        let container = PushContainer(content: view)
        self.mainView = AnyView(container)
        // Push view
        isPushActive = true}}

struct BaseNavigationView<Content>: View where Content: View {
    @ObservedObject var model: BaseNavigationModel
    var content: () -> Content
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    self.content()
                    if self.model.mainView != nil {
                        NavigationLink(destination: self.model.mainView!, isActive: self.$model.isPushActive, label: {
                            EmptyView()
                        }).isDetailLink(false)
                    }}}}}}



struct ContentView: View {
	
    
    let colors: [Color] = [.red, .green, .blue]

    
    var body: some View {
        ScrollView {
            ScrollViewReader { value in
                Button("Jump to #8") {
                    value.scrollTo(9)
                }

                ForEach(0..<10) { i in
                    Text("Example \(i)")
                        .frame(width: 300, height: 300)
                        .background(colors[i % colors.count])
                        .id(i)
                }
            }
        }
        
   
        
            

//                NavigationView {
//                    VStack {
//
//                        ScrollView(.vertical, showsIndicators: false) {
//
//                            VStack {
//
//                                ForEach(1...itemCount, id: \.self) { item in
//                                    Text("--- \(item) ---") // height 17.5
//                                }
//
//                            }
//
//                        }
//                        .content.offset(y: (self.verticalOffset + self.gestureOffset)
//                            // all the content divided by 2 for zero position of scroll view
//                            + CGFloat(17.5 * Double(self.itemCount/2)))
//                            .gesture(DragGesture().onChanged( { value in
//                                self.gestureOffset = value.translation.height
//                            }).onEnded( { value in
//                                withAnimation {
//                                    // here should calculate end position with value.predictedEndLocation.y
//                                    self.verticalOffset += value.translation.height
//                                    self.gestureOffset = 0.0
//                                }
//                            }))
//
//
//                    }.navigationBarItems(trailing: Button("To top!") {
//                        withAnimation {
//                            self.verticalOffset = 0.0
//                        }
//                    })
//                }

        
        
        /*
        ScrollView {

            VStack(alignment: .center) {

                Spacer(minLength: 50)

                TitleView()
                InformationContainerView()

                Spacer(minLength: 50)
                Button(action: {
                    let generator = UINotificationFeedbackGenerator()
                    generator.notificationOccurred(.success)
                }) {
                    Text("Continue")
                        .customButton()
                }
                .padding(.horizontal)
            }
        }
		*/
 
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Image("icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, alignment: .center)
                .accessibility(hidden: true)

            Text("Welcome to")
                .customTitleText()

            Text("3 Minutes")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Chat", subTitle: "Find my soul mate and just talk to my soul mate", imageName: "slider.horizontal.below.rectangle")

            InformationDetailView(title: "Precise", subTitle: "More precision with the steppers to get that 100 score.", imageName: "minus.slash.plus")

            InformationDetailView(title: "Score", subTitle: "A detailed score and comparsion of your gradient and the target gradient.", imageName: "checkmark.square")
        }
        .padding(.horizontal)
    }
}

struct InformationDetailView: View {
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)

                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor = Color(UIColor.systemIndigo)
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

 
 */
