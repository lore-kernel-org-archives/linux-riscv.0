Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B347CAC5B8
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThFTNxAdKA9xhyr07j3hz4CLTV+8+zV+AVhJTv2v2ac=; b=L9t46tWclbSn6x
	7KXhskG7H8/ydkI43IFdlWxf5AZj5BtcQUDo2XhHj0r3cu0XRDTir+MOX0Y8Rrnk6ldnKlMevIWzC
	O2ySc20WAjQuK56A0RE3Hai7POYW5msQ4Yx8gEiJXxwqN8CxbWQsEGBQftU9ZMTJ6M8Dmgi6D8S+s
	4u/uXL6cuRW9+C21vhBWfyC0CBeVIUMxHAR0URREf+oVdI1fNHjfj1K7upL6tHh61kgGX7gGeR5M4
	myBDSVYtVLGPKShDGKP/nLGnQNQVoW2xTpV6PWqH5IEKZXmPRCEqGRWUpK+kx1/z60Bh8gpnSS0s8
	QojBFFLWfd6vJF2Kon2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyR-00000000NRV-43w7;
	Mon, 06 Oct 2025 16:22:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyP-00000000NNy-0gFP
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 16:22:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B47821515;
	Mon,  6 Oct 2025 09:21:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E0EA3F738;
	Mon,  6 Oct 2025 09:22:02 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 06 Oct 2025 17:21:31 +0100
Subject: [PATCH v3 9/9] perf docs: Document building with Clang
MIME-Version: 1.0
Message-Id: <20251006-perf_build_android_ndk-v3-9-4305590795b2@arm.com>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759767696; l=5456;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=yLdtJoXXg2ZofvQ3tks4npYZRXDJBWfYweloxYQbePU=;
 b=iOckLph1iYJ9s0sP+7wDulOCeNPGoUWbOyJCvZQabdA+mLUluT6/cAYOwIPh8MUXieOr7dQU6
 as19EERlH8HBRcaFZMy35EzfKzaHWd+0dTajOdGQzKBnLH5E8RyD1wr
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092205_292552_585C5F53 
X-CRM114-Status: GOOD (  15.92  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add example commands for building perf with Clang.

Since recent Android NDK releases use Clang as the default compiler, a
separate Android specific document is no longer needed; point to the
general build documentation instead.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Documentation/Build.txt   | 15 +++++++
 tools/perf/Documentation/android.txt | 80 +++---------------------------------
 2 files changed, 21 insertions(+), 74 deletions(-)

diff --git a/tools/perf/Documentation/Build.txt b/tools/perf/Documentation/Build.txt
index 83dc87c662b63ecc17553a15cc15a6b8d6f01d83..57b226e7fc2f8e849dfe58b3af31891f58dfd0af 100644
--- a/tools/perf/Documentation/Build.txt
+++ b/tools/perf/Documentation/Build.txt
@@ -99,3 +99,18 @@ configuration paths for cross building:
 In this case, the variable PKG_CONFIG_SYSROOT_DIR can be used alongside the
 variable PKG_CONFIG_LIBDIR or PKG_CONFIG_PATH to prepend the sysroot path to
 the library paths for cross compilation.
+
+5) Build with Clang
+===================
+By default, the makefile uses GCC as compiler. With specifying environment
+variables HOSTCC, CC and CXX, it allows to build perf with Clang.
+
+Using Clang for a native build:
+
+  $ HOSTCC=clang CC=clang CXX=clang++ make -C tools/perf
+
+Specifying ARCH and CROSS_COMPILE for cross compilation:
+
+  $ HOSTCC=clang CC=clang CXX=clang++ \
+    ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- \
+    make -C tools/perf
diff --git a/tools/perf/Documentation/android.txt b/tools/perf/Documentation/android.txt
index 24a59998fc91e814ad96f658d3481d88d798b60c..3f3cc7ac3d139c5517ec9458f13c06249c701429 100644
--- a/tools/perf/Documentation/android.txt
+++ b/tools/perf/Documentation/android.txt
@@ -1,78 +1,10 @@
 How to compile perf for Android
-=========================================
+===============================
 
-I. Set the Android NDK environment
-------------------------------------------------
+There are two ways to build perf and run it on Android:
 
-(a). Use the Android NDK
-------------------------------------------------
-1. You need to download and install the Android Native Development Kit (NDK).
-Set the NDK variable to point to the path where you installed the NDK:
-  export NDK=/path/to/android-ndk
+- Method 1: Build perf with static linking. See Build.txt, section
+  "4) Cross compilation" for how to build a static perf binary.
 
-2. Set cross-compiling environment variables for NDK toolchain and sysroot.
-For arm:
-  export NDK_TOOLCHAIN=${NDK}/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
-  export NDK_SYSROOT=${NDK}/platforms/android-24/arch-arm
-For x86:
-  export NDK_TOOLCHAIN=${NDK}/toolchains/x86-4.9/prebuilt/linux-x86_64/bin/i686-linux-android-
-  export NDK_SYSROOT=${NDK}/platforms/android-24/arch-x86
-
-This method is only tested for Android NDK versions Revision 11b and later.
-perf uses some bionic enhancements that are not included in prior NDK versions.
-You can use method (b) described below instead.
-
-(b). Use the Android source tree
------------------------------------------------
-1. Download the master branch of the Android source tree.
-Set the environment for the target you want using:
-  source build/envsetup.sh
-  lunch
-
-2. Build your own NDK sysroot to contain latest bionic changes and set the
-NDK sysroot environment variable.
-  cd ${ANDROID_BUILD_TOP}/ndk
-For arm:
-  ./build/tools/build-ndk-sysroot.sh --abi=arm
-  export NDK_SYSROOT=${ANDROID_BUILD_TOP}/ndk/build/platforms/android-3/arch-arm
-For x86:
-  ./build/tools/build-ndk-sysroot.sh --abi=x86
-  export NDK_SYSROOT=${ANDROID_BUILD_TOP}/ndk/build/platforms/android-3/arch-x86
-
-3. Set the NDK toolchain environment variable.
-For arm:
-  export NDK_TOOLCHAIN=${ANDROID_TOOLCHAIN}/arm-linux-androideabi-
-For x86:
-  export NDK_TOOLCHAIN=${ANDROID_TOOLCHAIN}/i686-linux-android-
-
-II. Compile perf for Android
-------------------------------------------------
-You need to run make with the NDK toolchain and sysroot defined above:
-For arm:
-  make WERROR=0 ARCH=arm CROSS_COMPILE=${NDK_TOOLCHAIN} EXTRA_CFLAGS="-pie --sysroot=${NDK_SYSROOT}"
-For x86:
-  make WERROR=0 ARCH=x86 CROSS_COMPILE=${NDK_TOOLCHAIN} EXTRA_CFLAGS="-pie --sysroot=${NDK_SYSROOT}"
-
-III. Install perf
------------------------------------------------
-You need to connect to your Android device/emulator using adb.
-Install perf using:
-  adb push perf /data/perf
-
-If you also want to use perf-archive you need busybox tools for Android.
-For installing perf-archive, you first need to replace #!/bin/bash with #!/system/bin/sh:
-  sed 's/#!\/bin\/bash/#!\/system\/bin\/sh/g' perf-archive >> /tmp/perf-archive
-  chmod +x /tmp/perf-archive
-  adb push /tmp/perf-archive /data/perf-archive
-
-IV. Environment settings for running perf
-------------------------------------------------
-Some perf features need environment variables to run properly.
-You need to set these before running perf on the target:
-  adb shell
-  # PERF_PAGER=cat
-
-IV. Run perf
-------------------------------------------------
-Run perf on your device/emulator to which you previously connected using adb:
-  # ./data/perf
+- Method 2: Download the Android NDK and use the bundled Clang to
+  build perf. See Build.txt, section "5) Build with clang" for details.

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
