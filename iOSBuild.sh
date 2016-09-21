#!/bin/bash

# git checkout dev1.0


HCScheme="HCMedical"
HCBranchName="dev1.2.0"
HCCodeSignIdentity="iPhone Distribution: Ping An Technology (Shenzhen) Co., Ltd."
HCProvisioningProFile="803ec3e3-1e79-48e9-a066-6b3f7d1831c6"
HCConfiguration="Release"


HCDate=`date +%Y%m%d_%H%M`
HCWorkspace=`pwd`
echo "workspace=$HCWorkspace-----------------------"


xcodebuild \
-workspace $HCWorkspace/HCMedical.xcodeproj/project.xcworkspace \
-scheme $HCScheme \
-configuration "Release" \
CODE_SIGN_IDENTITY="$HCCodeSignIdentity"  \
PROVISIONING_PROFILE="$HCProvisioningProFile" \
clean \
build \
-derivedDataPath $HCWorkspace/$HCBranchName/$HCDate


xcrun -sdk iphoneos -v PackageApplication "$HCWorkspace/$HCBranchName/$HCDate/Build/Products/$HCConfiguration-iphoneos/$HCScheme.app" -o ~/Desktop/$HCScheme.ipa




# xcodebuild -target "HCMedical" -configuration Release -showBuildSettings
# xcodebuild -workspace "HCMedical.xcodeproj/project.xcworkspace" -scheme "HCMedical" -configuration Release
# xcrun -sdk iphoneos -v PackageApplication /Users/zailonglong546/Documents/zaiMac/Work/PAPrj/Git/HCMedical_iOS/HCMedical/20160921_1729/Build/Products/Debug-iphoneos/HCMedical.app -o ~/Desktop/xxx.ipa