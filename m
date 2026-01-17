Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D52AC982C5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 05:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lt2KzTsuYr5GQ7+Mn11igkVBxWT7AsR9E66y5gExcJ4=; b=oK18elLYXZ6/Yi
	HrmxHwmDgaNLzknRhb6NT4NOdfiEaaqD59za0WynP7Tkv+5BD9x8eexR8j2VKAFejEuNp4Vbg4rw9
	PM/LrZMSGPpgolj1xwqsItgWBVANzoJVaqV8Vb+07o9fKZ/N/hAzXgphW4kOEvo73RQMX5P/hqsR3
	02oKqjPKgPmogUTXPQw7ZNQqbfnxahdXB7v71OfB4E4pQ9edOWxFbEUXWjUPSBLb4vlDVhZw8k3Cl
	vJ994yK9lIl0gHKyD7d0rLdoqpo/Q6gy+f7a29mS2FEy8gB5Lw6Al5xqbQlxg7e3UoPcxjxGNUk2c
	e3LXvADfGIyM4s5/LXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysN-0000000FEQo-3O2I;
	Sat, 17 Jan 2026 05:29:31 +0000
Received: from mail-dl1-x1249.google.com ([2607:f8b0:4864:20::1249])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgysJ-0000000FEMJ-0oTf
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 05:29:28 +0000
Received: by mail-dl1-x1249.google.com with SMTP id a92af1059eb24-123308e5e6aso4981692c88.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Jan 2026 21:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768627766; x=1769232566; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZjg+n5nlIC/IwIAdkKt39V0NfSI0pSDMH1g5ht+Ccc=;
        b=F8M333qahGI3eP33IvDVUNrxO7A3hqQnFbPOljb5KLxncp0r7Qz0sUJeSq+KUAkLIg
         /jVanSCHcG9rREr5WADhZ9yGef6i3LPtXWfmThtWrEQDugL4DzqgGeo3jYGq19hHBpGt
         7uXYnLRfkeKoqfVlFDF9Ne4itTEGT6ucOkiBaC15qEWPPGSI6kyDbP4k1VHeMj9BONLe
         B/sYKfYfMtKKmPwDjMxJJaBUmeNOFJoB3p8Ygc1CgwouoVXZCqa8q7aMEd+x5ZogWwgt
         AxmMvOFW0Em0Cf7fnkIIQnrVmT62cGyUHsy0IlpaYpjPwm73PlSzM2oNpN3u5ni8/ZIf
         DW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768627766; x=1769232566;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZjg+n5nlIC/IwIAdkKt39V0NfSI0pSDMH1g5ht+Ccc=;
        b=Guq2JRaAsEVCPzKSsLNZs2QBYJ/blEzBDtTEvz5AP9Mvp9LO0XfXe3eVbQLc9l6244
         qxtxoIIpqCsTpQ1ceWSmwhKoVrdiigU4IHE2OKIiMBaSju0TklWrGd00D9WgcRd3trnC
         xgeXYqbSWkqAZbsPGtG8PAr8DdgQ4ja0OJF1Q6l8x0Xex+Uf94vCzs5v690kNikQ9odK
         SZtY37h8oEOV3JTlbxi0bCjsHA/7/9h/widlBJaH3FWFRUdkqW5Iy411a0+2lL7m0kwe
         RaFFkoSBOivBcDvoivpeh5N1KUfmcLqhLX0e4ptW5CSU6yCMOpp04aydz0pWg0YAPSHR
         UR7w==
X-Forwarded-Encrypted: i=1; AJvYcCWm0Uk7ZmOO+EnYYZuNL5ODZxrtklXo03lpZKePgFv2xKLXOY0DzqhcXflQHzlqBvrhXau/n1tkV6+mhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyCgdMF/MdEDC2MQv4tHrHBsWutK4umOrel6MwzGQCP2X+8v9K
	N+VXTHkEAN9Pv1DDzKBMTdy6WLiKIQRdmJ66LOSiK6DbP31lnYmCaGpDgSDlPrnPX9DTSVqGZO5
	JueQG6aplTQ==
X-Received: from dlbsj11.prod.google.com ([2002:a05:7022:f90b:b0:123:3368:7a90])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:2482:b0:11b:b3a1:713c
 with SMTP id a92af1059eb24-1244a6cf5e1mr4159526c88.9.1768627766004; Fri, 16
 Jan 2026 21:29:26 -0800 (PST)
Date: Fri, 16 Jan 2026 21:28:30 -0800
In-Reply-To: <20260117052849.2205545-1-irogers@google.com>
Mime-Version: 1.0
References: <20260117052849.2205545-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260117052849.2205545-5-irogers@google.com>
Subject: [PATCH v1 04/23] perf unwind-libdw: fix a cross-arch unwinding bug
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Howard Chu <howardchu95@gmail.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Andi Kleen <ak@linux.intel.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Dmitry Vyukov <dvyukov@google.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Bodkhe <aditya.b1@linux.ibm.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Mark Wielaard <mark@klomp.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_212927_273699_1828E86F 
X-CRM114-Status: GOOD (  17.14  )
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

From: Shimin Guo <shimin.guo@skydio.com>

The set_initial_registers field of Dwfl_Thread_Callbacks needs to be set
according to the arch of the stack samples being analyzed, not the arch
that perf itself is built for. Currently perf fails to unwind stack samples
collected from archs different from that of the host perf is running on.
This patch moves the arch-specific implementations of set_initial_registers
from tools/perf/arch to tools/perf/utli/unwind-libdw-arch, similar to the
way the perf-regs-arch folder contains arch-specific functions related to
registers, and chooses the implementation based on the arch of the data
being processed.

Signed-off-by: Shimin Guo <shimin.guo@skydio.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Acked-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/arch/arm/util/Build                |  1 -
 tools/perf/arch/arm64/util/Build              |  1 -
 tools/perf/arch/csky/util/Build               |  2 -
 tools/perf/arch/powerpc/util/Build            |  1 -
 tools/perf/arch/riscv/util/Build              |  1 -
 tools/perf/arch/s390/util/Build               |  2 -
 tools/perf/arch/x86/util/Build                |  1 -
 tools/perf/util/Build                         |  1 +
 tools/perf/util/unwind-libdw-arch/Build       |  8 +++
 .../unwind-libdw-arch/unwind-libdw-arm.c}     | 10 ++--
 .../unwind-libdw-arch/unwind-libdw-arm64.c}   | 10 ++--
 .../unwind-libdw-arch/unwind-libdw-csky.c}    | 10 ++--
 .../unwind-libdw-loongarch.c}                 | 10 ++--
 .../unwind-libdw-arch/unwind-libdw-powerpc.c} | 10 ++--
 .../unwind-libdw-arch/unwind-libdw-riscv.c}   | 10 ++--
 .../unwind-libdw-arch/unwind-libdw-s390.c}    | 14 ++---
 .../unwind-libdw-arch/unwind-libdw-x86.c}     |  8 +--
 tools/perf/util/unwind-libdw.c                | 51 ++++++++++++++++---
 tools/perf/util/unwind-libdw.h                | 10 +++-
 19 files changed, 104 insertions(+), 57 deletions(-)
 create mode 100644 tools/perf/util/unwind-libdw-arch/Build
 rename tools/perf/{arch/arm/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-arm.c} (80%)
 rename tools/perf/{arch/arm64/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-arm64.c} (87%)
 rename tools/perf/{arch/csky/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-csky.c} (90%)
 rename tools/perf/{arch/loongarch/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-loongarch.c} (86%)
 rename tools/perf/{arch/powerpc/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-powerpc.c} (89%)
 rename tools/perf/{arch/riscv/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-riscv.c} (87%)
 rename tools/perf/{arch/s390/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-s390.c} (84%)
 rename tools/perf/{arch/x86/util/unwind-libdw.c => util/unwind-libdw-arch/unwind-libdw-x86.c} (87%)

diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index fd695e1fdaee..3291f893b943 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,6 +1,5 @@
 perf-util-y += perf_regs.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
 perf-util-y += pmu.o auxtrace.o cs-etm.o
diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index d63881081d2e..0177af19cc00 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -1,4 +1,3 @@
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-y += ../../arm/util/auxtrace.o
diff --git a/tools/perf/arch/csky/util/Build b/tools/perf/arch/csky/util/Build
index 5e6ea82c4202..6b2d0e021b11 100644
--- a/tools/perf/arch/csky/util/Build
+++ b/tools/perf/arch/csky/util/Build
@@ -1,3 +1 @@
 perf-util-y += perf_regs.o
-
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index 3d0d5427aef7..5fd28ec713a4 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -9,5 +9,4 @@ perf-util-y += evsel.o
 perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
 perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 perf-util-y += auxtrace.o
diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 58a672246024..628b9ebd418b 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -2,4 +2,3 @@ perf-util-y += perf_regs.o
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/Build
index c64eb18dbdae..5391d26fedd4 100644
--- a/tools/perf/arch/s390/util/Build
+++ b/tools/perf/arch/s390/util/Build
@@ -2,8 +2,6 @@ perf-util-y += header.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-
 perf-util-y += machine.o
 perf-util-y += pmu.o
 
diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
index c0dc5965f362..fad256252bb9 100644
--- a/tools/perf/arch/x86/util/Build
+++ b/tools/perf/arch/x86/util/Build
@@ -12,7 +12,6 @@ perf-util-y += evsel.o
 perf-util-y += iostat.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
 perf-util-y += auxtrace.o
 perf-util-y += archinsn.o
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 4915f237ba9e..5efec73be474 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -227,6 +227,7 @@ perf-util-$(CONFIG_LIBDW) += annotate-data.o
 perf-util-$(CONFIG_LIBDW) += libdw.o
 
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
+perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw-arch/
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind-local.o
 perf-util-$(CONFIG_LIBUNWIND)          += unwind-libunwind.o
 perf-util-$(CONFIG_LIBUNWIND_X86)      += libunwind/x86_32.o
diff --git a/tools/perf/util/unwind-libdw-arch/Build b/tools/perf/util/unwind-libdw-arch/Build
new file mode 100644
index 000000000000..ef17a83a7813
--- /dev/null
+++ b/tools/perf/util/unwind-libdw-arch/Build
@@ -0,0 +1,8 @@
+perf-util-y += unwind-libdw-x86.o
+perf-util-y += unwind-libdw-arm.o
+perf-util-y += unwind-libdw-arm64.o
+perf-util-y += unwind-libdw-csky.o
+perf-util-y += unwind-libdw-loongarch.o
+perf-util-y += unwind-libdw-powerpc.o
+perf-util-y += unwind-libdw-riscv.o
+perf-util-y += unwind-libdw-s390.o
diff --git a/tools/perf/arch/arm/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
similarity index 80%
rename from tools/perf/arch/arm/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
index fbb643f224ec..56e9b5975bcc 100644
--- a/tools/perf/arch/arm/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../../util/unwind-libdw.h"
-#include "../../../util/perf_regs.h"
-#include "../../../util/sample.h"
+#include "../arch/arm/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
similarity index 87%
rename from tools/perf/arch/arm64/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
index b89b0a7e5ad9..29b6833e036c 100644
--- a/tools/perf/arch/arm64/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-arm64.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../../util/unwind-libdw.h"
-#include "../../../util/perf_regs.h"
-#include "../../../util/sample.h"
+#include "../arch/arm64/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/csky/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
similarity index 90%
rename from tools/perf/arch/csky/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
index b20b1569783d..2556d034c32a 100644
--- a/tools/perf/arch/csky/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-csky.c
@@ -2,12 +2,12 @@
 // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
 
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../util/unwind-libdw.h"
-#include "../../util/perf_regs.h"
-#include "../../util/event.h"
+#include "../arch/csky/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/loongarch/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
similarity index 86%
rename from tools/perf/arch/loongarch/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
index 60b1144bedd5..5fca673508be 100644
--- a/tools/perf/arch/loongarch/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-loongarch.c
@@ -2,12 +2,12 @@
 /* Copyright (C) 2020-2023 Loongson Technology Corporation Limited */
 
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../util/unwind-libdw.h"
-#include "../../util/perf_regs.h"
-#include "../../util/sample.h"
+#include "../arch/loongarch/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/powerpc/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
similarity index 89%
rename from tools/perf/arch/powerpc/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
index 82d0c28ae345..1560db45e7b4 100644
--- a/tools/perf/arch/powerpc/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-powerpc.c
@@ -1,10 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
 #include <linux/kernel.h>
-#include "perf_regs.h"
-#include "../../../util/unwind-libdw.h"
-#include "../../../util/perf_regs.h"
-#include "../../../util/sample.h"
+#include "../arch/powerpc/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
 /* See backends/ppc_initreg.c and backends/ppc_regs.c in elfutils.  */
 static const int special_regs[3][2] = {
@@ -13,7 +13,7 @@ static const int special_regs[3][2] = {
 	{ 109, PERF_REG_POWERPC_CTR },
 };
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
similarity index 87%
rename from tools/perf/arch/riscv/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
index dc1476e16321..c2e2c4b6b2e0 100644
--- a/tools/perf/arch/riscv/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-riscv.c
@@ -2,12 +2,12 @@
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../util/unwind-libdw.h"
-#include "../../util/perf_regs.h"
-#include "../../util/sample.h"
+#include "../arch/riscv/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/s390/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
similarity index 84%
rename from tools/perf/arch/s390/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
index c27c7a0d1076..1e05e9d9d95f 100644
--- a/tools/perf/arch/s390/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-s390.c
@@ -1,14 +1,14 @@
 #include <linux/kernel.h>
 #include <elfutils/libdwfl.h>
-#include "../../util/unwind-libdw.h"
-#include "../../util/perf_regs.h"
-#include "../../util/event.h"
-#include "../../util/sample.h"
-#include "dwarf-regs-table.h"
-#include "perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
+#include "util/event.h"
+#include "util/sample.h"
+#include "../arch/s390/include/dwarf-regs-table.h"
+#include "../arch/s390/include/uapi/asm/perf_regs.h"
 
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/arch/x86/util/unwind-libdw.c b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
similarity index 87%
rename from tools/perf/arch/x86/util/unwind-libdw.c
rename to tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
index 798493e887d7..dd27545a4a68 100644
--- a/tools/perf/arch/x86/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw-arch/unwind-libdw-x86.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
-#include "perf_regs.h"
-#include "../../../util/unwind-libdw.h"
-#include "../../../util/perf_regs.h"
+#include "../arch/x86/include/uapi/asm/perf_regs.h"
+#include "util/unwind-libdw.h"
+#include "util/perf_regs.h"
 #include "util/sample.h"
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
+bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg)
 {
 	struct unwind_info *ui = arg;
 	struct regs_dump *user_regs = perf_sample__user_regs(ui->sample);
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 3ff427a49e4c..b2e194a8be39 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -225,11 +225,45 @@ static bool memory_read(Dwfl *dwfl __maybe_unused, Dwarf_Addr addr, Dwarf_Word *
 	return true;
 }
 
-static const Dwfl_Thread_Callbacks callbacks = {
-	.next_thread		= next_thread,
-	.memory_read		= memory_read,
-	.set_initial_registers	= libdw__arch_set_initial_registers,
-};
+#define DEFINE_DWFL_THREAD_CALLBACKS(arch)                           \
+static const Dwfl_Thread_Callbacks callbacks_##arch = {              \
+	.next_thread           = next_thread,                        \
+	.memory_read           = memory_read,                        \
+	.set_initial_registers = libdw_set_initial_registers_##arch, \
+}
+
+DEFINE_DWFL_THREAD_CALLBACKS(x86);
+DEFINE_DWFL_THREAD_CALLBACKS(arm);
+DEFINE_DWFL_THREAD_CALLBACKS(arm64);
+DEFINE_DWFL_THREAD_CALLBACKS(csky);
+DEFINE_DWFL_THREAD_CALLBACKS(loongarch);
+DEFINE_DWFL_THREAD_CALLBACKS(powerpc);
+DEFINE_DWFL_THREAD_CALLBACKS(riscv);
+DEFINE_DWFL_THREAD_CALLBACKS(s390);
+
+static const Dwfl_Thread_Callbacks *get_thread_callbacks(const char *arch)
+{
+	if (!strcmp(arch, "arm"))
+		return &callbacks_arm;
+	else if (!strcmp(arch, "arm64"))
+		return &callbacks_arm64;
+	else if (!strcmp(arch, "csky"))
+		return &callbacks_csky;
+	else if (!strcmp(arch, "loongarch"))
+		return &callbacks_loongarch;
+	else if (!strcmp(arch, "powerpc"))
+		return &callbacks_powerpc;
+	else if (!strcmp(arch, "riscv"))
+		return &callbacks_riscv;
+	else if (!strcmp(arch, "s390"))
+		return &callbacks_s390;
+	else if (!strcmp(arch, "x86"))
+		return &callbacks_x86;
+
+	pr_err("Fail to get thread callbacks for arch %s, returns NULL\n",
+	       arch);
+	return NULL;
+}
 
 static int
 frame_callback(Dwfl_Frame *state, void *arg)
@@ -278,6 +312,7 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 	const char *arch = perf_env__arch(ui_buf.machine->env);
 	Dwarf_Word ip;
 	int err = -EINVAL, i;
+	const Dwfl_Thread_Callbacks *callbacks;
 
 	if (!data->user_regs || !data->user_regs->regs)
 		return -EINVAL;
@@ -300,7 +335,11 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 	if (err)
 		goto out;
 
-	err = !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread), &callbacks, ui);
+	callbacks = get_thread_callbacks(arch);
+	if (!callbacks)
+		goto out;
+
+	err = !dwfl_attach_state(ui->dwfl, EM_NONE, thread__tid(thread), callbacks, ui);
 	if (err)
 		goto out;
 
diff --git a/tools/perf/util/unwind-libdw.h b/tools/perf/util/unwind-libdw.h
index 8c88bc4f2304..574b29848cce 100644
--- a/tools/perf/util/unwind-libdw.h
+++ b/tools/perf/util/unwind-libdw.h
@@ -9,7 +9,15 @@ struct machine;
 struct perf_sample;
 struct thread;
 
-bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_x86(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_arm(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_arm64(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_csky(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_loongarch(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_mips(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_powerpc(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_riscv(Dwfl_Thread *thread, void *arg);
+bool libdw_set_initial_registers_s390(Dwfl_Thread *thread, void *arg);
 
 struct unwind_info {
 	Dwfl			*dwfl;
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
