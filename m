Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3ADD2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G47mKabIVFDq+DngpUjvTKDP4h5gPCJ3nOh+54zLZSE=; b=JeYLS4JgiXRPaw
	q1mLySOU+EeQavx+TL1GTHA6dP6OnYpFjWx6hP8/M1JgaBy4VIenu2zGKAws86N877N4Ulhp3h9Il
	GvW0mdctwZHjhWIYYpda0sVblElrF49EOA3rqYvcDbrh18QZsa6Qvz+DfKGlIzUhaLDcsrMvBpCj4
	FttTiZMaH387e4up+Fu5NQPrwBB3VSWh3TPCi0IJpWstFZeRDdezorjRCJ5O38WHKvy8xvlW1GFoE
	frIWveE1VC+9hBM5AuXbZav5VMDqbYWkgnO3TZT0/nWt4dK6tGK9VZQEKKHPk+OGAzN/xj9UyZIWI
	XSBiDJ4+98Ia8jFTr7/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1FI2-0000000DSBD-0lRP;
	Thu, 17 Oct 2024 01:26:58 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EL3-0000000DKMX-0KBh
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:26:03 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e28b624bfcso10032997b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124759; x=1729729559; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=458YiwCEQu0xyWW32bw076GTqYPd++B/pRRG623ToYM=;
        b=wF3ybmJ0JgGorPnm3OQs17s1rKhCZ1K0ooiZRkpkdYUfjIwVluXNUxDr7rhoxYFjIX
         Jt5OMfruyN293U64C3vZE/d9f6w4klSdsJmy12y9daKCfv04baCzmnFjPcPMGiuiaR0v
         /r//naEQJa3c2j9A5Vc0VYEmXQV9NGmvpMEqzfV8is287LOHXamMDlFDX8Amer3m80Og
         9pkLtVHa/1xZXGUgcYIJbreAn2FWsB2dyryqp8s9tWkVkupc45baV/6zMOQmYWxF0742
         CTIBy2MKJ4TXuwmB7M0EnEkQDOEuiRf1e4DrZR559YZl8bRRXbanh7Jc+cPwoGc+zCWq
         LbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124759; x=1729729559;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=458YiwCEQu0xyWW32bw076GTqYPd++B/pRRG623ToYM=;
        b=qOYzKN/W0c8behKX63AF3Bc+Pxl1gpcdIEOZ6uMKEfFIO31Tn7uBxi47N1GvOxtw7Q
         x8vJk72WSiqKyJHIHIbQtOSSu36KFboCXq345p7MPXbfjezif1uVUNyIpqtxWoSECgou
         AGR4fH8CQkMVf1WER40nqFdw/9wRRoaUsi0loksrYsStFB+fTlwD0nhu635nQG+fci/8
         LwWnWTYKXbk8ZmQbbW+e9nYQgKhZyBb6RfMaJNoFokGQ/wmvHuIetYlD5HucwFQYtgkV
         QLjJXDRvRCtC5ZWIPOInK1bL8roXwSJKg/kAWQQGc/wmRzkhU1NpJ6sdtRtS1UlxvGHc
         wagg==
X-Forwarded-Encrypted: i=1; AJvYcCUhzt8eD9uVklJX1d2inbK/zWRrpYhPxs1Ke+bA2C2jKfFerkeRVR/WMxOR8hqFWQ7lA7d6jDuC12L1AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlaMX1s8+t7MGygBYfapwZUbFbzl+peJ29gyCxbUfj2rXlFoax
	ZbfbLRjULeZF1BMctuzTNRfvHgIKcS3iL+6EW+/0lRGXBCIUUW/0/nAYzevlSD8WlbwwVNKi+6w
	I82sZ2w==
X-Google-Smtp-Source: AGHT+IHe2nHx8WZSMOYKcxMW4gIJHHBFN2zTVNS46VHOfujhdM1R4tNVwqUCaJ+215uPJw6HHmJzRBUSoCC9
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a05:690c:3345:b0:6e3:d670:f603 with SMTP
 id 00721157ae682-6e3d670fa35mr870367b3.3.1729124759496; Wed, 16 Oct 2024
 17:25:59 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:13 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-14-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 13/20] perf dwarf-regs: Move powerpc dwarf-regs out of arch
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
X-CRM114-CacheID: sfid-20241016_172601_153895_2FBB4642 
X-CRM114-Status: GOOD (  24.44  )
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

Move arch/powerpc/util/dwarf-regs.c to util/dwarf-regs-powerpc.c and
compile in unconditionally. get_arch_regstr is redundant when EM_NONE
is treated as EM_HOST so remove and update dwarf-regs.c conditions.
Make get_powerpc_regs unconditionally available whwn libdw is.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/powerpc/util/Build        |   1 -
 tools/perf/arch/powerpc/util/dwarf-regs.c | 141 ----------------------
 tools/perf/util/Build                     |   1 +
 tools/perf/util/dwarf-regs-powerpc.c      |  61 ++++++++++
 tools/perf/util/dwarf-regs.c              |   6 +-
 tools/perf/util/include/dwarf-regs.h      |   9 +-
 6 files changed, 70 insertions(+), 149 deletions(-)
 delete mode 100644 tools/perf/arch/powerpc/util/dwarf-regs.c
 create mode 100644 tools/perf/util/dwarf-regs-powerpc.c

diff --git a/tools/perf/arch/powerpc/util/Build b/tools/perf/arch/powerpc/util/Build
index 3d979480a188..ed82715080f9 100644
--- a/tools/perf/arch/powerpc/util/Build
+++ b/tools/perf/arch/powerpc/util/Build
@@ -7,7 +7,6 @@ perf-util-y += sym-handling.o
 perf-util-y += evsel.o
 perf-util-y += event.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW) += skip-callchain-idx.o
 
 perf-util-$(CONFIG_LIBUNWIND) += unwind-libunwind.o
diff --git a/tools/perf/arch/powerpc/util/dwarf-regs.c b/tools/perf/arch/powerpc/util/dwarf-regs.c
deleted file mode 100644
index 23846c59a522..000000000000
--- a/tools/perf/arch/powerpc/util/dwarf-regs.c
+++ /dev/null
@@ -1,141 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2010 Ian Munsie, IBM Corporation.
- */
-
-#include <stddef.h>
-#include <errno.h>
-#include <string.h>
-#include <dwarf-regs.h>
-#include <linux/kernel.h>
-#include <linux/stringify.h>
-
-struct regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num)					\
-	{.name = __stringify(%)__stringify(r), .dwarfnum = num}
-#define GPR_DWARFNUM_NAME(num)						\
-	{.name = __stringify(%gpr##num), .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-/*
- * Reference:
- * http://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi-1.9.html
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
-	GPR_DWARFNUM_NAME(30),
-	GPR_DWARFNUM_NAME(31),
-	REG_DWARFNUM_NAME(msr,   66),
-	REG_DWARFNUM_NAME(ctr,   109),
-	REG_DWARFNUM_NAME(link,  108),
-	REG_DWARFNUM_NAME(xer,   101),
-	REG_DWARFNUM_NAME(dar,   119),
-	REG_DWARFNUM_NAME(dsisr, 118),
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
-
-#define PPC_OP(op)	(((op) >> 26) & 0x3F)
-#define PPC_RA(a)	(((a) >> 16) & 0x1f)
-#define PPC_RT(t)	(((t) >> 21) & 0x1f)
-#define PPC_RB(b)	(((b) >> 11) & 0x1f)
-#define PPC_D(D)	((D) & 0xfffe)
-#define PPC_DS(DS)	((DS) & 0xfffc)
-#define OP_LD	58
-#define OP_STD	62
-
-static int get_source_reg(u32 raw_insn)
-{
-	return PPC_RA(raw_insn);
-}
-
-static int get_target_reg(u32 raw_insn)
-{
-	return PPC_RT(raw_insn);
-}
-
-static int get_offset_opcode(u32 raw_insn)
-{
-	int opcode = PPC_OP(raw_insn);
-
-	/* DS- form */
-	if ((opcode == OP_LD) || (opcode == OP_STD))
-		return PPC_DS(raw_insn);
-	else
-		return PPC_D(raw_insn);
-}
-
-/*
- * Fills the required fields for op_loc depending on if it
- * is a source or target.
- * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
- * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
- * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
- */
-void get_powerpc_regs(u32 raw_insn, int is_source,
-		struct annotated_op_loc *op_loc)
-{
-	if (is_source)
-		op_loc->reg1 = get_source_reg(raw_insn);
-	else
-		op_loc->reg1 = get_target_reg(raw_insn);
-
-	if (op_loc->multi_regs)
-		op_loc->reg2 = PPC_RB(raw_insn);
-
-	/* TODO: Implement offset handling for X Form */
-	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
-		op_loc->offset = get_offset_opcode(raw_insn);
-}
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 99ae4e2802b8..eeab8684ddcc 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -204,6 +204,7 @@ perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-csky.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-powerpc.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
diff --git a/tools/perf/util/dwarf-regs-powerpc.c b/tools/perf/util/dwarf-regs-powerpc.c
new file mode 100644
index 000000000000..caf77a234c78
--- /dev/null
+++ b/tools/perf/util/dwarf-regs-powerpc.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Mapping of DWARF debug register numbers into register names.
+ *
+ * Copyright (C) 2010 Ian Munsie, IBM Corporation.
+ */
+
+#include <dwarf-regs.h>
+
+#define PPC_OP(op)	(((op) >> 26) & 0x3F)
+#define PPC_RA(a)	(((a) >> 16) & 0x1f)
+#define PPC_RT(t)	(((t) >> 21) & 0x1f)
+#define PPC_RB(b)	(((b) >> 11) & 0x1f)
+#define PPC_D(D)	((D) & 0xfffe)
+#define PPC_DS(DS)	((DS) & 0xfffc)
+#define OP_LD	58
+#define OP_STD	62
+
+static int get_source_reg(u32 raw_insn)
+{
+	return PPC_RA(raw_insn);
+}
+
+static int get_target_reg(u32 raw_insn)
+{
+	return PPC_RT(raw_insn);
+}
+
+static int get_offset_opcode(u32 raw_insn)
+{
+	int opcode = PPC_OP(raw_insn);
+
+	/* DS- form */
+	if ((opcode == OP_LD) || (opcode == OP_STD))
+		return PPC_DS(raw_insn);
+	else
+		return PPC_D(raw_insn);
+}
+
+/*
+ * Fills the required fields for op_loc depending on if it
+ * is a source or target.
+ * D form: ins RT,D(RA) -> src_reg1 = RA, offset = D, dst_reg1 = RT
+ * DS form: ins RT,DS(RA) -> src_reg1 = RA, offset = DS, dst_reg1 = RT
+ * X form: ins RT,RA,RB -> src_reg1 = RA, src_reg2 = RB, dst_reg1 = RT
+ */
+void get_powerpc_regs(u32 raw_insn, int is_source,
+		struct annotated_op_loc *op_loc)
+{
+	if (is_source)
+		op_loc->reg1 = get_source_reg(raw_insn);
+	else
+		op_loc->reg1 = get_target_reg(raw_insn);
+
+	if (op_loc->multi_regs)
+		op_loc->reg2 = PPC_RB(raw_insn);
+
+	/* TODO: Implement offset handling for X Form */
+	if ((op_loc->mem_ref) && (PPC_OP(raw_insn) != 31))
+		op_loc->offset = get_offset_opcode(raw_insn);
+}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index d536964df43c..3d98c2bf6035 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,7 +32,8 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags)
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
-    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS
+    || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
+    || EM_HOST == EM_PPC64
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -40,7 +41,8 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #endif
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
-    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS
+    && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
+    && EM_HOST != EM_PPC64
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 1f771b635789..1763280855ce 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -80,7 +80,8 @@
 
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
-    && !defined(__loongarch__) && !defined(__mips__)
+    && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
+    && !defined(__powerpc64__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
@@ -107,6 +108,8 @@ int get_arch_regnum(const char *name);
  */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags);
 
+void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
+
 #else /* HAVE_LIBDW_SUPPORT */
 
 static inline int get_dwarf_regnum(const char *name __maybe_unused,
@@ -115,16 +118,12 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 {
 	return -1;
 }
-#endif
 
-#if !defined(__powerpc__) || !defined(HAVE_LIBDW_SUPPORT)
 static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source __maybe_unused,
 		struct annotated_op_loc *op_loc __maybe_unused)
 {
 	return;
 }
-#else
-void get_powerpc_regs(u32 raw_insn, int is_source, struct annotated_op_loc *op_loc);
 #endif
 
 #endif
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
