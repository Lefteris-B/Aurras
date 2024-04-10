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
The Prompt Methodology is a central aspect of our approach to leveraging generative AI within the hardware design process. We use advanced prompt engineering techniques to facilitate complex reasoning and context-aware responses from the AI models, tailored specifically for digital design tasks.

### Prompt Engineering
We utilized the Chain Of Thought (CoT) technique for prompt engineering:

Digital design is a really complex task that requires complex reasoning and produces context-aware responses. These tasks (like creating an FSM) require multiple intermediate reasoning steps.

![Chain of Thought in Prompt Engineering](/images/prompt_eng.png)

### Prompting Patterns
To refine the process of interacting with LLMs, we employed two specific prompting patterns: "Recipe" and "Persona."

**Recipe**: In order to gather the necessary steps to create a hardware trojan using an LLM, we enhanced our prompt engineering techniques by using the Recipe prompt pattern:

The main intent of this process is to gather a sequence of steps with an intent to create the trojan (for example, “I would like to add ‘X’ feature to my codebase. I need to perform steps A, B, C. Provide a sequence for me and fill in any missing steps.”). Using this pattern, the LLM will analyze a concrete sequence of steps for creating with purpose the trojan (for example, “Identify any unnecessary steps”).

**Persona**: We then used the Persona prompt pattern to:

- Provide the LLM with intent (for example, “Act as a digital engineer”) and conceptualize context (refactor the code, provide Verilog files).
- Give the LLM motivation to achieve a certain task (for example, “refactor the code to provide extended functionality”).
- Structure fundamental contextual statements around key ideas (for example, “Provide code that a digital designer would create”).
- Provide example code for the LLM to follow along using the Chain of Thought prompt engineering technique (for example, “This part of code ‘X’ from my codebase needs new features.”).

For a deeper understanding of the techniques used, please refer to the paper by J. Wei et al.: “Chain-of-Thought Prompting Elicits Reasoning in Large Language Models,” 2022, doi: [10.48550/ARXIV.2201.11903](https://doi.org/10.48550/ARXIV.2201.11903).


## Architecture
The architecture of our hardware accelerator is meticulously designed to balance performance, efficiency, and scalability. It is crucial for enabling the complex computations required for Keyword Spotting (KWS) while maintaining energy efficiency and optimizing the use of silicon area.

### Number Representation
Choosing the appropriate number representation is pivotal in influencing the accuracy, area, and energy cost of hardware accelerators. Common number systems include integers, floats, and brain floats (bfloats). Integers are typically used for quantized models, offering lower energy cost and area but at a potential loss of accuracy. Floats, including the standard IEEE 754 and bfloat16, provide a wider dynamic range, which is beneficial for maintaining the precision of calculations. Bfloats are a compromise, providing enough precision for deep learning while reducing complexity. The selection of number representation is a critical design decision that impacts the trade-offs between accuracy, computational area, and energy efficiency.

![Number Representation Impact](/images/number_representation.png)

![Energy Cost of Different Number Representations](/images/number_energy_cost.png)

### Dataflow
Gemmini's architecture supports different dataflow optimizations to accommodate various computational needs. "Weight Stationary" dataflow keeps the weights stationary and streams the activations, which can minimize memory access for weights and is efficient when the weights are reused. "Output Stationary" dataflow, on the other hand, keeps the outputs stationary and streams both the weights and activations. This can be advantageous when the output activations need to be reused. The flexibility to choose between these dataflow patterns allows programmers to tailor the hardware accelerator's operation to the specific needs of their application.

![Dataflow Optimizations in Gemmini](/images/dataflow.png)

### Dimensions
The dimensions of the hardware and software components significantly influence the system's overall capabilities. The size of the hardware components, such as the systolic array in Gemmini, directly correlates with the computational power and throughput. Complexity arises from the integration of multiple components and the need for precise timing and control logic. Scalability is a key design feature, allowing the system to adapt to different KWS models and workloads, ensuring that our accelerator can meet both current and future demands without requiring complete redesigns.

### Pipelining
Pipelining is a crucial feature in Gemmini that enhances the execution of matrix multiplication operations, a common task in deep learning models. By effectively using pipelining, Gemmini can overlap the execution of multiple instructions, which helps to utilize the hardware more efficiently and increase the throughput. Specifically, Gemmini leverages memories that hold the same data across different pipeline stages to improve energy consumption. This approach reduces the need for repeated memory accesses for the same data, thus saving power and time, and it is particularly effective in deep neural network computations where such data reusability is common.

![Gemmini Pipelining](/images/pipelines.png)

### Application Core
The Chipyard CPU, serving as the application core in our system, plays an instrumental role in managing and coordinating tasks. It orchestrates the data flow, controls the execution of instructions, and handles the interface between the software and the Gemmini accelerator. This integration enables efficient use of the Gemmini's systolic array architecture, ensuring that operations are performed with optimal timing and resource utilization. The Chipyard CPU thus acts as the central control unit that aligns the software's computational needs with the hardware's processing capabilities, enabling our KWS accelerator to achieve high efficiency and performance.

![Gemmini and Application Core Integration](/images/gemmini_arch.png)


### Config Files
Configuration files play a pivotal role in customizing the operation of our hardware system to match specific use cases and requirements. These files dictate the behavior of the hardware by setting parameters such as data precision, memory allocation, power settings, and processing speeds. For our KWS application, the configuration files will be crucial for fine-tuning the system's performance to the algorithm's needs. We plan to use Large Language Models (LLMs) to aid in the creation of these config files. By providing the LLM with the KWS algorithm requirements, we can generate configuration files that are optimized for those criteria, ensuring that the system operates under the ideal conditions for each task.

### Full System Visibility
Full system and full stack visibility are critical for diagnosing performance bottlenecks and optimizing system behavior. By providing a holistic view of the system's operation, we can identify issues such as resource contention, where multiple processes compete for the same hardware resources, leading to inefficiencies. Cache coherence protocols are monitored to prevent stale data within multi-level cache hierarchies, while miss rates and latencies are analyzed to optimize memory access patterns. Page faults and TLB (Translation Lookaside Buffer) hits are scrutinized to enhance virtual memory management. 

Additionally, visibility into unaccelerated kernels helps identify potential areas for hardware acceleration. Monitoring interrupts and context switches is vital for understanding the system's responsiveness and the overhead incurred by the operating system. Through Chipyard's SoC, we have the capabilities to instrument and observe these various metrics, providing a full system perspective that spans from the hardware level to the software stack. This allows for a comprehensive performance analysis, enabling developers to make informed decisions to fine-tune both the hardware configuration and the software to work in concert, thereby improving overall system performance and efficiency.


### Full Stack Visibility
Achieving full stack visibility is imperative for fine-grained performance tuning and effective debugging. Gemmini is engineered to offer direct hardware configuration, allowing intricate customization at the hardware level to meet the exact needs of the Keyword Spotting (KWS) application. It operates with a low-level Instruction Set Architecture (ISA), which provides detailed control over the accelerator's operations, enabling the precise timing and manipulation of data flows within the hardware.

Beyond these lower levels of control, Gemmini is also designed to work seamlessly with high-level runtimes such as ONNX, TensorFlow, and PyTorch. This dual capability ensures that developers can operate at the abstraction level most appropriate for their task—whether that's close to the metal for maximum performance tuning or at a higher level for ease of use and flexibility. The high-level integration allows for the rapid deployment of state-of-the-art machine learning models, while the direct hardware access ensures that the underlying accelerator can be finely tuned for optimal performance.

![Full Stack Visibility in Gemmini](/images/full_stack_vis.png)



### Verification
Verification is a critical step to ensure that our system not only meets the design specifications but also performs reliably under real-world conditions. We use a combination of simulation tools and hardware verification languages, to create comprehensive test benches. Also workflow specific test environments help us to verify the functionality of each component and the system as a whole. Additionally, formal verification methods are applied to prove the correctness of algorithms and to find edge-case bugs that are otherwise difficult to detect through traditional testing. Finally test code is run in the simulated core to verify the computational corectness of the system.

### Functional Coverage
Functional coverage is a metric used to assess the completeness of our testing and verification efforts. By defining a set of functional scenarios that the system should be able to handle, we can measure how many of these scenarios have been successfully tested. This not only ensures that all features are covered but also helps to identify any gaps in the test plan. In this project, functional coverage provides us with the confidence that our KWS accelerator has been rigorously tested and is ready for deployment. We track coverage statistics to pinpoint which aspects of the design have been thoroughly verified and which may require additional testing and/or optimization.

### Performance Profiling
Details the techniques used to analyze the system's performance, identify bottlenecks, and optimize efficiency.

## Machine Learning Model
Discuss the machine learning model used in this project, including its design, optimization for the Gemmini core, and any unique features or challenges associated with its implementation and integration into the overall system.

## License
This project is open source under the Apache License 2.0. For more details, see the LICENSE file in the project repository.

## Acknowledgments
Recognition of contributions from individuals, organizations, and projects.
