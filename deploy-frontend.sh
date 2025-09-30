#!/bin/bash

# 🚀 Frontend Deployment Automation Script
# This script will help you deploy your frontend to Vercel automatically

echo "=========================================="
echo "🚀 SEO Analyzer - Frontend Deployment"
echo "=========================================="
echo ""

# Ask for backend URL
echo "📝 Before we start, we need your backend URL"
read -p "Enter your backend URL (e.g., https://xxx.up.railway.app): " backend_url

# Create .env.local file
echo "NEXT_PUBLIC_API_URL=$backend_url" > .env.local
echo "✅ Created .env.local with your backend URL"

# Check if git is initialized
echo ""
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo "✅ Git initialized"
else
    echo "✅ Git already initialized"
fi

# Add all files
echo ""
echo "📝 Adding files to Git..."
git add .

# Commit
echo ""
read -p "Enter commit message (or press Enter for 'Deploy frontend'): " commit_msg
commit_msg=${commit_msg:-"Deploy frontend"}
git commit -m "$commit_msg"
echo "✅ Files committed"

# Check if remote exists
echo ""
if git remote | grep -q origin; then
    echo "✅ Remote repository already configured"
    echo "🔄 Pushing to GitHub..."
    git push origin main
else
    echo "⚠️  No remote repository configured"
    echo ""
    echo "Please follow these steps:"
    echo "1. Go to https://github.com and create a new repository"
    echo "2. Copy the repository URL (e.g., https://github.com/username/seo-frontend.git)"
    echo ""
    read -p "Enter your GitHub repository URL: " repo_url

    git remote add origin "$repo_url"
    git branch -M main
    git push -u origin main
    echo "✅ Code pushed to GitHub"
fi

echo ""
echo "=========================================="
echo "✅ Frontend code is now on GitHub!"
echo "=========================================="
echo ""
echo "Next steps:"
echo "1. Go to https://vercel.com"
echo "2. Click 'Add New Project'"
echo "3. Import your repository"
echo "4. Add Environment Variable:"
echo "   Name: NEXT_PUBLIC_API_URL"
echo "   Value: $backend_url"
echo "5. Click Deploy!"
echo ""
echo "=========================================="
echo "💡 TIP: Vercel auto-deploys on every push!"
echo "=========================================="
