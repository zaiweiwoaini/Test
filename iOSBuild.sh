#!/bin/bash



#***********配置项
HCProjectName="Test"			
HCScheme="Test"
HCBranchName="master"
HCCodeSignIdentity="iPhone Developer: zaiwei_1990@163.com (SZ3732TS8N)"
HCProvisioningProFile="0ba56621-516e-4ab2-b668-3c64bcec1359"
HCConfiguration="Release"
#*****--------------------


#拉代码
git pull origin $HCBranchName
git checkout $HCBranchName


HCDate=`date +%Y%m%d_%H%M` 								#日期
HCWorkspace=`pwd`										#工程路径
echo "workspace=$HCWorkspace-----------------------"
HCBuildDir="$HCWorkspace/build"			 				#build路径
HCBuildTempDir="$HCBuildDir/temp/$HCBranchName/$HCDate"	#构建过程中的文件
HCIpaDir="$HCBuildDir/ipa"								#生成ipa文件路径
echo "HCBiuldDir=$HCBuildDir"

#清除构建的文件
rm -rf $HCBuildDir/temp

#创建构建和输出的路径
mkdir $HCBuildDir
mkdir $HCBuildTempDir
mkdir $HCIpaDir



#构建
xcodebuild \
-workspace $HCWorkspace/$HCProjectName.xcodeproj/project.xcworkspace \
-scheme $HCScheme \
-configuration "Release" \
CODE_SIGN_IDENTITY="$HCCodeSignIdentity"  \
PROVISIONING_PROFILE="$HCProvisioningProFile" \
clean \
build \
-derivedDataPath $HCBuildTempDir

#生成ipa
xcrun -sdk iphoneos \
-v PackageApplication $HCBuildTempDir/Build/Products/$HCConfiguration-iphoneos/$HCProjectName.app \
-o "$HCIpaDir/$HCProjectName&$HCBranchName&$HCDate.ipa"

# -o ~/Desktop/$HCScheme.ipa

# #清除
# rm -rdf "$buildDir"
# rm -rdf "$distDir"
# mkdir "$distDir"


# xcodebuild -target "HCMedical" -configuration Release -showBuildSettings
# xcodebuild -workspace "HCMedical.xcodeproj/project.xcworkspace" -scheme "HCMedical" -configuration Release
# xcrun -sdk iphoneos -v PackageApplication /Users/zailonglong546/Documents/zaiMac/Work/PAPrj/Git/HCMedical_iOS/HCMedical/20160921_1729/Build/Products/Debug-iphoneos/HCMedical.app -o ~/Desktop/xxx.ipa