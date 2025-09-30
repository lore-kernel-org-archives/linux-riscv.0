Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB84CCA470
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZrv6UOP6tnx2bpBb3FGfkh6Icl+/cAym7UPpQ9gy70=; b=ziXbdeMrQH50x1
	Kd0JPVnHojcOv/F6o9RCZ6L4KvhT3N49bO/+Rp/TBdqi/jPjegRd/n4Rw2mRqhYU2ajKt+ISTOEXF
	NhIFUARGJHSrEVBuWXaqtAWkEf8XQpFzwRgymgN336hcpimjXKtuC0arwZAK5jRqo3EOKFYOOgp1C
	e9WUr7pq16VBBtldYRsfcEZbqWTM9wPGKqIhXF1x/u2jZ7VEm28K+/4KbJxbjpsILDklr0RRc5pmh
	hnIvdcWeA9zSNqb/y5lNkeBb00LcvuqgMMQ5BdNSp2qVsq5/9eRWOGD+Oz7s+adU6yyjLrMLSXiSG
	gnQKdPEUq8TtFMa+S7eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddc-00000005oe2-1S0r;
	Tue, 30 Sep 2025 16:55:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddZ-00000005ocD-3hMh
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:55:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0EA6106F;
	Tue, 30 Sep 2025 09:55:25 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F1943F59E;
	Tue, 30 Sep 2025 09:55:31 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 30 Sep 2025 17:54:55 +0100
Subject: [PATCH v2 7/8] perf build: Support build with clang
MIME-Version: 1.0
Message-Id: <20250930-perf_build_android_ndk-v2-7-2ea440b7ef01@arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
In-Reply-To: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759251311; l=2752;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=miZL6Yzqk6/EUWPBBeudxyQE12NEiBHtXzL1MUUXC30=;
 b=MWei7t108/0dA/kXy0ivVqULgek1bY/nXrQfnZA/ANTPxo7folMUdgQgOSBpxfxzC5Cgo+9Fu
 BBwu05SO9FQB5jfviSiUmBw2xM//AI4LOcPrkUAdjauckTx51vIaZbC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_095538_050554_52FB2385 
X-CRM114-Status: GOOD (  11.10  )
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

Add support for building perf with clang. For cross compilation, the
Makefile dynamically selects target flag for corresponding arch.

This patch has been verified on x86_64 machine with Ubuntu distro, it
can build successfully for native target, and for cross building Arm64
and s390.

Example: native build on x86_64 / Ubuntu machine:

  $ HOSTCC=clang CC=clang CXX=clang++ make -C tools/perf

Example: cross building s390 target on x86_64 / Ubuntu machine:

  # Install x390x cross toolchain and headers
  $ sudo apt-get install gcc-s390x-linux-gnu g++-s390x-linux-gnu \
         libc6-dev-s390x-cross linux-libc-dev-s390x-cross

  # Build with clang
  $ HOSTCC=clang CC=clang CXX=clang++ \
    ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- \
    make -C tools/perf NO_LIBELF=1 NO_LIBTRACEEVENT=1 NO_LIBPYTHON=1

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 tools/perf/Makefile.config | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 5a5832ee7b53c604ec0d90c5ca7e2bee5bfa6a17..a2b5c291a364cbf331c16384764520dfe330a04c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -23,8 +23,38 @@ HOSTCFLAGS := $(filter-out -Wnested-externs,$(EXTRA_WARNINGS))
 # borrowed from kernel headers depends on it, e.g. put_unaligned_*().
 CFLAGS += -fno-strict-aliasing
 
-# Enabled Wthread-safety analysis for clang builds.
+# Set target flag and options when using clang as compiler.
 ifeq ($(CC_NO_CLANG), 0)
+  CLANG_TARGET_FLAGS_arm	:= arm-linux-gnueabi
+  CLANG_TARGET_FLAGS_arm64	:= aarch64-linux-gnu
+  CLANG_TARGET_FLAGS_m68k	:= m68k-linux-gnu
+  CLANG_TARGET_FLAGS_mips	:= mipsel-linux-gnu
+  CLANG_TARGET_FLAGS_powerpc	:= powerpc64le-linux-gnu
+  CLANG_TARGET_FLAGS_riscv	:= riscv64-linux-gnu
+  CLANG_TARGET_FLAGS_s390	:= s390x-linux-gnu
+  CLANG_TARGET_FLAGS_x86	:= x86_64-linux-gnu
+
+  # Default to host architecture if ARCH is not explicitly given.
+  ifeq ($(ARCH),)
+    CLANG_TARGET_FLAGS := $(shell $(CLANG) -print-target-triple)
+  else
+    CLANG_TARGET_FLAGS := $(CLANG_TARGET_FLAGS_$(ARCH))
+  endif
+
+  ifeq ($(CROSS_COMPILE),)
+    ifeq ($(CLANG_TARGET_FLAGS),)
+      $(error Specify CROSS_COMPILE or add CLANG_TARGET_FLAGS for $(ARCH))
+    else
+      CLANG_FLAGS += --target=$(CLANG_TARGET_FLAGS)
+    endif # CLANG_TARGET_FLAGS
+  else
+    CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
+  endif # CROSS_COMPILE
+
+  CC := $(CLANG) $(CLANG_FLAGS) -fintegrated-as
+  CXX := $(CXX) $(CLANG_FLAGS) -fintegrated-as
+
+  # Enabled Wthread-safety analysis for clang builds.
   CFLAGS += -Wthread-safety
 endif
 

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
