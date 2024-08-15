import SwiftUI

@main
struct DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(width: 500, height: 200)
        
        ImmersiveSpace(id: "MyImmersiveSpace") {
                    ImmersiveContentView()
                }
    }
}
