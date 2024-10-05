Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3961BCFB441
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mw4DcsZjI2erYxJkizWt3JITeN6bxpKSdL5d82ebs7M=; b=BfsIK7MzocBoOM
	Pi37p8BwDzYydsU9pzk6h3i9yzx1q+SpmOeNWxuDCPQJOhaexlFNJn87rJngscf2WpCbS5f3pVPm7
	tK523VpGCJ/f+dKNiN3uq6r5e3m/xabvA9ds31sYPCuXF6vTLr2xnXBsrZUoTl0VUKRdgKPSozzGA
	Dr3lh5PIOHveNXEPr6pRHBt4fW1VtRz+kx3ISLMLqupSQZmeoj707fSqsULEzo8isUl6g7Q5IpAOF
	jhSQLnt82sdywMP6VDX6NETHbfvmlFbP1LSxO/1oG1YCzwPPRSSYjdK37sddHLTKxHNyJKbF54JEe
	IFIa9OdWhfdkr5v6NTBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCNw-0000000Fz3i-2qh3;
	Sat, 05 Oct 2024 21:32:20 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtc-0000000FqLZ-00kw
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:57 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e1159159528so5994379276.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158214; x=1728763014; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LSL2ccbL1zMKXwe4tQXqPGcWrUHTWmz3veARUKGe9SA=;
        b=OYRV86Oolq/HQpDeAVL2JoYUgHEBDsf0utYpcnn7EYGELvzyiGI8B6qizP1hcRNGB+
         q7hkAz4oHkP6jM0LJlKNMiba1vpRHFPDjM1nCV9dLNuFtZ0DsUWqtJxN7kIBVj6GPGqU
         jhh7j6a/xbnzi+b431FfOUKUenbWQrWJLwF5ARfg86X2YpjRKMl5zGJ797MgwV1swyeK
         m6iCihVIcmwO8U9GOdaQkS51KFVJZtvk45KLQC7l372R04d7FCSyxUSTWd/R2OPUqnnJ
         0k+MDX2QRlAVykVLWdHNOP2khKFzOvaFBvY5tZriforQVKjPEAUAiB3VY1oeBgbwvRzn
         YiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158214; x=1728763014;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSL2ccbL1zMKXwe4tQXqPGcWrUHTWmz3veARUKGe9SA=;
        b=v7uj7WUlwnpyc4MoK8Dh1km0/P9/6le+EFlCNJtSkT9HyN3A5Y4jz9oiGmYfzQJsT1
         mmBKP7ZfsXFMJfZJPFllXUXgtj2SLBKIscNl53SBXsWxkKw0RcvhTohA9Bt9u72vU5AF
         mobaX0nMJ3sKQsK1CVQzTfX+98PgctrWi3ZAUQ6p/xuIHuBQxm8McuBcj8bddOWKMTxc
         w2o4qzk+GkgkpViz3AYUISwB7xFrbcSi4R9EyRLXLBLF8USWCDWYvSzJql7aHYF1S6uJ
         xtgsH3I3QrzrOjbGL50lXtK9m+1YVBhOVOvpEIoM9m4HUnYYkg5rVbJJlExLMRAabKb+
         B/Eg==
X-Forwarded-Encrypted: i=1; AJvYcCUl6K4axsaF8kZi+0EvCG4uPrDRh4lHITrGFuUvqEQLvof3UFiIShp//FXTaHRweLU02WhGPLfJBCLeSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV5FRVSw9YZODWWagrTlb/9l6fpHJK/+fk/HGIvcLoIo+JTgKF
	emxYNiA7pZeQXgB5NQMD59jA3myTN0FDaOhcMdgJq/ZBUKqe223IDzdDSl0Wo/6fBMjKJxFeggw
	NyWkUlg==
X-Google-Smtp-Source: AGHT+IFqH49xvkBQa7keg1rzZuWU/08D0ii8FTpSBX6sVpAkmGWs4m8R5YhQwlrDd8JE/onJIqb9MBMS1dlP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:6f05:0:b0:e20:cfc2:a326 with SMTP id
 3f1490d57ef6-e28932a484bmr64009276.6.1728158214036; Sat, 05 Oct 2024 12:56:54
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:35 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-26-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 25/31] perf riscv: Remove dwarf-regs.c and add dwarf-regs-table.h
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125656_360241_C8A67CFC 
X-CRM114-Status: GOOD (  16.28  )
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

The file just provides the function get_arch_regstr, however, if in
the only caller get_dwarf_regstr EM_HOST is used for the EM_NONE case,
and the register table is provided in a header file, the function can
never be called. So remove as dead code. Tidy up the EM_NONE cases for
riscv in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../dwarf-regs-table.h}                       | 32 ++++---------------
 tools/perf/arch/riscv/util/Build              |  1 -
 tools/perf/util/dwarf-regs.c                  |  7 ++--
 tools/perf/util/include/dwarf-regs.h          |  2 +-
 4 files changed, 12 insertions(+), 30 deletions(-)
 rename tools/perf/arch/riscv/{util/dwarf-regs.c => include/dwarf-regs-table.h} (56%)

diff --git a/tools/perf/arch/riscv/util/dwarf-regs.c b/tools/perf/arch/riscv/include/dwarf-regs-table.h
similarity index 56%
rename from tools/perf/arch/riscv/util/dwarf-regs.c
rename to tools/perf/arch/riscv/include/dwarf-regs-table.h
index a9c4402ae57e..a45b63a6d5a8 100644
--- a/tools/perf/arch/riscv/util/dwarf-regs.c
+++ b/tools/perf/arch/riscv/include/dwarf-regs-table.h
@@ -1,23 +1,10 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
- * Mapping of DWARF debug register numbers into register names.
- */
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifdef DEFINE_DWARF_REGSTR_TABLE
+/* This is included in perf/util/dwarf-regs.c */
 
-#include <stddef.h>
-#include <errno.h> /* for EINVAL */
-#include <string.h> /* for strcmp */
-#include <dwarf-regs.h>
+#define REG_DWARFNUM_NAME(reg, idx)	[idx] = "%" #reg
 
-struct regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-struct regs_dwarfnum riscv_dwarf_regs_table[] = {
+static const char * const riscv_regstr_tbl[] = {
 	REG_DWARFNUM_NAME("%zero", 0),
 	REG_DWARFNUM_NAME("%ra", 1),
 	REG_DWARFNUM_NAME("%sp", 2),
@@ -50,13 +37,6 @@ struct regs_dwarfnum riscv_dwarf_regs_table[] = {
 	REG_DWARFNUM_NAME("%t4", 29),
 	REG_DWARFNUM_NAME("%t5", 30),
 	REG_DWARFNUM_NAME("%t6", 31),
-	REG_DWARFNUM_END,
 };
 
-#define RISCV_MAX_REGS ((sizeof(riscv_dwarf_regs_table) / \
-		 sizeof(riscv_dwarf_regs_table[0])) - 1)
-
-const char *get_arch_regstr(unsigned int n)
-{
-	return (n < RISCV_MAX_REGS) ? riscv_dwarf_regs_table[n].name : NULL;
-}
+#endif
diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index 8f93091b8345..58a672246024 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -2,5 +2,4 @@ perf-util-y += perf_regs.o
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 3d98c2bf6035..2c6b197556dd 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -20,6 +20,7 @@
 #include "../arch/arm64/include/dwarf-regs-table.h"
 #include "../arch/sh/include/dwarf-regs-table.h"
 #include "../arch/powerpc/include/dwarf-regs-table.h"
+#include "../arch/riscv/include/dwarf-regs-table.h"
 #include "../arch/s390/include/dwarf-regs-table.h"
 #include "../arch/sparc/include/dwarf-regs-table.h"
 #include "../arch/xtensa/include/dwarf-regs-table.h"
@@ -33,7 +34,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
     || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64
+    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -42,7 +43,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
     && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64
+    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
@@ -63,6 +64,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	case EM_PPC:
 	case EM_PPC64:
 		return __get_dwarf_regstr(powerpc_regstr_tbl, n);
+	case EM_RISCV:
+		return __get_dwarf_regstr(riscv_regstr_tbl, n);
 	case EM_SPARC:
 	case EM_SPARCV9:
 		return __get_dwarf_regstr(sparc_regstr_tbl, n);
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 1763280855ce..35f4f33205da 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -81,7 +81,7 @@
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
     && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__)
+    && !defined(__powerpc64__) && !defined(__riscv__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
