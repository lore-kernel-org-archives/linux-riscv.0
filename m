Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5C7D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZGkkx/otO46bDPjP0gxAaDgm09cYaZi5RJKiM8OR3M=; b=4fo1/fCMxkEBme
	mfem5PZ+rxOeb5vz/LGj0CAPwzaVVRpxKBzN5KRinArjeuSTpplq3TNKgozNCsxQBPB932FjE6H3j
	I5kdF8beOqKAKO9SwLIFUC7AYLnBn2p+YEbyRbjETlvQsMCqh/IM3pLc1gSfkaupQbMxgE8sC7xuZ
	rWsD+ITH0gtsVi1cejeLGUmnSg3NEq85/fQGzYz3u54pf6YeCa5OsmGogQnvrRuhwcIXGW0sMrFLc
	Io3OHgoihLVqpmWf4gGbzzY/2S7LgvVCgzLcBP83s/c54DbCTPIgkaWBwzglb5qbsjCcd728Odc82
	sIa1RyFnwcwJ3GwGAOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EpN-0000000DPD0-49mk;
	Thu, 17 Oct 2024 00:57:21 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EKt-0000000DKGx-1sdm
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:25:53 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e000d68bb1so17293397b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124750; x=1729729550; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=um/dxmdAe6wcb5R4JQ4GBtPj+lDN5EAHVRH3aRzp8nM=;
        b=C/fsDSQuf4e5Lbij2mrp5qghGLacIkjRalsER+QNou9qIMEkgoWJ7QMKo7DzDzwNJ/
         vcgdl+Oh7RAIXBuloNmDOGEiqgGfnLhvHZcDZSkDzA9VltmDId7nlc/c+GIj+g2NdjRi
         PSJLa6d/Ha0FqThtWNvqkaR5y5KMoY5UQDSNeJr/MVXtt6aCm1XFme9vxBp1mZqIBN/n
         lFzJMgWC6XbnNF9lsc+bzTSp2nag+3mN7DnsdyuMkTC7+Rpn265S9MUrrTGsI0pr82HH
         cUT82HrTcXtKXWKg0lQFwbHkq1suJFQ2YftBySDkJeYiVQk0rgiX+jDv8PH8isOnj3/e
         ly+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124750; x=1729729550;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=um/dxmdAe6wcb5R4JQ4GBtPj+lDN5EAHVRH3aRzp8nM=;
        b=cMDUXiq7O6B7yRN1RNB5aXWobs2ir2GQyyBfiNdh2/pdsX//G1o3Cjsqw8i7zKCqTD
         xIb6HEoJeL/cMKSBUoXoe7W4u3ND9lUiqJCdADyL4TBdshxmualnuuOvp/O55DX6fSLx
         6QUwDwep+M9rf/pplpVKAR3II3T5pOvH2Z0NdvFNUOjgD12yJzJPD7rvnM0qKdKJ/QPR
         567EhVNQWDNymFpzOSD70BJ/eXFSW9oqOUEwHLkua+R0psc+GxLrVvojHErzRciIdmh/
         GScQoop/DpZrBV4iX2zh+YDVkZufl0iVQxLVbgppHoZKkuKHVhJT71PSMvZD4rrqKq/p
         zFyw==
X-Forwarded-Encrypted: i=1; AJvYcCX+pGNBqYumudtH/XZGc/5UWNqijlb1KMIfWiB5G9zuaHo7+F7KnUzShmMyxzL6FQyAarKXJJGmGt94ng==@lists.infradead.org
X-Gm-Message-State: AOJu0YyL/rSV/KOavtaDeQaJkf+eXDGlu4j5Dbr3M9fRsSGFnY5ZYqe9
	8YhdjL5mw6XOZjdXi+nLEsbDyG4UWYS87DVNzld2dtITnSdznn8jck/JYeuh/EBmyQlX5A8sXup
	BXhh9XQ==
X-Google-Smtp-Source: AGHT+IEIO7/kIuzXCKLj4vkEiDjLakQIWKT4RUUiJCfFHJfsVrGiZuOblfcM3qLnbWUnO4MbN9NTPRAGbIyC
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:2e45:0:b0:e20:2da6:ed77 with SMTP id
 3f1490d57ef6-e2b9ce95b1bmr2417276.5.1729124749588; Wed, 16 Oct 2024 17:25:49
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:09 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-10-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 09/20] perf arm: Remove dwarf-regs.c
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
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_172551_512219_5AF7897A 
X-CRM114-Status: GOOD (  19.32  )
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
EM_NONE cases for arm in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/Build        |  2 -
 tools/perf/arch/arm/util/dwarf-regs.c | 61 ---------------------------
 tools/perf/util/dwarf-regs.c          |  4 +-
 tools/perf/util/include/dwarf-regs.h  |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 tools/perf/arch/arm/util/dwarf-regs.c

diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index e06fea1ea8ff..f7a8b37d1c68 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,7 +1,5 @@
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
-
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
diff --git a/tools/perf/arch/arm/util/dwarf-regs.c b/tools/perf/arch/arm/util/dwarf-regs.c
deleted file mode 100644
index fc5f71c91802..000000000000
--- a/tools/perf/arch/arm/util/dwarf-regs.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2010 Will Deacon, ARM Ltd.
- */
-
-#include <stddef.h>
-#include <linux/stringify.h>
-#include <dwarf-regs.h>
-
-struct pt_regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
-#define GPR_DWARFNUM_NAME(num) \
-	{.name = __stringify(%r##num), .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-/*
- * Reference:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ihi0040a/IHI0040A_aadwarf.pdf
- */
-static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
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
-	REG_DWARFNUM_NAME("%fp", 11),
-	REG_DWARFNUM_NAME("%ip", 12),
-	REG_DWARFNUM_NAME("%sp", 13),
-	REG_DWARFNUM_NAME("%lr", 14),
-	REG_DWARFNUM_NAME("%pc", 15),
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
-	const struct pt_regs_dwarfnum *roff;
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (roff->dwarfnum == n)
-			return roff->name;
-	return NULL;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 18e916c8e993..fd21f9e90e40 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,14 +32,14 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 			     unsigned int flags __maybe_unused)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64
+#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
 #endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index e640657f69c8..0b533409d82a 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,7 +79,7 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__)
+#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
