
# Week3 Challenge: Implement a 2-tier architecture in AWS, Azure or GCP using Terraform 🚀

## Objective
In this project task, we aim to leverage infrastructure as code (IaC) best practices to create a reusable and shareable infrastructure setup. Our focus is on promoting modularity, flexibility, and maintainability.

## Key Guidelines

### 1. Leverage Modules
Utilize modules to break down your infrastructure code into reusable and shareable components. This approach not only makes your code more organized but also allows other team members to easily incorporate and adapt the components for their specific needs.

### 2. Use Variables and Data Sources
Implement variables and data sources in your IaC code to enhance flexibility and maintainability. Variables make it easier to adapt and modify configuration settings, while data sources allow you to retrieve information from external sources to inform your infrastructure.

### 3. Remote State File
Store your state file remotely. This practice enhances collaboration, security, and version control of your IaC code. Consider using a remote state storage service provided by your infrastructure as code platform, such as Terraform Cloud or AWS S3.

### 4. Security First
Keep security in mind throughout your IaC development. Ensure that your infrastructure is configured with appropriate security measures, adhering to best practices for secure and compliant deployments.

By following these guidelines, you'll create an infrastructure setup that is not only efficient but also highly adaptable and secure.

Feel free to document your IaC code and any specific implementation details in your GitHub README to make it easier for others to understand and use your work.


## Deliverables 📦

In this challenge, you are expected to produce the following deliverables:

### 1. Architecture Diagram 🏗️
A comprehensive architecture diagram illustrates how the various cloud services and components fit together. You can use tools like draw.io, Lucidchart, or any other diagramming tool of your choice to create the diagram. 📊

### 2. Blog and GitHub Readme 📄
You should document your progress and steps taken during the challenge. This documentation could be in the form of a blog post and reference your public GitHub repo. Include code snippets, configuration files, and explanations for each step. Share your insights and learning experiences. 📝

**Here's a suggested outline for your documentation:**

- **Introduction**: Briefly introduce the challenge and its objectives. 📋
- **Step-by-Step Guide**: Provide a detailed completed task walkthrough. Include code examples and configurations where applicable. 💡
- **Challenges Faced**: Discuss any challenges you encountered and how you overcame them. 🤔
- **Key Takeaways**: Share your key learnings from this week's challenge. 🧐
- **Resources**: List any helpful resources or references you used. 📚

### Why terraform backend.tf and .tfstate are required

- .tfstate is the file that has all the infra that are already provisioned through Terrform
- let ussay you have two ec2 instances and you want to edit terraform config to create one more Ec2 instance
- .tfstate will compare your existing infra connfig and add only the newer ones instead of overwriting to make sure the infra prvisioing is seamless
### backend.tf

- This is required for us to save the .tfstate file in remote storage like AWS S3 or whatever maybe the storage in Azure or GCP
- If this file is missing then the .tfstate would be stored locally which can contain secrets like password that are highligy risky
- This file can't take variables, hence we need to hardcode all the values 
#### Why DynamDB required ✅
- When your ```.tfstate``` file is AWS S3, there is a possibility that multiple user accessing this file, hence there is a high chance that the file can get locked.
- To avoid ```.tfstate``` from getting locked, you need DynamoDB table with a partion key as ** LockID ** 
### Reference resources: ✅
💡 If you have completed the week2 challenge then you are already familiar with the networking concepts, feel free to use the below resources to get started with Terraform

- [Terraform Overview](https://youtu.be/l5k1ai_GBDE)
- [AWS Terraform](https://youtu.be/ZP_vAbjfFMs)
- [Terraform Best Practices](https://youtu.be/gxPykhPxRW0)
- [Terraform Modules](https://youtu.be/W92fsWzVRsg)
- [Azure Terraform](https://youtu.be/I-MbnfNcikk)


