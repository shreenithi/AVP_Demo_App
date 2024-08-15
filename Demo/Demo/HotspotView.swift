import SwiftUI
import RealityKit

struct HotspotView: View {
    var body: some View {
        RealityView { content in
            // Add a basic hotspot (a small red sphere)
            let hotspotEntity = createHotspotEntity()
            content.add(hotspotEntity)
        }
        .gesture(
            TapGesture()
                .targetedToAnyEntity()
                .onEnded { gestureValue in
                    if let tappedEntity = gestureValue.entity as? ModelEntity, tappedEntity.name == "Hotspot" {
                        // Change the color of the sphere when it's tapped
                        let selectedMaterial = SimpleMaterial(color: .link, isMetallic: false)
                        if var modelComponent = tappedEntity.components[ModelComponent.self] {
                            modelComponent.materials = [selectedMaterial]
                            tappedEntity.components.set(modelComponent)
                        }
                    }
                }
        )
    }
    
    private func createHotspotEntity() -> ModelEntity {
        let sphereMesh = MeshResource.generateSphere(radius: 0.5)
        var sphereMaterial = SimpleMaterial()
        sphereMaterial.color = .init(tint: .red.withAlphaComponent(0.8)) // Red color with some transparency
        
        let hotspotEntity = ModelEntity(mesh: sphereMesh, materials: [sphereMaterial])
        hotspotEntity.position = SIMD3(x: 0, y: 0, z: -5) // Position in front of the user
        hotspotEntity.name = "Hotspot"
        
        // Add CollisionComponent for interaction detection
        hotspotEntity.components.set(CollisionComponent(shapes: [ShapeResource.generateSphere(radius: 0.5)]))
        hotspotEntity.components.set(InputTargetComponent())
        
        
        // Add 3D text above the sphere
        let textMesh = MeshResource.generateText("Hotspot", extrusionDepth: 0.02, font: .systemFont(ofSize: 0.2))
        var textMaterial = SimpleMaterial()
        textMaterial.color = .init(tint: .white)
        let textEntity = ModelEntity(mesh: textMesh, materials: [textMaterial])
        textEntity.position = SIMD3(0, 0.6, 0) // Position text above the sphere
        
        hotspotEntity.addChild(textEntity)
        
        
        return hotspotEntity
    }
}
