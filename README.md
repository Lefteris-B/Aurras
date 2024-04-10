# Aurras: Accelerated Keyword Spotting on Caravel SoC
[Overview](#overview) | [Objectives](#objectives) | [Prompt Methodology](#prompt-methodology) | [Architecture](#architecture) | [Machine Learning Model](#machine-learning-model) | [License](#license) | [Acknowledgments](#acknowledgments)

## Overview
This project tackles the ambitious goal of developing an open-source hardware accelerator for Keyword Spotting (KWS) applications, seamlessly integrated into the Caravel System-on-Chip. By leveraging the ONNX framework ([Open Neural Network Exchange](https://onnx.ai/)), we aim to optimize both the KWS machine learning model and audio feature extraction processes, enhancing energy efficiency within the Caravel SoC ecosystem.

A cornerstone of our approach is the novel application of Large Language Models (LLMs) in the generation of configuration files for Chipyard ([UCB-BAR Chipyard](https://github.com/ucb-bar/chipyard)), a sophisticated hardware abstraction layer. These LLM-generated configurations,aligning with the latest advancements in AI prompting techniques, tailor the creation of an application-specific RISC-V core and a Gemmini-based AI accelerator ([Gemmini Project](https://github.com/ucb-bar/gemmini)). Subsequently, Chipyard utilizes these configurations to generate the Verilog files necessary for the application core and the AI accelerator, bridging the gap between high-level conceptualization and hardware realization.

The integration of LLMs for configuration generation represents a groundbreaking approach to hardware design, promising to streamline the development process and unlock new efficiencies in the creation of specialized computing solutions. This project not only aims to advance the field of embedded AI applications but also to establish a new paradigm for leveraging generative AI in hardware development.




## Objectives
The primary goals of this project are to demonstrate state-of-the-art capabilities in hardware acceleration for Keyword Spotting (KWS) applications, leveraging the Caravel System-on-Chip with an innovative integration of generative AI, Chipyard, and Gemmini. Our key objectives include:

- **High Performance**: Achieve unparalleled processing speed and response time for KWS applications, making real-time processing feasible even on resource-constrained devices.

- **Optimized Area**: Efficiently utilize the available silicon area to maximize the functionality and performance of the KWS accelerator within the spatial constraints of the Caravel SoC.

- **Energy Efficiency**: Minimize power consumption to extend battery life in portable devices and reduce the carbon footprint of computing infrastructure, making our solution ideal for sustainable technology development.

- **Verified Architecture**: Employ rigorous verification methodologies to ensure the architecture is robust, reliable, and capable of meeting the demands of complex KWS tasks under various conditions.

- **Integration**: Seamlessly integrate with the Caravel SoC environment, ensuring compatibility and cohesiveness across hardware and software components.

- **Full System Visibility**: Provide comprehensive monitoring capabilities at the system level to enable detailed performance analysis and troubleshooting.

- **Full Stack Visibility**: Extend visibility into the software stack, allowing developers and researchers to optimize applications and system software for maximum efficiency.

- **Programmability**: Ensure ease of programming and flexibility in deploying various KWS models and algorithms, enabling rapid prototyping and iteration.

- **Usage Of High-Level Runtimes**: Support high-level runtimes such as ONNX, TensorFlow, and PyTorch, facilitating the use of cutting-edge AI models and frameworks in KWS applications.

- **Open Source**: Commit to an open-source model, fostering community collaboration, transparency, and the democratization of AI and hardware innovation.

By meeting these objectives, we aim to push the boundaries of what's possible in embedded AI applications, providing a versatile, efficient, and accessible platform for research and development in the field of keyword spotting and beyond.

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

## Machine Learning Model
Discuss the machine learning model used in this project, including its design, optimization for the Gemmini core, and any unique features or challenges associated with its implementation and integration into the overall system.

## License
This project is open source under the Apache License 2.0. For more details, see the LICENSE file in the project repository.

## Acknowledgments
Recognition of contributions from individuals, organizations, and projects.
