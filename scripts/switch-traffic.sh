#!/bin/bash

# 🔁 Auto-switch service traffic between blue and green
set -e

SERVICE_NAME="fastapi-service"
APP_LABEL="fastapi-app"

echo "🔍 Checking current version routed by the service..."

# Get current version selector
CURRENT_VERSION=$(kubectl get service ${SERVICE_NAME} -o=jsonpath='{.spec.selector.version}')

if [ "$CURRENT_VERSION" == "blue" ]; then
  NEW_VERSION="green"
else
  NEW_VERSION="blue"
fi

echo "🔁 Current version: $CURRENT_VERSION"
echo "🚀 Switching traffic to: $NEW_VERSION"

# Apply deployment if not already done
DEPLOYMENT_FILE="k8s/deployment-${NEW_VERSION}.yaml"
if [ -f "$DEPLOYMENT_FILE" ]; then
  echo "📦 Applying $NEW_VERSION deployment..."
  kubectl apply -f "$DEPLOYMENT_FILE"
else
  echo "❌ Deployment file $DEPLOYMENT_FILE not found!"
  exit 1
fi

# Patch the service to route to the new version
kubectl patch service $SERVICE_NAME \
  -p "{\"spec\": {\"selector\": {\"app\": \"$APP_LABEL\", \"version\": \"$NEW_VERSION\"}}}"

echo "✅ Traffic switched to $NEW_VERSION!"
