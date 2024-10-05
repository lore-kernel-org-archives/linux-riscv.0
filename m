Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E755DCFB440
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZDCLhcqVt+Yi1dL7rpyFaQuJRrlJD8EAJTlqr1NKROU=; b=I0gwyHUWrqvOvZ
	NtK1rhIqEKrsPcWt9GBpjPR6c4+iSOI5rmwu9+uvWQdPZPlQQ6r5VbXlzsDCycgyT/D3rwX6Xqelt
	e/4NVCkGIKhvwkmf+hE9sbZ2zAxmO67eVCZ+80BoCfKct1qgf/CyB9OIw/yZKtNgxn+zCOf+370bb
	DEe2Ub6JcvPfWE3+KHLsCNmFMQ47Aez+Ga5fXSZTA0Eo2LJuid/439iGFPhh86CyBM6tImlmx8TDb
	GspOVZwbZ7enFNe1Iqp9eFDWjxcBcrfqZlk4+RPoExVfSI/VPZQuueDUufNws/EWqiirI1P+Vgq/9
	Ytk2UILtEF6hI/l6x6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCNs-0000000Fz0p-1sVV;
	Sat, 05 Oct 2024 21:32:16 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtO-0000000FqDP-2QML
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:45 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e28d223794so55656417b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158201; x=1728763001; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6EN4TKuEmqwMJ3OScRLpO+TAx81nKWqvaFc41rGg8u8=;
        b=jPUSdRGF6/piyidrBpaYLCTs812ILw9JGVwzxT7+Gyo8Jbroq3k9gaIXiEHqT0VVdc
         Tf/TBhlHLS70u5F4BIfylyeHZG4AdT+SebRzkCRWzsnamdgO6QfsHyY7wTO8GVSCCX3S
         ByRWU0FgxjLxnworKaNJyHMqheQsi5/XPGZzjvbBxQ3ApmiNhZ/9dHceU8RH0E/Fh3Vr
         oMO9z0hvvcmuh7N0sko1+7ZUa4eRd7npoZyC6RO6vZDgDiAu01/aiBHLlcgj3X78qPYw
         SMsC2zAcKeh8wzE2/OV/CpNU1SRvOJtVepujrIi8q2bJBS4FFdMdSkvWg8632rz2tWFW
         sLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158201; x=1728763001;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6EN4TKuEmqwMJ3OScRLpO+TAx81nKWqvaFc41rGg8u8=;
        b=TcDrgonOi+wwl/z3Du9932d1VtCeJwa6qTbgW7AUc9kAdNewVn7aZo/FjG7AKgYRcw
         hwuH1wR9Vhi4WfDWU4d/MSedVKDaoJPbMEBcKe0t3QJRErT0pd4zB8F7Be4znSW+8nNc
         Cn+CnzATTzq6RVd3qAUR7IWTC77HAGS/wZkiWdpjSnOj+lWVauNGoO8TFlBhtMJkvbfE
         BbgYe+8Z2RFkOP9myei1RPlPBpqXbINSt5yvP9Si3XVKZdnHPm1u7J6VMt3XedMIg3O+
         UsYQiD1lELqOaGS7452BiDuP6IJ4oZUlI37ID38Vsnjf3Z1Qx+kLAEYs5sK7LfVefbAW
         8ZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHlcP+6e+bLfnjIcgFnW6/mKDGzzVm1aqECN+JxCmu1XoJ7HX98G57cPWmWVpa6KOvppHOBEGZUFYf+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzyl6TtTVj94+7kdVlFm9puinuWqKPmYQbK3kGOKI6Mv/mRwJdh
	wuD/RfYwAaTGX+xh4yvofYiwX3pNix0k2oFVGbjgUFq+jLSOQnrX19nrAUOc44hNdbXNHKHYnXT
	foeYiZQ==
X-Google-Smtp-Source: AGHT+IGCNRxOO6T98fTFcdhPzhDVLhkuLPkxWJvPTvDz/vHXCXgsisg4y9asEuXLcvL8azfDw3NHB+5jV4SZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:2d14:0:b0:e24:9ec4:7297 with SMTP id
 3f1490d57ef6-e2893950a0bmr12214276.11.1728158200702; Sat, 05 Oct 2024
 12:56:40 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:29 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-20-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 19/31] perf arm64: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241005_125642_749194_4D986913 
X-CRM114-Status: GOOD (  19.04  )
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
the only caller get_dwarf_regstr EM_HOST is used for the EM_NONE case
the function can never be called. So remove as dead code. Tidy up the
EM_NONE cases for arm64 in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/Build        |  1 -
 tools/perf/arch/arm64/util/dwarf-regs.c | 80 -------------------------
 tools/perf/util/dwarf-regs.c            |  4 +-
 tools/perf/util/include/dwarf-regs.h    |  2 +-
 4 files changed, 3 insertions(+), 84 deletions(-)
 delete mode 100644 tools/perf/arch/arm64/util/dwarf-regs.c

diff --git a/tools/perf/arch/arm64/util/Build b/tools/perf/arch/arm64/util/Build
index 4387a6d6a6c3..a74521b79eaa 100644
--- a/tools/perf/arch/arm64/util/Build
+++ b/tools/perf/arch/arm64/util/Build
@@ -4,7 +4,6 @@ perf-util-y += perf_regs.o
 perf-util-y += tsc.o
 perf-util-y += pmu.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
-perf-util-$(CONFIG_LIBDW)     += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
diff --git a/tools/perf/arch/arm64/util/dwarf-regs.c b/tools/perf/arch/arm64/util/dwarf-regs.c
deleted file mode 100644
index 343a62fa4199..000000000000
--- a/tools/perf/arch/arm64/util/dwarf-regs.c
+++ /dev/null
@@ -1,80 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2010 Will Deacon, ARM Ltd.
- */
-
-#include <errno.h>
-#include <stddef.h>
-#include <string.h>
-#include <dwarf-regs.h>
-#include <linux/stringify.h>
-
-struct regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
-#define GPR_DWARFNUM_NAME(num) \
-	{.name = __stringify(%x##num), .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-/*
- * Reference:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ihi0057b/IHI0057B_aadwarf64.pdf
- */
-static const struct regs_dwarfnum regdwarfnum_table[] = {
-	GPR_DWARFNUM_NAME(0),
-	GPR_DWARFNUM_NAME(1),
-	GPR_DWARFNUM_NAME(2),
-	GPR_DWARFNUM_NAME(3),
-	GPR_DWARFNUM_NAME(4),
-	GPR_DWARFNUM_NAME(5),
-	GPR_DWARFNUM_NAME(6),
-	GPR_DWARFNUM_NAME(7),
-	GPR_DWARFNUM_NAME(8),
-	GPR_DWARFNUM_NAME(9),
-	GPR_DWARFNUM_NAME(10),
-	GPR_DWARFNUM_NAME(11),
-	GPR_DWARFNUM_NAME(12),
-	GPR_DWARFNUM_NAME(13),
-	GPR_DWARFNUM_NAME(14),
-	GPR_DWARFNUM_NAME(15),
-	GPR_DWARFNUM_NAME(16),
-	GPR_DWARFNUM_NAME(17),
-	GPR_DWARFNUM_NAME(18),
-	GPR_DWARFNUM_NAME(19),
-	GPR_DWARFNUM_NAME(20),
-	GPR_DWARFNUM_NAME(21),
-	GPR_DWARFNUM_NAME(22),
-	GPR_DWARFNUM_NAME(23),
-	GPR_DWARFNUM_NAME(24),
-	GPR_DWARFNUM_NAME(25),
-	GPR_DWARFNUM_NAME(26),
-	GPR_DWARFNUM_NAME(27),
-	GPR_DWARFNUM_NAME(28),
-	GPR_DWARFNUM_NAME(29),
-	REG_DWARFNUM_NAME("%lr", 30),
-	REG_DWARFNUM_NAME("%sp", 31),
-	REG_DWARFNUM_END,
-};
-
-/**
- * get_arch_regstr() - lookup register name from it's DWARF register number
- * @n:	the DWARF register number
- *
- * get_arch_regstr() returns the name of the register in struct
- * regdwarfnum_table from it's DWARF register number. If the register is not
- * found in the table, this returns NULL;
- */
-const char *get_arch_regstr(unsigned int n)
-{
-	const struct regs_dwarfnum *roff;
-
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (roff->dwarfnum == n)
-			return roff->name;
-	return NULL;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index eac99a246737..18e916c8e993 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,14 +32,14 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 			     unsigned int flags __maybe_unused)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386
+#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
 #endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 062623aefd5a..e640657f69c8 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,7 +79,7 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__)
+#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
