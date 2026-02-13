#!/bin/bash

# ---------------------------
# Config: CHANGE THESE
# ---------------------------
BRANCH_NAME="main"
COMMIT_MESSAGE="Initial commit - Laravel Project"

# 4 GitHub SSH URLs (replace with your repos)
GITHUB_REPOS=(
"git@github.com:cheylou/che-activity.git"
"git@github.com:Johayya/Jo-activity.git"
"git@github.com:glyza0/gly-activity.git"
"git@github.com:trishamonera057-gif/trisha-activity.git"
)

# ---------------------------
# Script
# ---------------------------

echo "Starting Git upload for Laravel project to 4 accounts..."

# 1. Initialize Git if not already
if [ ! -d ".git" ]; then
    git init
    echo "Git initialized."
else
    echo "Git already initialized."
fi

# 2. Add all files
git add .
echo "All files added to staging."

# 3. Commit
git commit -m "$COMMIT_MESSAGE"
echo "Files committed."

# 4. Push to each account
for REPO in "${GITHUB_REPOS[@]}"; do
    # Remove old remote
    git remote remove temp_origin 2>/dev/null

    # Add remote
    git remote add temp_origin $REPO
    echo "Remote set to $REPO"

    # Rename branch to main
    git branch -M $BRANCH_NAME

    # Push to GitHub
    echo "Pushing to $REPO..."
    git push -u temp_origin $BRANCH_NAME
    echo "✅ Uploaded to $REPO"
done

echo "All uploads finished! 🎉"
