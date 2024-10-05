Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BEB6CFB42D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fiTPJ3NUHE5Mm0Lq8SN25gL6EuaLYjol3R0/LV+JZs=; b=jZXNo3UrIyUyf9
	0fzAyLXF6ZVaDkTBwJkqQKWw/fYNCOS1owt9XHmig9qtEvg+VCnAdbUelFFVvQ1BLTq2buDhLsQhJ
	pyJwhO+sMcmAEYllgOQmoy5ihk5VWN9rPFb+xydWe5rZTxPEQmvaOJpsYV/N/DPZI2YTSnzH2S6dl
	Hf1Wr6XlQNiDY4sn2k/wZqBVJq13dPDdLHyFSo2abe/9H+2IaQaE8YRu6UUuXgQUk40xoJDjAaqLB
	szKNyOcNvLjNv2utRu9DLe4yADdxqhX7Ds5S/K0yh1BjokPl4dJCgeDunf41UAZK8dPLyAyatWr2o
	j1BeKxUU3dsLOkNkyeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxBJG-0000000Fu1U-2ro6;
	Sat, 05 Oct 2024 20:23:26 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtV-0000000FqHG-0orm
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:50 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2555d3d0eso54459367b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158207; x=1728763007; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4nfym4aHRABgeK2o4kYgh7MQauDKY/5wnwGVKCXL/U=;
        b=jB2YAmQ2aquylibicoJhTp8EiILDgus762tjZLiYJkFDoaD5FfM1ETqUTmApoFGgaj
         e4Q2fBXb1RB8E3lG4uZZt9DNVsav8fwtuSW5HtnYSdvj4F0ImDFFKnP3z1XRuy/sWwmD
         kkFvz0eqPYxC2APrvZiQgpXMbAXb2cKLfblml3XTy2KgehxlOTZKELcHvCWZ5p043uGh
         3k05nfh1fmEeEYSR2/l1qnq47iInLoFmzk1x/HHVUoV49QHBWFZA0C27jiCDX7k9arpZ
         cYC+kztPxrIeFDjktu3tf7mKzK/WcvyMc9guNtSwPSr2j+dj1mAh5yBAqyu4XicjkDK0
         WlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158207; x=1728763007;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4nfym4aHRABgeK2o4kYgh7MQauDKY/5wnwGVKCXL/U=;
        b=iKb7wJEnMWmOjD5ox5Muqtor16X9oBafvwDDFE+JtHz+v87mKMejbrb8lxwjEMEK/r
         dLSazkNQABQMS5/jNtaZ4FY8v1s/KATZstunahUJvNdNYyrr4A0GW/uBiRSEqGrsoqWV
         BMHn0lrpa99W1nzmtO+lA8WfRcA9YMO2EEc01jC1EQSPt0X++fHsfZxwqBrUfvbLp0nM
         CNJkrnRiiP8Ltv+jP+FJypqaOAsWUUM+wUQT7yx/rCP3MJq+5P50w3AtQq/rIqaJS4Ea
         GSzodoSPa7xVmUjtfC6Qs5fM7DCxpMnJBr2dT2rbxFLtg+sRO9ABgDQF5zXkv8Mdsm83
         d8pg==
X-Forwarded-Encrypted: i=1; AJvYcCVGtRVu6yWvlAyfS3+Ghs8sg022QAtmexbOBtXX0vE29lrhPCmWl2SjqJ4KaFW4dP7QJmIqOfEldIaxGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl8EjfMp3YnF4z6i5Luk/r5SHb99QmF3s/5rswTM6O/6bp0Ix3
	XiLpYEKVjPcJhxvfE6qMs8izXOQXQdrZDuQDbTjD+Kk4tEReud9hWg6LNHBOmQKOK7BUc5AWUhs
	ZmdF4wg==
X-Google-Smtp-Source: AGHT+IGwFa7Hd++IIPfhdwWa5aoWpwfc5FH4Qfd2Wi5L5CDLWvwjg7FsZhYuik7PKcUvMabRjFi+c5q2jqfZ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a81:93c7:0:b0:6b1:8b74:978a with SMTP id
 00721157ae682-6e2c728f13bmr1856917b3.4.1728158207463; Sat, 05 Oct 2024
 12:56:47 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:32 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-23-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 22/31] perf loongarch: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241005_125649_266432_E7FB9E54 
X-CRM114-Status: GOOD (  16.77  )
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
EM_NONE cases for loongarch in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build        |  1 -
 tools/perf/arch/loongarch/util/dwarf-regs.c | 34 ---------------------
 tools/perf/util/dwarf-regs.c                |  4 +--
 tools/perf/util/include/dwarf-regs.h        |  3 +-
 4 files changed, 4 insertions(+), 38 deletions(-)
 delete mode 100644 tools/perf/arch/loongarch/util/dwarf-regs.c

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 06ff95394921..0aa31986ecb5 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,7 +1,6 @@
 perf-util-y += header.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW)     += dwarf-regs.o
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
diff --git a/tools/perf/arch/loongarch/util/dwarf-regs.c b/tools/perf/arch/loongarch/util/dwarf-regs.c
deleted file mode 100644
index bee08fdcf2fd..000000000000
--- a/tools/perf/arch/loongarch/util/dwarf-regs.c
+++ /dev/null
@@ -1,34 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * dwarf-regs.c : Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2020-2023 Loongson Technology Corporation Limited
- */
-
-#include <stdio.h>
-#include <errno.h> /* for EINVAL */
-#include <string.h> /* for strcmp */
-#include <dwarf-regs.h>
-
-struct pt_regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-static struct pt_regs_dwarfnum loongarch_gpr_table[] = {
-	{"%r0", 0}, {"%r1", 1}, {"%r2", 2}, {"%r3", 3},
-	{"%r4", 4}, {"%r5", 5}, {"%r6", 6}, {"%r7", 7},
-	{"%r8", 8}, {"%r9", 9}, {"%r10", 10}, {"%r11", 11},
-	{"%r12", 12}, {"%r13", 13}, {"%r14", 14}, {"%r15", 15},
-	{"%r16", 16}, {"%r17", 17}, {"%r18", 18}, {"%r19", 19},
-	{"%r20", 20}, {"%r21", 21}, {"%r22", 22}, {"%r23", 23},
-	{"%r24", 24}, {"%r25", 25}, {"%r26", 26}, {"%r27", 27},
-	{"%r28", 28}, {"%r29", 29}, {"%r30", 30}, {"%r31", 31},
-	{NULL, 0}
-};
-
-const char *get_arch_regstr(unsigned int n)
-{
-	n %= 32;
-	return loongarch_gpr_table[n].name;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 9a76f83af62c..efc41d0fbee9 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,7 +32,7 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY
+    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -40,7 +40,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #endif
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY
+    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index b72d9d308ce4..4f205a58db89 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,7 +79,8 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__)
+#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
+    && !defined(__loongarch__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
