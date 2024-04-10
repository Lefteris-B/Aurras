# Project Name: Accelerated Keyword Spotting on Caravel SoC
[Overview](#overview) | [Objectives](#objectives) | [Prompt Methodology](#prompt-methodology) | [Architecture](#architecture) | [Getting Started](#getting-started) | [Contributing](#contributing) | [License](#license) | [Acknowledgments](#acknowledgments)

## Overview
This project integrates a Rockchip processor and Gemmini core with the Caravel SoC's RISC-V CPU via the Wishbone bus, focusing on creating an energy-efficient hardware accelerator for Keyword Spotting (KWS) applications.

## Objectives
- **High Performance**: Utilize the computational capabilities of Rockchip and Gemmini for KWS.
- **Energy Efficiency**: Optimize for low power consumption.
- **Integration**: Ensure seamless component interaction through the Wishbone bus.
- **Open Source**: Develop and maintain as an open-source project.

## Prompt Methodology
This section explores the strategies and designs behind the AI prompts used in our project, emphasizing their role in achieving efficient and effective AI interactions.

### Prompt Engineering
Details the process of crafting prompts to effectively communicate with AI models, including considerations for clarity, specificity, and the inclusion of context to guide model responses.

### Prompt Patterns
Explores common patterns and templates used in our prompts, highlighting how these structures facilitate consistent and reliable AI interactions across different scenarios.

## Architecture
This section delves into the specifics of our system's architecture, detailing the interaction between components and the design decisions that drive performance and efficiency.

### Dataflow
Explains the movement of data through our system, from input to processing to output.

### Dimensions
Details the size, complexity, and scalability of our hardware and software components.

### Pipelining
Describes how tasks are divided and processed in parallel to improve efficiency.

### Host CPU
Discusses the role of the Caravel SoC's RISC-V CPU in managing and coordinating tasks.

### Config Files
Outlines the configuration files used to customize the system's operation for various use cases.

### Verification
Describes the methods and tools used to ensure the system meets design specifications.

### Simulation
Covers the simulation tools and environments used to model the system's performance and identify potential issues.

### Functional Coverage
Explains how we measure the completeness of our testing and verification efforts.

### Performance Profiling
Details the techniques used to analyze the system's performance, identify bottlenecks, and optimize efficiency.

## Component Overview
- **Rockchip Processor**: Serves as the primary processing unit, handling complex computational tasks.
- **Gemmini Core**: Accelerates matrix multiplication operations essential for DNNs. Now enhanced with:
    - **Full-System Visibility**: Allows comprehensive monitoring of system operations.
    - **Full-Stack Visibility**: Provides insight into the entire software stack's performance.
    - **Programming Model**: Describes the model used for developing software that leverages the Gemmini core.
- **Caravel SoC and Wishbone Bus**: Facilitates communication and integration of components within the system.

## Getting Started
Follow these steps to set up the project environment and begin development.

### Prerequisites
List of necessary tools, libraries, and hardware.

### Installation
Step-by-step guide for setting up the project.

## Usage
Instructions on how to deploy and utilize the system for KWS applications.

## Contributing
Guidelines for contributing to the project, including coding standards, pull request procedures, and how to report bugs.

## License
Details of the project's open-source license.

## Acknowledgments
Recognition of contributions from individuals, organizations, and projects.
