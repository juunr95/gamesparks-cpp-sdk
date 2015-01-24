# The MIT License (MIT)
#
# Copyright (c) 2013 Fukuta, Shinya.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
# the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := libgtest
GTEST_BASE_DIR :=  ../../dependencies/gtest-1.7.0
GTEST_BASE_INC_DIR := $(GTEST_BASE_DIR)/include
GTEST_LIB_FILE := ../../build/dependencies/gtest/Android/$(TARGET_ARCH_ABI)/libgtest.a
LOCAL_SRC_FILES := $(GTEST_LIB_FILE)
$(warning $(LOCAL_SRC_FILES))
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE := TEST_{TEST_NAME}
GTEST_BASE_INC_DIR := $(GTEST_BASE_DIR)/include
GTEST_BASE_SRC_DIR := $(GTEST_BASE_DIR)/src
LOCAL_STATIC_LIBRARIES := libgtest
LOCAL_C_INCLUDES := $(GTEST_BASE_INC_DIR) {TEST_INCLUDE_DIRECTORIES} 
LOCAL_SRC_FILES := $(GTEST_BASE_SRC_DIR)/gtest_main.cc {TEST_SOURCE_FILES}
include $(BUILD_EXECUTABLE)



# GTEST_DIR := external/gtest
# LOCAL_MODULE := gtest-prebuilt
# LOCAL_SRC_FILES := ../$(GTEST_DIR)/lib/libgtest.a
# LOCAL_EXPORT_C_INCLUDES := $(GTEST_DIR)/include
# include $(PREBUILT_STATIC_LIBRARY)
# 
# include $(CLEAR_VARS)
# GTEST_DIR := external/gtest
# LOCAL_MODULE := sample_code_test
# LOCAL_STATIC_LIBRARIES := gtest-prebuilt
# LOCAL_SRC_FILES := \
#     SampleCodeTestMain.cpp \
#     SampleCode.cpp \
#     SampleCodeTestCase.cpp
# include $(BUILD_EXECUTABLE)
# 
# include $(CLEAR_VARS)
# GTEST_DIR := external/gtest
# LOCAL_MODULE := sample_code_test_code_coverage
# LOCAL_STATIC_LIBRARIES := gtest-prebuilt
# LOCAL_CFLAGS := --coverage
# LOCAL_LDFLAGS := --coverage
# LOCAL_SRC_FILES := \
#     SampleCodeTestMain.cpp \
#     SampleCode.cpp \
#     SampleCodeTestCase.cpp
# include $(BUILD_EXECUTABLE)