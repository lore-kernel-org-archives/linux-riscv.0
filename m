Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0793CCFB43F
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekzVB19EN7jauLOCJ78wxljSfbURRNAIp7KXfj+okc4=; b=k2eP03BSrORfOf
	kTtlTlhZ64GoeQR9plDRNc9DqQ+/l1dTenmS1wRbIxy9yRK1NcuSkjLcM2Ukeh4CSwkS9uigIZleO
	3wg3JiTBYoT9q9hiEO8DzdimfdFCqDdFBiSH4RMY7PDolZJtsohOtau5Yq0DgEaVFk+5pwnKb9j9s
	g88UREUrC5faQqDSxtegKr8P94b+CKG65KX2uIBC9VjgamrnwU7sti2n1mUUW/nY/D77TwmhdIVMQ
	ct2o9Y3OuP0M7zRASBXMBAC3pGfuFqSlxWMC4c3qoEADh2yMLsxPfRhKl1ZELvVgp3UEiv1gll3wb
	h0B+AEHcwb199vOw0Gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCNv-0000000Fz2b-0o5B;
	Sat, 05 Oct 2024 21:32:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtc-0000000FqLv-0Rtu
	for linux-riscv@bombadil.infradead.org;
	Sat, 05 Oct 2024 19:56:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3UNBBKLriPYWF4cbzt+fW/Yb0JAtoFXD8tWOi1OErdE=; b=BEHntzWSRMGZGR5Knc8RfpTjTQ
	cOLVkYy8e2nxaXr/Our067fb2HdDzZy2GHfBSFyYVCpBzAdTCRpsAMMvwhMfwRnPnUAKJ2rq/KQ+1
	+/N51kYJphR7/axaEcJyoy7H/Cxd3cYU9UY0aoQm1j6gGOPw/Wmp625aX/nDB6poKxvj4kWJkb76Y
	6xoGyqR6sWzDy1C4opq2Qg7R5UCxMFQoWw3+6gshz7pGC1BNqDiVIOP+e1P7hC+Pw1FpEA436f0Pw
	sOVqXkhjczvP4Hb3bgkmZq6W+WM2ltN5gdcXQcdnD5qJ4YWwtDUoQj1RPL37lelG7MtIReYEhsTHU
	aUiWmWxA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtX-000000045qT-23MO
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:54 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2d1860a62so23748887b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158209; x=1728763009; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UNBBKLriPYWF4cbzt+fW/Yb0JAtoFXD8tWOi1OErdE=;
        b=AptQNRsmCVWf/4GNNvIw0Pi4H3lX0U3gh/JIET4ryXij2BPtH/DCvb/21pkTlmR2xz
         dKCJNGFMIFNgqhZJFwPWRkfAYEETqN+ydcxud1M92UyUGpxBnY2PoDvsDxB0i53WkFih
         gLLyc0MH75zQtWO5m6QN0oe1t/wLDQAWd1qEh9GHj9uswnEjDwbY+Bfdz+WY11TrEZtA
         gWFstxs+yNsN+FFZ/2iR9o8peFdFza91Xo3+fIY+L2eJkd2+SruYjxCN1T2Hz2xZwnlm
         CEx15rzFMn7IxPLxRmAsSY1kDqUZwWEPTMtPkHAgkCtohQcKisToVwnbKgM0dgBzKtz5
         tddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158209; x=1728763009;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3UNBBKLriPYWF4cbzt+fW/Yb0JAtoFXD8tWOi1OErdE=;
        b=AbENYGF5f2solG+oy0DG5VK+6DhdFdPJOkLMxudjuP5SSJGW1NLJmK7EnGUGaT4I8G
         pk7pl84XGivYVnu/liBbMYHu84z/V9U3RXtq5VvHQkvVKsdlQR+s0wGbUG5flmABhP8y
         mvd2/aXcPRRIiUh3b0UAKbhcl8z3pjIKxErM2R02fFdHc9A4jV2SlRjEC8TKIqSkQyBf
         +Uk4XWurwtRTAcYulD7Y3fjEyWcaYjc/Jh7j1s3GVoKu3PFozRM8TY0OpAjIc+abaG2Q
         bx69Vum4kQ/Zw/WlNKhGJQnZS7Ua2uF5p28PjpzUs9IvSVqpTd1L3d6QPOkv4O+ToZAC
         wRTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAd7MopD01DdnauS5Miil+UUAEG1SD1M0CXZwdUq4kO+ZbdoOLzqqwSrjFcMENNW3r6wdGMevhsfv+sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9QnGt6Q0QhfYVHSP3zcyYn4SnSZegX0TAqmwMBLHaYfpaIRp
	JTHjJUc0jC/YfQpNUyd6owBEPQP08g2f7fh8C/sgHXJ6mt49jSBd8donnca0wJ4ZeDwGlT2jqne
	xgbKfgA==
X-Google-Smtp-Source: AGHT+IGd8n4duwoirMvSpqfOv40zKZGdVHyzgM8WiLhDFeOCNQk3EZ65qgcXqmWv7lPgqHaXqfVgKLepfmDX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:2b8e:b0:6dd:d138:d823 with SMTP
 id 00721157ae682-6e2c72adbdamr920857b3.8.1728158209657; Sat, 05 Oct 2024
 12:56:49 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:33 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-24-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 23/31] perf mips: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241005_205651_707830_ACDB1135 
X-CRM114-Status: GOOD (  19.66  )
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
EM_NONE cases for mips in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/mips/util/Build        |  1 -
 tools/perf/arch/mips/util/dwarf-regs.c | 38 --------------------------
 tools/perf/util/dwarf-regs.c           |  4 +--
 tools/perf/util/include/dwarf-regs.h   |  2 +-
 4 files changed, 3 insertions(+), 42 deletions(-)
 delete mode 100644 tools/perf/arch/mips/util/dwarf-regs.c

diff --git a/tools/perf/arch/mips/util/Build b/tools/perf/arch/mips/util/Build
index b328109fc16c..691fa2051958 100644
--- a/tools/perf/arch/mips/util/Build
+++ b/tools/perf/arch/mips/util/Build
@@ -1,3 +1,2 @@
 perf-util-y += perf_regs.o
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/mips/util/dwarf-regs.c b/tools/perf/arch/mips/util/dwarf-regs.c
deleted file mode 100644
index 25c13a91c2a7..000000000000
--- a/tools/perf/arch/mips/util/dwarf-regs.c
+++ /dev/null
@@ -1,38 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * dwarf-regs.c : Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2013 Cavium, Inc.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- */
-
-#include <stdio.h>
-#include <dwarf-regs.h>
-
-static const char *mips_gpr_names[32] = {
-	"$0", "$1", "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9",
-	"$10", "$11", "$12", "$13", "$14", "$15", "$16", "$17", "$18", "$19",
-	"$20", "$21", "$22", "$23", "$24", "$25", "$26", "$27", "$28", "$29",
-	"$30", "$31"
-};
-
-const char *get_arch_regstr(unsigned int n)
-{
-	if (n < 32)
-		return mips_gpr_names[n];
-	if (n == 64)
-		return "hi";
-	if (n == 65)
-		return "lo";
-	return NULL;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index efc41d0fbee9..d536964df43c 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,7 +32,7 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH
+    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -40,7 +40,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #endif
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH
+    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 4f205a58db89..1f771b635789 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -80,7 +80,7 @@
 
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__)
+    && !defined(__loongarch__) && !defined(__mips__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
