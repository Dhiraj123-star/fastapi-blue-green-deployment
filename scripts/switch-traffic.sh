#!/bin/bash

# 🔁 Auto-switch service traffic between blue and green and open the app in browser
set -e

SERVICE_NAME="fastapi-service"
APP_LABEL="fastapi-app"

echo "🔍 Checking current version routed by the service..."

CURRENT_VERSION=$(kubectl get service ${SERVICE_NAME} -o=jsonpath='{.spec.selector.version}')

if [ "$CURRENT_VERSION" == "blue" ]; then
  NEW_VERSION="green"
  OLD_VERSION="blue"
else
  NEW_VERSION="blue"
  OLD_VERSION="green"
fi

echo "🔁 Current version: $CURRENT_VERSION"
echo "🚀 Switching traffic to: $NEW_VERSION"

DEPLOYMENT_FILE="k8s/deployment-${NEW_VERSION}.yaml"
DEPLOYMENT_NAME="fastapi-${NEW_VERSION}"

# 🚫 Delete old deployment if it exists
if kubectl get deployment fastapi-${NEW_VERSION} > /dev/null 2>&1; then
  echo "🧹 Deleting existing $DEPLOYMENT_NAME deployment..."
  kubectl delete deployment $DEPLOYMENT_NAME
fi

# ✅ Apply new deployment
echo "📦 Applying $NEW_VERSION deployment..."
kubectl apply -f "$DEPLOYMENT_FILE"

# ⏳ Wait for the new pod to be ready
echo "🧪 Waiting for $NEW_VERSION pod to become ready..."
kubectl wait --for=condition=ready pod -l app=$APP_LABEL,version=$NEW_VERSION --timeout=60s

# 🔧 Patch service to point to the new version
echo "🔧 Patching service selector to $NEW_VERSION..."
kubectl patch service $SERVICE_NAME \
  -p "{\"spec\": {\"selector\": {\"app\": \"$APP_LABEL\", \"version\": \"$NEW_VERSION\"}}}"

# ⏱ Give DNS routing a moment to settle
echo "⏳ Waiting briefly for routing to stabilize..."
sleep 3

# 🌐 Open service
echo "🌐 Opening service in browser..."
minikube service $SERVICE_NAME

echo "✅ Traffic switched to $NEW_VERSION and service opened!"
