import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var isImmersiveViewActive = false
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        VStack{
            Text("Welcome to the Demo App")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                Task {
                    if isImmersiveViewActive {
                        await dismissImmersiveSpace()
                        isImmersiveViewActive = false
                    } else {
                        await openImmersiveSpace(id: "MyImmersiveSpace")
                        isImmersiveViewActive = true
                    }
                }
                
            }) {
                Text(isImmersiveViewActive ? "Exit Immersive Space" : "Enter Immersive Space")
                    .font(.title2)
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
