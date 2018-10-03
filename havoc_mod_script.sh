#!/bin/bash
echo


echo "--------"; echo "patching... battery mod"
echo "#1/3 frameworks/base"
cd frameworks/base
git apply $1 ../../../scripts/batmod#1-havoc_frameworks_base.diff
cd ../..
echo "#1 done"; echo
echo "#2/3 frameworks/native"
cd frameworks/native
git apply $1 ../../../scripts/batmod#2_frameworks_native.diff
cd ../..
echo "#2 done"; echo
echo "#3/3 system/core"
cd system/core
git apply $1 ../../../scripts/batmod#3_system_core.diff
cd ../..
echo "#3 done"; echo "patching battery mod DONE"; echo "--------"; echo


echo "--------"; echo "patching... audio mod"
echo "#1/3 kernel/motorola/msm8996"
cd kernel/motorola/msm8996
#git remote add AICP https://github.com/AICP/kernel_motorola_msm8996.git; git remote update AICP
#git cherry-pick 6631c74b2805ff7ff5d06e842cda5b9c59a782fd
git apply $1 ../../../../scripts/audiomod#1_kernel_motorola_msm8996.diff
cd ../../..
echo "#1 done"; echo
echo "#2/3 vendor/motorola"
cd vendor/motorola/griffin
#git remote add AICP https://github.com/AICP/proprietary_vendor_motorola.git; git remote update AICP
#git cherry-pick d8d7e814d48dbaaa4cba4e4257c9b8f75bcca4c0
git apply $1 ../../../../scripts/audiomod#2_vendor_motorola_griffin.diff
cp ../../../../scripts/audiomod#2_proprietary_lib_libeqservice.so                    proprietary/lib/libeqservice.so
cp ../../../../scripts/audiomod#2_proprietary_lib_libtinyalsa.so                     proprietary/lib/libtinyalsa.so
cp ../../../../scripts/audiomod#2_proprietary_lib64_libtinyalsa.so                   proprietary/lib64/libtinyalsa.so
cp ../../../../scripts/audiomod#2_proprietary_vendor_lib_hw_audio.primary.msm8996.so proprietary/vendor/lib/hw/audio.primary.msm8996.so
cd ../../..
echo "#2 done"; echo
echo "#3/3 device/motorola/griffin"
cd device/motorola/griffin
#git remote add AICP https://github.com/AICP/device_motorola_griffin.git; git remote update AICP
#git cherry-pick 991f21dc1739c169e38ff7aa5f2ce823928badad
git apply $1 ../../../../scripts/audiomod#3_device_motorola_griffin.diff
cd ../../..
echo "#3 done"; echo "patching audio mod DONE"; echo "--------"; echo


#echo "--------"; echo "patching... fake signature support"
#echo "#1/1 frameworks/base"
#cd frameworks/base
#git remote add halogenOS https://github.com/halogenOS/android_frameworks_base.git; git remote update halogenOS
#git cherry-pick 2fd501990ccf79584ec41cf2dc78ebfcf37b0fa7
#git apply $1 ../../../scripts/fakesignature_frameworks_base.diff
#cd ../..
#echo "patching fake signature support DONE"; echo "--------"; echo


#echo "RR-ify device/motorola/griffin"
#cd device/motorola/griffin
#git cherry-pick 74a3e33ffe8d1685de7c14e7c35097a7df5f9beb
#git apply $1 ../../../../scripts/RR-ify.diff
#cd ../../..
#echo "RR-ify DONE"; echo "--------"; echo
