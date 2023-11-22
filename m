Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6077C61D99
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 15:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SJYsWkkDJhNthTLUycSlVhaMnyofiwWoL0ARn5IrSOk=; b=s1fw3KZNU9JHe1
	vfzXCG+Mvbh+MJ4qfaGPTXD3pLIpZLN7yYslW2g8/xWpJvk/E8Y/99Rcv+DlarS+pjW2dJhlv96ye
	2wWwxx7IzL/ZML4Q38XikaQh7N7CgmH2LM1kuZ7UGXD5phRcX9mT7vMdeX64yRe+PP8pFX4k5C1Tf
	xxG0T20N1Ry2IMeSUkRA6wgx4lZCVM1gLMaxzncDjCPU5XUhc7NTCooMpfVfjae+uLgDWVVQrvU14
	NxaKSd+HXdJua8MGQDauR62p7oAtluCU7E9CokAUH97DxTWqthoJHHH538BNVwhOyEqhKJPmpSAjo
	67EZvWOca4Qx2KQLZMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5pag-002MS8-0a;
	Wed, 22 Nov 2023 15:56:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5pac-002MQU-07
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 15:56:36 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-283a0b0bd42so784645a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 07:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700668591; x=1701273391; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uI9QwUqTrK/TTo7oDObuDkV0/9qXHslf5MXRPDTXe08=;
        b=KlWH2HgljsknuJ/3u4kCCU5W2FmhuV4nFbjg1xEspD1ZIpu5Ud4g2xEdSqA6gDfSSv
         PgOlVquwn56xWxSP9D3tbwYDyellv+dyyrtu01G7DssF8C7sz7fEzNlRMN6ASZQgZ+FS
         0eZ5n/n795hZ2+AgxS2XXvz0r9MtucD4gG9D/VbVP3Deog1TufRQAm6bbd1+lCxWqe0q
         4yCFSCOjZdluBTxvJ3GZvDpw1PbIQ3UGOxnpcSaGdZmDiadQqXk5x96argW+dwAnwXjR
         wIqIjrnWzkhFNCWk/3w51KMmQjsBLLh9oi8CKJvL7wYIyKMCOhWxbf7wpg6bCKQufjDp
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700668591; x=1701273391;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uI9QwUqTrK/TTo7oDObuDkV0/9qXHslf5MXRPDTXe08=;
        b=i9O12kw95W6iK9C1NHmMRar0eKN0YSg8OvzzuOJFt4vmRHwU0yoC1GLbl3uo0clrBg
         9xYUz20J27H6L+myR/6DaZDnn9AoB6R4IRtwSxT+r57oXHF98FGxtUnVs9nLcSxjA4kR
         4ErZCLEBSqhn4XMLRvph0DOz1P6HzAcodGN9j6zGO9NACCS485UEzWFnc5zg3efm6xWl
         1J5nzPP5qyHhOaiu/piWGP1AgNvm/dXwgI612Fmb+/RyMA7nEgPu8imNCAXOio7cwuvx
         ri3yux1sGg2aMy3Vt5T/EwjTSDVnOvRtctnfPHeZkH5CwrVFUavuv5S4yO9uFqCJcZQR
         7Ljg==
X-Gm-Message-State: AOJu0YyeHCmm8dLcxI0APboNg6BfBaUeaK5/YKI22k9LQr68dtCwBTEs
	ujioSDLGnSzZoyFqnhqERPM=
X-Google-Smtp-Source: AGHT+IFFl/m9AR6jyfXLquchr+iRx8oQ6H0cn+mgEm8bXuVtz6+CPLuwrrAzdX4uRMx9FfkOw6HBcw==
X-Received: by 2002:a17:90b:3e83:b0:280:a002:be85 with SMTP id rj3-20020a17090b3e8300b00280a002be85mr4489253pjb.20.1700668590236;
        Wed, 22 Nov 2023 07:56:30 -0800 (PST)
Received: from DESKTOP-NK4TH6S.localdomain ([220.116.189.210])
        by smtp.gmail.com with ESMTPSA id lx3-20020a17090b4b0300b00285139b71cdsm168400pjb.11.2023.11.22.07.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 07:56:30 -0800 (PST)
From: Paran Lee <p4ranlee@gmail.com>
To: Namhyung Kim <namhyung@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Li Dong <lidong@vivo.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shjy180909@gmail.com,
	austindh.kim@gmail.com,
	honggyu.kp@gmail.com,
	tegongkang@gmail.com,
	Paran Lee <p4ranlee@gmail.com>
Subject: [PATCH] perf callchain: Support riscv cross-platform
Date: Thu, 23 Nov 2023 00:55:48 +0900
Message-Id: <20231122155548.2449-1-p4ranlee@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_075634_074133_9A6E2CAE 
X-CRM114-Status: GOOD (  20.50  )
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

Support riscv cross platform callchain unwind.
Tested on RISCV 64 Starfive VisionFive2 Board
------------
$ uname -ra
Linux starfive 5.15.0-starfive #
1 SMP Mon Dec 19 07:56:37 EST 2022 riscv64 GNU/Linux
paran@starfive:~/linux-next$ cat /etc/os-release
PRETTY_NAME="Debian GNU/Linux bookworm/sid"
NAME="Debian GNU/Linux"
ID=debian
HOME_URL="https://www.debian.org/"
SUPPORT_URL="https://www.debian.org/support"
BUG_REPORT_URL="https://bugs.debian.org/"
------------
paran@starfive:~/linux-next/tools/perf$
 make  NO_AUXTRACE=1  NO_LIBTRACEEVENT=1 -j4
Auto-detecting system features:
...                                   dwarf: [ on  ]
...                      dwarf_getlocations: [ on  ]
...                                   glibc: [ on  ]
...                                  libbfd: [ on  ]
...                          libbfd-buildid: [ on  ]
...                                  libcap: [ on  ]
...                                  libelf: [ on  ]
...                                 libnuma: [ on  ]
...                  numa_num_possible_cpus: [ on  ]
...                                 libperl: [ on  ]
...                               libpython: [ on  ]
...                               libcrypto: [ on  ]
...                               libunwind: [ on  ]
...                      libdw-dwarf-unwind: [ on  ]
...                                    zlib: [ on  ]
...                                    lzma: [ on  ]
...                               get_cpuid: [ OFF ]
...                                     bpf: [ on  ]
...                                  libaio: [ on  ]
...                                 libzstd: [ on  ]
...
CC      arch/riscv/util/dwarf-regs.o
CC      arch/riscv/util/unwind-libunwind.o
...
LINK    perf
------------
Signed-off-by: Paran Lee <p4ranlee@gmail.com>
---
 tools/build/Makefile.feature                  |  2 +
 tools/build/feature/Makefile                  |  8 ++++
 tools/perf/Makefile.config                    | 18 +++++++++
 tools/perf/arch/riscv/util/Build              |  1 +
 tools/perf/arch/riscv/util/unwind-libunwind.c | 17 ++++++++
 tools/perf/check-headers.sh                   |  3 ++
 tools/perf/util/libunwind/riscv.c             | 40 +++++++++++++++++++
 tools/perf/util/unwind-libunwind.c            |  5 +++
 8 files changed, 94 insertions(+)
 create mode 100644 tools/perf/arch/riscv/util/unwind-libunwind.c
 create mode 100644 tools/perf/util/libunwind/riscv.c

diff --git a/tools/build/Makefile.feature b/tools/build/Makefile.feature
index 934e2777a2db..e4140dee1d70 100644
--- a/tools/build/Makefile.feature
+++ b/tools/build/Makefile.feature
@@ -93,9 +93,11 @@ FEATURE_TESTS_EXTRA :=                  \
          libunwind-x86_64               \
          libunwind-arm                  \
          libunwind-aarch64              \
+         libunwind-riscv                \
          libunwind-debug-frame          \
          libunwind-debug-frame-arm      \
          libunwind-debug-frame-aarch64  \
+         libunwind-debug-frame-riscv    \
          cxx                            \
          llvm                           \
          llvm-version                   \
diff --git a/tools/build/feature/Makefile b/tools/build/feature/Makefile
index dad79ede4e0a..e3218f98f824 100644
--- a/tools/build/feature/Makefile
+++ b/tools/build/feature/Makefile
@@ -45,8 +45,10 @@ FILES=                                          \
          test-libunwind-x86_64.bin              \
          test-libunwind-arm.bin                 \
          test-libunwind-aarch64.bin             \
+		 test-libunwind-riscv.bin               \
          test-libunwind-debug-frame-arm.bin     \
          test-libunwind-debug-frame-aarch64.bin \
+		 test-libunwind-debug-frame-riscv.bin   \
          test-pthread-attr-setaffinity-np.bin   \
          test-pthread-barrier.bin		\
          test-stackprotector-all.bin            \
@@ -189,12 +191,18 @@ $(OUTPUT)test-libunwind-arm.bin:
 $(OUTPUT)test-libunwind-aarch64.bin:
 	$(BUILD) -lelf -lunwind-aarch64
 
+$(OUTPUT)test-libunwind-riscv.bin:
+	$(BUILD) -lelf -lunwind-riscv
+
 $(OUTPUT)test-libunwind-debug-frame-arm.bin:
 	$(BUILD) -lelf -lunwind-arm
 
 $(OUTPUT)test-libunwind-debug-frame-aarch64.bin:
 	$(BUILD) -lelf -lunwind-aarch64
 
+$(OUTPUT)test-libunwind-debug-frame-riscv.bin:
+	$(BUILD) -lelf -lunwind-riscv
+
 $(OUTPUT)test-libaudit.bin:
 	$(BUILD) -laudit
 
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index b3e6ed10f40c..b72c1b886b28 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -88,6 +88,8 @@ endif
 
 ifeq ($(SRCARCH),riscv)
   NO_PERF_REGS := 0
+    CFLAGS += -I$(OUTPUT)arch/riscv/include/generated
+    LIBUNWIND_LIBS = -lunwind -lunwind-riscv
 endif
 
 ifeq ($(SRCARCH),csky)
@@ -147,6 +149,7 @@ FEATURE_CHECK_LDFLAGS-libunwind-debug-frame = $(LIBUNWIND_LDFLAGS) $(LIBUNWIND_L
 
 FEATURE_CHECK_LDFLAGS-libunwind-arm += -lunwind -lunwind-arm
 FEATURE_CHECK_LDFLAGS-libunwind-aarch64 += -lunwind -lunwind-aarch64
+FEATURE_CHECK_LDFLAGS-libunwind-riscv += -lunwind -lunwind-riscv
 FEATURE_CHECK_LDFLAGS-libunwind-x86 += -lunwind -llzma -lunwind-x86
 FEATURE_CHECK_LDFLAGS-libunwind-x86_64 += -lunwind -llzma -lunwind-x86_64
 
@@ -651,6 +654,21 @@ ifndef NO_LIBUNWIND
     endif
   endif
 
+  $(call feature_check,libunwind-riscv)
+  ifeq ($(feature-libunwind-riscv), 1)
+    $(call detected,CONFIG_LIBUNWIND_RISCV)
+    CFLAGS += -DHAVE_LIBUNWIND_RISCV_SUPPORT
+    LDFLAGS += -lunwind-riscv
+    EXTLIBS_LIBUNWIND += -lunwind-riscv
+    have_libunwind = 1
+    $(call feature_check,libunwind-debug-frame-riscv)
+    ifneq ($(feature-libunwind-debug-frame-riscv), 1)
+      msg := $(warning No debug_frame support found in libunwind-riscv);
+      CFLAGS += -DNO_LIBUNWIND_DEBUG_FRAME_riscv
+    endif
+  endif
+
+
   ifneq ($(feature-libunwind), 1)
     msg := $(warning No libunwind found. Please install libunwind-dev[el] >= 1.1 and/or set LIBUNWIND_DIR);
     NO_LOCAL_LIBUNWIND := 1
diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 603dbb5ae4dc..0f75e25ae638 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -2,4 +2,5 @@ perf-y += perf_regs.o
 perf-y += header.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
+perf-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/unwind-libunwind.c b/tools/perf/arch/riscv/util/unwind-libunwind.c
new file mode 100644
index 000000000000..e9d6c9c06f84
--- /dev/null
+++ b/tools/perf/arch/riscv/util/unwind-libunwind.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <errno.h>
+
+#ifndef REMOTE_UNWIND_LIBUNWIND
+#include <libunwind.h>
+#include "perf_regs.h"
+#include "../../../util/unwind.h"
+#endif
+#include "../../../util/debug.h"
+
+int LIBUNWIND__ARCH_REG_ID(int regnum)
+{
+	if (regnum < 0 || regnum >= PERF_REG_RISCV_MAX)
+		return -EINVAL;
+
+	return regnum;
+}
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 66ba33dbcef2..3a774c9544c4 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -48,6 +48,7 @@ FILES=(
   "arch/loongarch/include/uapi/asm/perf_regs.h"
   "arch/mips/include/uapi/asm/perf_regs.h"
   "arch/powerpc/include/uapi/asm/perf_regs.h"
+  "arch/riscv/include/uapi/asm/perf_regs.h"
   "arch/s390/include/uapi/asm/perf_regs.h"
   "arch/x86/include/uapi/asm/perf_regs.h"
   "arch/x86/include/uapi/asm/kvm.h"
@@ -67,6 +68,8 @@ FILES=(
   "arch/mips/include/uapi/asm/errno.h"
   "arch/parisc/include/uapi/asm/errno.h"
   "arch/powerpc/include/uapi/asm/errno.h"
+  "arch/riscv/include/uapi/asm/kvm.h"
+  "arch/riscv/include/uapi/asm/unistd.h"
   "arch/sparc/include/uapi/asm/errno.h"
   "arch/x86/include/uapi/asm/errno.h"
   "include/asm-generic/bitops/arch_hweight.h"
diff --git a/tools/perf/util/libunwind/riscv.c b/tools/perf/util/libunwind/riscv.c
new file mode 100644
index 000000000000..c340c5609161
--- /dev/null
+++ b/tools/perf/util/libunwind/riscv.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file setups defines to compile arch specific binary from the
+ * generic one.
+ *
+ * The function 'LIBUNWIND__ARCH_REG_ID' name is set according to arch
+ * name and the definition of this function is included directly from
+ * 'arch/riscv/util/unwind-libunwind.c', to make sure that this function
+ * is defined no matter what arch the host is.
+ *
+ * Finally, the arch specific unwind methods are exported which will
+ * be assigned to each riscv thread.
+ */
+
+#define REMOTE_UNWIND_LIBUNWIND
+
+/* Define arch specific functions & regs for libunwind, should be
+ * defined before including "unwind.h"
+ */
+#define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__riscv_reg_id(regnum)
+
+#include "unwind.h"
+#include "libunwind-riscv.h"
+#define perf_event_riscv_regs perf_event_riscv64_regs
+#include <../../../arch/riscv/include/uapi/asm/perf_regs.h>
+#undef perf_event_riscv_regs
+#include "../../arch/riscv/util/unwind-libunwind.c"
+
+/* NO_LIBUNWIND_DEBUG_FRAME is a feature flag for local libunwind,
+ * assign NO_LIBUNWIND_DEBUG_FRAME_RISCV64 to it for compiling riscv
+ * unwind methods.
+ */
+#undef NO_LIBUNWIND_DEBUG_FRAME
+#ifdef NO_LIBUNWIND_DEBUG_FRAME_RISCV
+#define NO_LIBUNWIND_DEBUG_FRAME
+#endif
+#include "util/unwind-libunwind-local.c"
+
+struct unwind_libunwind_ops *
+riscv_unwind_libunwind_ops = &_unwind_libunwind_ops;
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index 76cd63de80a8..52190f1eaf0d 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -11,6 +11,7 @@
 struct unwind_libunwind_ops __weak *local_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *x86_32_unwind_libunwind_ops;
 struct unwind_libunwind_ops __weak *arm64_unwind_libunwind_ops;
+struct unwind_libunwind_ops __weak *riscv_unwind_libunwind_ops;
 
 static void unwind__register_ops(struct maps *maps, struct unwind_libunwind_ops *ops)
 {
@@ -54,6 +55,10 @@ int unwind__prepare_access(struct maps *maps, struct map *map, bool *initialized
 		if (dso_type == DSO__TYPE_64BIT)
 			ops = arm64_unwind_libunwind_ops;
 	}
+	} else if (!strcmp(arch, "riscv64") || !strcmp(arch, "riscv")) {
+		if (dso_type == DSO__TYPE_64BIT)
+			ops = riscv_unwind_libunwind_ops;
+	}
 
 	if (!ops) {
 		pr_warning_once("unwind: target platform=%s is not supported\n", arch);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
