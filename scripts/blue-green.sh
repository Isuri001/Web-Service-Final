#!/bin/bash

echo "Deploying Green version..."
kubectl apply -f k8s/prod/deployment-green.yaml -n prod

echo "Waiting for rollout..."
kubectl rollout status deployment/coinbase-green -n prod

# Optional health check
kubectl exec -n prod $(kubectl get pods -n prod -l color=green -o jsonpath="{.items[0].metadata.name}") -- curl localhost:5000/health

echo "Switching traffic to green..."
kubectl patch svc coinbase-service -n prod -p '{"spec":{"selector":{"app":"coinbase","color":"green"}}}'

echo "Blue-Green Switch Complete!"

