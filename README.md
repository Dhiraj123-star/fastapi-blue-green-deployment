# 🚀 fastapi-blue-green-deployment

A production-grade FastAPI application deployed using Docker and Kubernetes with a zero-downtime **blue-green deployment strategy**, enhanced with a minimal HTML/CSS UI to clearly show which version is live. Perfect for demonstrating real-world DevOps workflows in both local and cloud environments. 🌐🐳☸️

---

## ✨ Key Functionalities

- ⚡ **FastAPI Web Service**  
  A high-performance REST API built using FastAPI and Uvicorn.

- 🎨 **Version-Aware HTML UI**  
  Each deployment (Blue or Green) displays a distinct background color and label using Jinja2 templates and external CSS.

- 📦 **Dockerized for Portability**  
  Packaged into a lightweight Docker image and pushed to Docker Hub.

- ☸️ **Kubernetes Deployments (Minikube)**  
  Deployed in a local Kubernetes cluster using Minikube with YAML manifests for blue and green versions.

- 🔄 **Blue-Green Deployment Strategy**  
  Seamless and safe switching between "blue" and "green" versions with zero downtime.

- 🔁 **Traffic Switching on Demand**  
  Easily route traffic between blue and green pods using `kubectl patch` for controlled rollouts and rollbacks.

- 🧠 **Resource-Conscious Containers**  
  Includes resource requests and limits to prevent noisy neighbor issues in shared environments.

- 🌍 **Live Service Exposure**  
  Instantly access the running FastAPI web app through `minikube service fastapi-service`.

---

## 🎯 Ideal For

- Demonstrating CI/CD, containerization, and deployment strategies
- Showcasing DevOps skills in portfolios and interviews
- Learning how to build and deploy Python microservices on Kubernetes
- Practicing zero-downtime upgrade patterns with visual validation

---

🚀 Built by [Dhiraj Kumar](https://github.com/dhiraj918106) to reflect best practices in containerized microservices and Kubernetes-native development.
