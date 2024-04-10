# Aurras: Accelerated Keyword Spotting on Caravel SoC
[Overview](#overview) | [Objectives](#objectives) | [Prompt Methodology](#prompt-methodology) | [Architecture](#architecture) | [Machine Learning Model](#machine-learning-model) | [License](#license) | [Acknowledgments](#acknowledgments)

## Overview
This project addresses a cutting-edge challenge: leveraging generative AI to develop an open-source hardware accelerator tailored for Keyword Spotting (KWS) applications, implemented on the Caravel System-on-Chip. Our approach harnesses high-level software abstractions, specifically ONNX ([Open Neural Network Exchange](https://onnx.ai/)), to optimize the KWS machine learning model and the audio feature extractor enhancing energy efficiency and seamless integration into the Caravel SoC environment.

We are pioneering the use of an open source and sophisticated hardware abstraction layer, Chipyard ([UCB-BAR Chipyard](https://github.com/ucb-bar/chipyard)), to facilitate the design and integration process. Through Chipyard, we aim to create a specialized application RISC-V core paired with a state-of-the-art AI accelerator, Gemmini ([Gemmini Project](https://github.com/ucb-bar/gemmini)), leveraging the latest advancements in Large Language Models (LLMs) and AI prompting techniques. This innovative combination is poised to set new standards for performance and efficiency in hardware-accelerated KWS, opening new pathways for research and development in embedded AI applications on Caravel SoC([efabless](https://github.com/efabless/caravel)).



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

## Machine Learning Model
Discuss the machine learning model used in this project, including its design, optimization for the Gemmini core, and any unique features or challenges associated with its implementation and integration into the overall system.

## License
This project is open source under the Apache License 2.0. For more details, see the LICENSE file in the project repository.

## Acknowledgments
Recognition of contributions from individuals, organizations, and projects.
