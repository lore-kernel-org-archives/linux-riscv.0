Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FF8C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C7D2613DD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 18:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C7D2613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lK7gTSaZp/dMxezGaYbyNXknEu2QTdIpD0zdK676kw=; b=sy+YT8cyxSfamZ
	5NjGJnB+0D6ykeu8AciYucL8dn6+MBALMlRU+YU7vfk3ARiUVBOrca5cJUDYKPowrTginW2wwwzOd
	JqbfWMkjzV7GDVzYiE60JXuxyUVWGJEU+jC4zTopfPwcJjNi2ut/PVaCZtJ6XzC7wYJr6igqWwIZA
	aDUpbdm5pnvzWXPsK+13EvuOodHiaCu3UFF7h++00Au+KwF7UwD3JRl+dlVReFt55fNoMKqlQkAWy
	+AVIs1GF/z/QJoKD7YWuoQXAIAYN8zy/otfsgUy1qLvam3rkgwicwuu1scRIDwytP4VMojau5cA1E
	BRN190ZYofVNW1i4SH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmhTh-000Ms3-Tk; Fri, 28 May 2021 18:45:02 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmhTD-000Mad-G5
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 18:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1622227470; x=1653763470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=10TpbH1th4Vs31dZ/IczJlEwAThnMg54YsywHWcTI/A=;
 b=JlgE9TzrErxV4hAnX0g2IQtawBOeuJ4hQzp3wVHLiujG0lYfJwU095oT
 OjoIPO6PE2FgDq6AHIDXSDxb7xbCd39D3Yobm4pfrriWY5cpE2NjS9DSZ
 VOoChuT+9BfdEYNKU71mVwRPfUMX+Wah5vfImkvbpj2lo6PO4VFWBlzj+
 cKHDJfgEat0z+JYv2EJW+cImndO3bh9r1Z6o+CeezH8vQ5tddB9PcWIPl
 OZeGXaILIAnYqTt2gwMzVP5ZDkKLPbSYtKvzOuD4MkZuoE5qkEWAIHVMr
 4JiLhNxys8ulnzm1xauxPHWgK5LYnPyjyBywdKuViTpzfoy4F6YjUEryA w==;
IronPort-SDR: 26A3tTkHKlaHDKEm1tejZRebj1NdLndvNU57g87mjVdGVpIH9/IBJCcQvxPnmNus8Kqhmm2ep4
 U/krD5HfHaO4SYOFn49bjgfDfBMGG+zSuJif5oqvYmsdSJgLMHrIX9vNUvlXO9Yw90/2MyJoWA
 Ha5E6hffR8um5/Rj0zdlP10QJv0wTJ1ePpp28PCbjfz3fVLMJ+SIbC06CGgyCyCMLqV2gK2iDA
 nr9fhEfep146a8DnvxSGzaL7IV4nEA7qQEDmFDRPsSFYg6mT8fy2yjDA+A67IrR/sbGoyPysWs
 YJg=
X-IronPort-AV: E=Sophos;i="5.83,230,1616428800"; d="scan'208";a="174577171"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 29 May 2021 02:44:28 +0800
IronPort-SDR: 4qkTxfZZCQSruUg+9YZjNQQ4tPhKwiLWufoasQCXeRYWgoKN8VsvvxgutHISfHtMjArB4qXTc7
 dUm5kNRIlI1HTGCea52OmvUI4Rf2GkvE4DGRKcId0JmhEkw71HRxqfDyWhqKkB69O5EBPZEkaS
 yQcI2m5CPV5Ocs7Q2+2ZOJVXS1NRDAXRKeqizv0G8dM+c9Jp4P4U7fC7xQF4fQshfCjaVyexj2
 SJVH81WDz7nJV0ZnbekGnn7sdxgNhHSTQzSnhBTSnH85ETCrpBL8QZVcQZkdV8GK4X0RLjZGpo
 4Gb7cMtRSZPN+0lDU/EoWZ+h
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2021 11:22:30 -0700
IronPort-SDR: Pk3/dxRmYX6dBtr859j+8+tPQD2ohmU/wf39YKKI7Ye/SUEEXXvh3QVGkIjXsrubGotHHxSJq7
 KNIjdrwNkVLoRtQL0b4GSMYK7u9kGXEAaeQz0JyAZJY6+7ym2LdksoC7catGk2syZWiZQGLtxK
 wjyAMutD1x24i+jl8zkByrxS98LjtpFpvKi58iST5ZE5wKmzPvG9QHOgxhcQLsQS9+fSNuI+m+
 ABae4UAX1z6I8vrbgqd0TlrCAUkna1AZGBxndQUASpb16wpgQ3DFiD1qe9k3kei3RA00sEuCkS
 R9g=
WDCIronportException: Internal
Received: from unknown (HELO jedi-01.wdc.com) ([10.225.163.91])
 by uls-op-cesaip02.wdc.com with ESMTP; 28 May 2021 11:44:25 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 bpf@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-doc@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alan Kao <alankao@andestech.com>,
 Nick Hu <nickhu@andestech.com>, Vincent Chen <vincent.chen@sifive.com>
Subject: [RFC v2 1/7] RISC-V: Remove the current perf implementation
Date: Fri, 28 May 2021 11:43:59 -0700
Message-Id: <20210528184405.1793783-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210528184405.1793783-1-atish.patra@wdc.com>
References: <20210528184405.1793783-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210528_114431_596627_36394A7A 
X-CRM114-Status: GOOD (  28.98  )
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

The current perf implementation in RISC-V is not very useful as it can not
count any events other than cycle/instructions. Moreover, perf record
can not be used or the events can not be started or stopped.

Remove the implementation now for a better platform driver in future
that will implement most of the missing functionality.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/Kconfig                  |  13 -
 arch/riscv/include/asm/perf_event.h |  72 -----
 arch/riscv/kernel/Makefile          |   1 -
 arch/riscv/kernel/perf_event.c      | 485 ----------------------------
 4 files changed, 571 deletions(-)
 delete mode 100644 arch/riscv/kernel/perf_event.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..5872e5b62fdf 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -354,19 +354,6 @@ config RISCV_ISA_C
 
 	   If you don't know what to do here, say Y.
 
-menu "supported PMU type"
-	depends on PERF_EVENTS
-
-config RISCV_BASE_PMU
-	bool "Base Performance Monitoring Unit"
-	def_bool y
-	help
-	  A base PMU that serves as a reference implementation and has limited
-	  feature of perf.  It can run on any RISC-V machines so serves as the
-	  fallback, but this option can also be disable to reduce kernel size.
-
-endmenu
-
 config FPU
 	bool "FPU support"
 	default y
diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index 062efd3a1d5d..dc6d5803c0e2 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -9,77 +9,5 @@
 #define _ASM_RISCV_PERF_EVENT_H
 
 #include <linux/perf_event.h>
-#include <linux/ptrace.h>
-#include <linux/interrupt.h>
-
-#ifdef CONFIG_RISCV_BASE_PMU
-#define RISCV_BASE_COUNTERS	2
-
-/*
- * The RISCV_MAX_COUNTERS parameter should be specified.
- */
-
-#define RISCV_MAX_COUNTERS	2
-
-/*
- * These are the indexes of bits in counteren register *minus* 1,
- * except for cycle.  It would be coherent if it can directly mapped
- * to counteren bit definition, but there is a *time* register at
- * counteren[1].  Per-cpu structure is scarce resource here.
- *
- * According to the spec, an implementation can support counter up to
- * mhpmcounter31, but many high-end processors has at most 6 general
- * PMCs, we give the definition to MHPMCOUNTER8 here.
- */
-#define RISCV_PMU_CYCLE		0
-#define RISCV_PMU_INSTRET	1
-#define RISCV_PMU_MHPMCOUNTER3	2
-#define RISCV_PMU_MHPMCOUNTER4	3
-#define RISCV_PMU_MHPMCOUNTER5	4
-#define RISCV_PMU_MHPMCOUNTER6	5
-#define RISCV_PMU_MHPMCOUNTER7	6
-#define RISCV_PMU_MHPMCOUNTER8	7
-
-#define RISCV_OP_UNSUPP		(-EOPNOTSUPP)
-
-struct cpu_hw_events {
-	/* # currently enabled events*/
-	int			n_events;
-	/* currently enabled events */
-	struct perf_event	*events[RISCV_MAX_COUNTERS];
-	/* vendor-defined PMU data */
-	void			*platform;
-};
-
-struct riscv_pmu {
-	struct pmu	*pmu;
-
-	/* generic hw/cache events table */
-	const int	*hw_events;
-	const int	(*cache_events)[PERF_COUNT_HW_CACHE_MAX]
-				       [PERF_COUNT_HW_CACHE_OP_MAX]
-				       [PERF_COUNT_HW_CACHE_RESULT_MAX];
-	/* method used to map hw/cache events */
-	int		(*map_hw_event)(u64 config);
-	int		(*map_cache_event)(u64 config);
-
-	/* max generic hw events in map */
-	int		max_events;
-	/* number total counters, 2(base) + x(general) */
-	int		num_counters;
-	/* the width of the counter */
-	int		counter_width;
-
-	/* vendor-defined PMU features */
-	void		*platform;
-
-	irqreturn_t	(*handle_irq)(int irq_num, void *dev);
-	int		irq;
-};
-
-#endif
-#ifdef CONFIG_PERF_EVENTS
-#define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
-#endif
 
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index d3081e4d9600..40d2c85a3a6a 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -50,7 +50,6 @@ obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
-obj-$(CONFIG_RISCV_BASE_PMU)	+= perf_event.o
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
deleted file mode 100644
index c835f0362d94..000000000000
--- a/arch/riscv/kernel/perf_event.c
+++ /dev/null
@@ -1,485 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2008 Thomas Gleixner <tglx@linutronix.de>
- * Copyright (C) 2008-2009 Red Hat, Inc., Ingo Molnar
- * Copyright (C) 2009 Jaswinder Singh Rajput
- * Copyright (C) 2009 Advanced Micro Devices, Inc., Robert Richter
- * Copyright (C) 2008-2009 Red Hat, Inc., Peter Zijlstra
- * Copyright (C) 2009 Intel Corporation, <markus.t.metzger@intel.com>
- * Copyright (C) 2009 Google, Inc., Stephane Eranian
- * Copyright 2014 Tilera Corporation. All Rights Reserved.
- * Copyright (C) 2018 Andes Technology Corporation
- *
- * Perf_events support for RISC-V platforms.
- *
- * Since the spec. (as of now, Priv-Spec 1.10) does not provide enough
- * functionality for perf event to fully work, this file provides
- * the very basic framework only.
- *
- * For platform portings, please check Documentations/riscv/pmu.txt.
- *
- * The Copyright line includes x86 and tile ones.
- */
-
-#include <linux/kprobes.h>
-#include <linux/kernel.h>
-#include <linux/kdebug.h>
-#include <linux/mutex.h>
-#include <linux/bitmap.h>
-#include <linux/irq.h>
-#include <linux/perf_event.h>
-#include <linux/atomic.h>
-#include <linux/of.h>
-#include <asm/perf_event.h>
-
-static const struct riscv_pmu *riscv_pmu __read_mostly;
-static DEFINE_PER_CPU(struct cpu_hw_events, cpu_hw_events);
-
-/*
- * Hardware & cache maps and their methods
- */
-
-static const int riscv_hw_event_map[] = {
-	[PERF_COUNT_HW_CPU_CYCLES]		= RISCV_PMU_CYCLE,
-	[PERF_COUNT_HW_INSTRUCTIONS]		= RISCV_PMU_INSTRET,
-	[PERF_COUNT_HW_CACHE_REFERENCES]	= RISCV_OP_UNSUPP,
-	[PERF_COUNT_HW_CACHE_MISSES]		= RISCV_OP_UNSUPP,
-	[PERF_COUNT_HW_BRANCH_INSTRUCTIONS]	= RISCV_OP_UNSUPP,
-	[PERF_COUNT_HW_BRANCH_MISSES]		= RISCV_OP_UNSUPP,
-	[PERF_COUNT_HW_BUS_CYCLES]		= RISCV_OP_UNSUPP,
-};
-
-#define C(x) PERF_COUNT_HW_CACHE_##x
-static const int riscv_cache_event_map[PERF_COUNT_HW_CACHE_MAX]
-[PERF_COUNT_HW_CACHE_OP_MAX]
-[PERF_COUNT_HW_CACHE_RESULT_MAX] = {
-	[C(L1D)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-	[C(L1I)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-	[C(LL)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-	[C(DTLB)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] =  RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] =  RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-	[C(ITLB)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-	[C(BPU)] = {
-		[C(OP_READ)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_WRITE)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-		[C(OP_PREFETCH)] = {
-			[C(RESULT_ACCESS)] = RISCV_OP_UNSUPP,
-			[C(RESULT_MISS)] = RISCV_OP_UNSUPP,
-		},
-	},
-};
-
-static int riscv_map_hw_event(u64 config)
-{
-	if (config >= riscv_pmu->max_events)
-		return -EINVAL;
-
-	return riscv_pmu->hw_events[config];
-}
-
-static int riscv_map_cache_decode(u64 config, unsigned int *type,
-			   unsigned int *op, unsigned int *result)
-{
-	return -ENOENT;
-}
-
-static int riscv_map_cache_event(u64 config)
-{
-	unsigned int type, op, result;
-	int err = -ENOENT;
-		int code;
-
-	err = riscv_map_cache_decode(config, &type, &op, &result);
-	if (!riscv_pmu->cache_events || err)
-		return err;
-
-	if (type >= PERF_COUNT_HW_CACHE_MAX ||
-	    op >= PERF_COUNT_HW_CACHE_OP_MAX ||
-	    result >= PERF_COUNT_HW_CACHE_RESULT_MAX)
-		return -EINVAL;
-
-	code = (*riscv_pmu->cache_events)[type][op][result];
-	if (code == RISCV_OP_UNSUPP)
-		return -EINVAL;
-
-	return code;
-}
-
-/*
- * Low-level functions: reading/writing counters
- */
-
-static inline u64 read_counter(int idx)
-{
-	u64 val = 0;
-
-	switch (idx) {
-	case RISCV_PMU_CYCLE:
-		val = csr_read(CSR_CYCLE);
-		break;
-	case RISCV_PMU_INSTRET:
-		val = csr_read(CSR_INSTRET);
-		break;
-	default:
-		WARN_ON_ONCE(idx < 0 ||	idx > RISCV_MAX_COUNTERS);
-		return -EINVAL;
-	}
-
-	return val;
-}
-
-static inline void write_counter(int idx, u64 value)
-{
-	/* currently not supported */
-	WARN_ON_ONCE(1);
-}
-
-/*
- * pmu->read: read and update the counter
- *
- * Other architectures' implementation often have a xxx_perf_event_update
- * routine, which can return counter values when called in the IRQ, but
- * return void when being called by the pmu->read method.
- */
-static void riscv_pmu_read(struct perf_event *event)
-{
-	struct hw_perf_event *hwc = &event->hw;
-	u64 prev_raw_count, new_raw_count;
-	u64 oldval;
-	int idx = hwc->idx;
-	u64 delta;
-
-	do {
-		prev_raw_count = local64_read(&hwc->prev_count);
-		new_raw_count = read_counter(idx);
-
-		oldval = local64_cmpxchg(&hwc->prev_count, prev_raw_count,
-					 new_raw_count);
-	} while (oldval != prev_raw_count);
-
-	/*
-	 * delta is the value to update the counter we maintain in the kernel.
-	 */
-	delta = (new_raw_count - prev_raw_count) &
-		((1ULL << riscv_pmu->counter_width) - 1);
-	local64_add(delta, &event->count);
-	/*
-	 * Something like local64_sub(delta, &hwc->period_left) here is
-	 * needed if there is an interrupt for perf.
-	 */
-}
-
-/*
- * State transition functions:
- *
- * stop()/start() & add()/del()
- */
-
-/*
- * pmu->stop: stop the counter
- */
-static void riscv_pmu_stop(struct perf_event *event, int flags)
-{
-	struct hw_perf_event *hwc = &event->hw;
-
-	WARN_ON_ONCE(hwc->state & PERF_HES_STOPPED);
-	hwc->state |= PERF_HES_STOPPED;
-
-	if ((flags & PERF_EF_UPDATE) && !(hwc->state & PERF_HES_UPTODATE)) {
-		riscv_pmu->pmu->read(event);
-		hwc->state |= PERF_HES_UPTODATE;
-	}
-}
-
-/*
- * pmu->start: start the event.
- */
-static void riscv_pmu_start(struct perf_event *event, int flags)
-{
-	struct hw_perf_event *hwc = &event->hw;
-
-	if (WARN_ON_ONCE(!(event->hw.state & PERF_HES_STOPPED)))
-		return;
-
-	if (flags & PERF_EF_RELOAD) {
-		WARN_ON_ONCE(!(event->hw.state & PERF_HES_UPTODATE));
-
-		/*
-		 * Set the counter to the period to the next interrupt here,
-		 * if you have any.
-		 */
-	}
-
-	hwc->state = 0;
-	perf_event_update_userpage(event);
-
-	/*
-	 * Since we cannot write to counters, this serves as an initialization
-	 * to the delta-mechanism in pmu->read(); otherwise, the delta would be
-	 * wrong when pmu->read is called for the first time.
-	 */
-	local64_set(&hwc->prev_count, read_counter(hwc->idx));
-}
-
-/*
- * pmu->add: add the event to PMU.
- */
-static int riscv_pmu_add(struct perf_event *event, int flags)
-{
-	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
-	struct hw_perf_event *hwc = &event->hw;
-
-	if (cpuc->n_events == riscv_pmu->num_counters)
-		return -ENOSPC;
-
-	/*
-	 * We don't have general conunters, so no binding-event-to-counter
-	 * process here.
-	 *
-	 * Indexing using hwc->config generally not works, since config may
-	 * contain extra information, but here the only info we have in
-	 * hwc->config is the event index.
-	 */
-	hwc->idx = hwc->config;
-	cpuc->events[hwc->idx] = event;
-	cpuc->n_events++;
-
-	hwc->state = PERF_HES_UPTODATE | PERF_HES_STOPPED;
-
-	if (flags & PERF_EF_START)
-		riscv_pmu->pmu->start(event, PERF_EF_RELOAD);
-
-	return 0;
-}
-
-/*
- * pmu->del: delete the event from PMU.
- */
-static void riscv_pmu_del(struct perf_event *event, int flags)
-{
-	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
-	struct hw_perf_event *hwc = &event->hw;
-
-	cpuc->events[hwc->idx] = NULL;
-	cpuc->n_events--;
-	riscv_pmu->pmu->stop(event, PERF_EF_UPDATE);
-	perf_event_update_userpage(event);
-}
-
-/*
- * Interrupt: a skeletion for reference.
- */
-
-static DEFINE_MUTEX(pmc_reserve_mutex);
-
-static irqreturn_t riscv_base_pmu_handle_irq(int irq_num, void *dev)
-{
-	return IRQ_NONE;
-}
-
-static int reserve_pmc_hardware(void)
-{
-	int err = 0;
-
-	mutex_lock(&pmc_reserve_mutex);
-	if (riscv_pmu->irq >= 0 && riscv_pmu->handle_irq) {
-		err = request_irq(riscv_pmu->irq, riscv_pmu->handle_irq,
-				  IRQF_PERCPU, "riscv-base-perf", NULL);
-	}
-	mutex_unlock(&pmc_reserve_mutex);
-
-	return err;
-}
-
-static void release_pmc_hardware(void)
-{
-	mutex_lock(&pmc_reserve_mutex);
-	if (riscv_pmu->irq >= 0)
-		free_irq(riscv_pmu->irq, NULL);
-	mutex_unlock(&pmc_reserve_mutex);
-}
-
-/*
- * Event Initialization/Finalization
- */
-
-static atomic_t riscv_active_events = ATOMIC_INIT(0);
-
-static void riscv_event_destroy(struct perf_event *event)
-{
-	if (atomic_dec_return(&riscv_active_events) == 0)
-		release_pmc_hardware();
-}
-
-static int riscv_event_init(struct perf_event *event)
-{
-	struct perf_event_attr *attr = &event->attr;
-	struct hw_perf_event *hwc = &event->hw;
-	int err;
-	int code;
-
-	if (atomic_inc_return(&riscv_active_events) == 1) {
-		err = reserve_pmc_hardware();
-
-		if (err) {
-			pr_warn("PMC hardware not available\n");
-			atomic_dec(&riscv_active_events);
-			return -EBUSY;
-		}
-	}
-
-	switch (event->attr.type) {
-	case PERF_TYPE_HARDWARE:
-		code = riscv_pmu->map_hw_event(attr->config);
-		break;
-	case PERF_TYPE_HW_CACHE:
-		code = riscv_pmu->map_cache_event(attr->config);
-		break;
-	case PERF_TYPE_RAW:
-		return -EOPNOTSUPP;
-	default:
-		return -ENOENT;
-	}
-
-	event->destroy = riscv_event_destroy;
-	if (code < 0) {
-		event->destroy(event);
-		return code;
-	}
-
-	/*
-	 * idx is set to -1 because the index of a general event should not be
-	 * decided until binding to some counter in pmu->add().
-	 *
-	 * But since we don't have such support, later in pmu->add(), we just
-	 * use hwc->config as the index instead.
-	 */
-	hwc->config = code;
-	hwc->idx = -1;
-
-	return 0;
-}
-
-/*
- * Initialization
- */
-
-static struct pmu min_pmu = {
-	.name		= "riscv-base",
-	.event_init	= riscv_event_init,
-	.add		= riscv_pmu_add,
-	.del		= riscv_pmu_del,
-	.start		= riscv_pmu_start,
-	.stop		= riscv_pmu_stop,
-	.read		= riscv_pmu_read,
-};
-
-static const struct riscv_pmu riscv_base_pmu = {
-	.pmu = &min_pmu,
-	.max_events = ARRAY_SIZE(riscv_hw_event_map),
-	.map_hw_event = riscv_map_hw_event,
-	.hw_events = riscv_hw_event_map,
-	.map_cache_event = riscv_map_cache_event,
-	.cache_events = &riscv_cache_event_map,
-	.counter_width = 63,
-	.num_counters = RISCV_BASE_COUNTERS + 0,
-	.handle_irq = &riscv_base_pmu_handle_irq,
-
-	/* This means this PMU has no IRQ. */
-	.irq = -1,
-};
-
-static const struct of_device_id riscv_pmu_of_ids[] = {
-	{.compatible = "riscv,base-pmu",	.data = &riscv_base_pmu},
-	{ /* sentinel value */ }
-};
-
-static int __init init_hw_perf_events(void)
-{
-	struct device_node *node = of_find_node_by_type(NULL, "pmu");
-	const struct of_device_id *of_id;
-
-	riscv_pmu = &riscv_base_pmu;
-
-	if (node) {
-		of_id = of_match_node(riscv_pmu_of_ids, node);
-
-		if (of_id)
-			riscv_pmu = of_id->data;
-		of_node_put(node);
-	}
-
-	perf_pmu_register(riscv_pmu->pmu, "cpu", PERF_TYPE_RAW);
-	return 0;
-}
-arch_initcall(init_hw_perf_events);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
