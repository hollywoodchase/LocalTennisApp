import SwiftUI

struct ContentView: View {
    let namesColumnA = ["Danny", "Bobby", "Roger", "Alice", "Eve", "Mallory", "Trent", "Peggy", "Victor"]
    
    // Randomly generate "lefty" or "righty" for Column B
    var namesColumnB: [String] {
        namesColumnA.map { _ in ["lefty", "righty"].randomElement()! }
    }
    
    // Randomly generate ages between 18 and 50 for Column C
    var agesColumnC: [Int] {
        namesColumnA.map { _ in Int.random(in: 18...50) }
    }

    let backgroundColor = Color(red: 0.6, green: 0.8, blue: 0.2) // Light green color

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Green background area above the header
                backgroundColor
                    .frame(height: 75) // Height of the green area above the header
                
                HStack(spacing: 0) {
                    Text("Name")
                        .frame(width: geometry.size.width / 3)
                        .padding(.vertical, 5) // 5 points margin top and bottom
                        .background(Color.white) // White background for header cells
                        .border(Color.black) // Black border for header cells
                    Text("Handed")
                        .frame(width: geometry.size.width / 3)
                        .padding(.vertical, 5) // 5 points margin top and bottom
                        .background(Color.white) // White background for header cells
                        .border(Color.black) // Black border for header cells
                    Text("Age")
                        .frame(width: geometry.size.width / 3)
                        .padding(.vertical, 5) // 5 points margin top and bottom
                        .background(Color.white) // White background for header cells
                        .border(Color.black) // Black border for header cells
                }
                
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(0..<namesColumnA.count, id: \.self) { index in
                            HStack(spacing: 0) {
                                VStack {
                                    Text(namesColumnA[safe: index] ?? "")
                                        .padding(.vertical, 5) // 5 points margin top and bottom
                                }
                                .frame(width: geometry.size.width / 3)
                                .background(Color.white) // White background for cells
                                .border(Color.black) // Black border for cells
                                
                                VStack {
                                    Text(namesColumnB[safe: index] ?? "")
                                        .padding(.vertical, 5) // 5 points margin top and bottom
                                }
                                .frame(width: geometry.size.width / 3)
                                .background(Color.white) // White background for cells
                                .border(Color.black) // Black border for cells
                                
                                VStack {
                                    Text("\(agesColumnC[safe: index] ?? 0)")
                                        .padding(.vertical, 5) // 5 points margin top and bottom
                                }
                                .frame(width: geometry.size.width / 3)
                                .background(Color.white) // White background for cells
                                .border(Color.black) // Black border for cells
                            }
                            .background(Color.white) // White background for entire row
                        }
                    }
                }
                
                // Image of a tennis ball centered below the table
                Spacer() // Fills the remaining space above the image
                
                Image("tennis_ball") // Reference to the image asset
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300) // Double the original size
                    .padding(.bottom, 100) // Margin from the bottom
                
                Spacer() // Fills the remaining space below the image
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(backgroundColor) // Yellow-green background for entire view
            .border(Color.black) // Adds border to the entire VStack
        }
        .edgesIgnoringSafeArea(.all) // Ensures the view takes up the full screen
    }
}

extension Array {
    subscript(safe index: Int) -> Element? {
        return index >= 0 && index < count ? self[index] : nil
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro") // Specify the device you want to preview
            .previewLayout(.device) // Ensures the preview matches the device screen size
    }
}
