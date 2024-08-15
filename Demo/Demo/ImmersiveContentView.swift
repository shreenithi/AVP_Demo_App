import SwiftUI
import RealityKit

struct ImmersiveContentView: View {
    var body: some View {
        ZStack{
            RealityView { content in
                // Add a textured sphere to the RealityView
                let sphereEntity = createTexturedSphere(named: "Immersive_Image")
                content.add(sphereEntity)
            }
            HotspotView()
        }
        
    }
    
    private func createTexturedSphere(named imageName: String) -> Entity {
        let largeSphere = MeshResource.generateSphere(radius: 1000) // Large sphere to encompass the user
        var material = UnlitMaterial()
        
        // Load the texture and set the material
        if let texture = try? TextureResource.load(named: imageName) {
            material.color = .init(texture: .init(texture))
        } else {
            print("Error Loading Texture: \(imageName), using default color")
            material.color = .init(tint: .gray) // Fallback to gray if texture fails
        }
        
        let sphereEntity = Entity()
        sphereEntity.components.set(ModelComponent(mesh: largeSphere, materials: [material]))
        sphereEntity.scale = .init(x: -1, y: 1, z: 1) // Invert the sphere so it is viewed from the inside
        return sphereEntity
    }
}
