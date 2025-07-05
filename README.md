# 🚀 fastapi-blue-green-deployment

A production-ready FastAPI application deployed using Docker and Kubernetes with a zero-downtime **blue-green deployment strategy**. Perfect for demonstrating modern DevOps practices in a local or cloud-native environment. 🌐🐳☸️

---

## ✨ Key Functionalities

- ⚡ **FastAPI Web Service**  
  A high-performance REST API built using FastAPI and Uvicorn.

- 📦 **Dockerized for Portability**  
  Packaged into a lightweight Docker image and pushed to Docker Hub.

- ☸️ **Kubernetes Deployments (Minikube)**  
  Deployed in a local Kubernetes cluster using Minikube.

- 🔄 **Blue-Green Deployment Strategy**  
  Seamless switching between "blue" and "green" deployments with zero downtime.

- 🔁 **Traffic Switching on Demand**  
  Route traffic between versions using `kubectl patch` for safe updates and rollbacks.

- 🧠 **Resource-Conscious Containers**  
  Includes resource requests and limits to prevent noisy neighbor issues.

- 🌍 **Live Service Exposure**  
  Instantly access the running API via `minikube service fastapi-service`.

---

## 🎯 Ideal For

- Demonstrating CI/CD and deployment strategies  
- Showcasing DevOps skills in portfolios and interviews  
- Learning how to deploy Python microservices in Kubernetes

---

