
import SwiftUI

struct ContentView: View {
    
    @State private var themColor: Color = .blue
    @State private var currentTime: Date = Date.now
    @State private var changeRandomColor: Bool = false
    
    private var colors: [Color]
    
    init() {
        colors = [.red, .yellow, .black, .green, .orange, .blue]
    }
    
    var body: some View {
        VStack {
            DigitalClock(foregroundColor: $themColor) { date in
                currentTime = date
                if changeRandomColor {
                    themColor = colors.randomElement() ?? themColor
                }
            }
            .shadow(color: Color.black.opacity(0.15), radius: 32)
            .padding(40)
            Text(currentTime, style: .time)
                .font(.system(size: 52))
                .bold()
            
            Toggle(isOn: $changeRandomColor) {
                Text("Change Color")
            }
            .padding(.horizontal, 30)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(themColor.opacity(0.15))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
