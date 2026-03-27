#!/bin/bash

# --- START OF PIPELINE ---
echo "🚀 Starting Local CI/CD Pipeline..."

# 1. CI Phase: Build the Artifact
echo "📦 Building new Docker Image (v3)..."
docker build -t my-custom-app:v3 .

# 2. CI Phase: Package the Artifact
echo "💾 Saving image to tar file..."
docker save my-custom-app:v3 > my-app-v3.tar

# 3. CD Phase: Update the Playbook dynamically
echo "📝 Updating Ansible Playbook to use v3..."
sed -i 's/my-app-v2.tar/my-app-v3.tar/g' setup_prod.yml
sed -i 's/my-custom-app:v2/my-custom-app:v3/g' setup_prod.yml

# 4. CD Phase: Deploy to Production
echo "⚙️  Deploying to Production via Ansible..."
ansible-playbook -i hosts.ini setup_prod.yml

echo "✅ Pipeline Complete! Your new code is live."
# --- END OF PIPELINE ---
