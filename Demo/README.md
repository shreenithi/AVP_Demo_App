# VisionOS Demo App

This is a demo app built for VisionOS, showcasing how to create an immersive environment using RealityKit. The app demonstrates basic interactions, such as changing the color of a 3D sphere when it is tapped in the immersive space.

## Features

- **Immersive Environment**: Displays a 3D environment with a textured skybox.
- **Interactive Hotspots**: Users can interact with 3D hotspots that change color upon being tapped.
- **Smooth User Experience**: The app is optimized for VisionOS, providing a smooth and responsive user interface.

## Prerequisites

### Hardware

- **Mac**: Running macOS Sonoma (14.0) or later.
- **Vision Pro**: Optional, required only for testing on a physical device.

### Software

- **Xcode**: Version 15 or later, with VisionOS SDK.
- **Apple Developer Account**: Required for deploying to a Vision Pro device. (Testing on the simulator does not require an Apple Developer account.)

## Installation

1. **Clone the Repository**
   - `git clone https://github.com/your-username/visionos-demo-app.git`
   - `cd visionos-demo-app`

2. **Open the Project in Xcode**
   - Open `DemoApp.xcodeproj` in Xcode.

3. **Install Required Components**
   - When prompted by Xcode, install any additional required components.

## Usage

1. **Build and Run the App**
   - Select the VisionOS Simulator from the list of available devices in Xcode.
   - Click on the `Run` button or press `Cmd + R` to build and run the app.

2. **Interact with the App**
   - In the simulator, tap on the red sphere to change its color to green.
   - The 3D text above the sphere and the immersive environment enhance the interactive experience.

## Customization

You can customize the app by modifying the following files:

- **`DemoApp.swift`**: The main entry point of the app, where the window group and immersive space are set up.
- **`ContentView.swift`**: The main user interface, containing buttons to toggle immersive mode.
- **`ImmersiveContentView.swift`**: Handles the immersive environment, including the 3D skybox and hotspots.
- **`HotspotView.swift`**: Manages the creation and interaction of 3D hotspots.
