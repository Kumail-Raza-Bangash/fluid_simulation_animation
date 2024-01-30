// import 'package:flutter/material.dart';
// import 'package:fluid_simulation/fluid_simulation.dart';

//   class FluidExample extends StatefulWidget {
//     const FluidExample({Key? key}) : super(key: key);

//     @override
//     _FluidExampleState createState() => _FluidExampleState();
//   }

//   class _FluidExampleState extends State<FluidExample> {
//     // Create a FluidSimulationController to control the fluid simulation
//     late FluidSimulationController _controller;

//     @override
//     void initState() {
//       super.initState();
//       // Initialize the controller with some parameters
//       _controller = FluidSimulationController(
//         viscosity: 0.1,
//         density: 1.0,
//         color: Colors.blue,
//       );
//     }

//     @override
//     void dispose() {
//       // Dispose the controller when the widget is disposed
//       _controller.dispose();
//       super.dispose();
//     }

//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Fluid Example'),
//         ),
//         body: Center(
//           // Use the FluidSimulation widget to display the fluid simulation
//           child: FluidSimulation(
//             controller: _controller,
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Reset the fluid simulation
//             _controller.reset();
//           },
//           child: const Icon(Icons.refresh),
//         ),
//       );
//     }
//   }