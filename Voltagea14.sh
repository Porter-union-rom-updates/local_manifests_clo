#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/VoltageOS/manifest.git -b 14 --git-lfs      
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/Gtajisan/local_manifests_clo -b voltage/14 .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh && repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=FARHAN_UN
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh 
echo "====== Envsetup Done ======="

# Lunch
brunch mi429
