#!/bin/bash

# -------------------------------------------------------------
# -- If you want to generate crds for a development branch, 
# --  you need to pass an argument like this
# --  `$ ./bin/update-crds my-branch`
# -------------------------------------------------------------
MAIN_BRANCH="master"
CURRENT_BRANCH="$MAIN_BRANCH"
if [ -z "$1" ]
then   
    echo "No argument supplied, I will download the main branch of the project, which is $MAIN_BRANCH"
else 
    CURRENT_BRANCH=$1
    echo "I will try to use this branch: $CURRENT_BRANCH"
fi
# -------------------------------------------------------------
# Download a repo to a temporary dir
# ------------------------------------------------------------- 
TMP_DIR=".tmp-db-operator-update-crds/"
GIT_REPO="https://github.com/db-operator/db-operator.git"
git clone "$GIT_REPO" "$TMP_DIR"
git -C "$TMP_DIR" checkout "$CURRENT_BRANCH"
# -------------------------------------------------------------
# -- Ensure latest versions of manifests are generated
# -------------------------------------------------------------
WORKDIR="$PWD"
cd "$TMP_DIR" || exit
make manifests

cd "$WORKDIR" || exit 


# rm -rf "$TMP_DIR"

