Return-Path: <SRS0=zSrB=C4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B71C43463
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 20:22:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A761021D42
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2020 20:22:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vsss0xFW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="t9QdoPJG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A761021D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wFehNkSEFgWSQq+HWEGBDs8yGEYYcS+NZnksSFrk2E8=; b=vsss0xFWn+51z2xup9kwLbeTGa
	OEpVo15YHAzMvGe/OXPntw8/89oRQCtdC7Ll/0xH1h6iDuMNFIP7c3jbMAl7xDMP1VRhvlLXj2aps
	kGt0d+0oBY2aB7oTLiGGZhFAPBJorSDzt8yYNoYI7ts7RtcJu+IZvV5BjKcIxQeVVeUtLTXV9UW0M
	z7pl+Ed18rKBSePS4tI78KrwDQ0c4C4thE2pgstauAcowZL0+cFdZXOTDknvkIRm+CjnyQS43vwxM
	sU9syzgI1Rt5OTwipTXNYN6eff5QTuFm5wOJP7EdS/YZHP6hrqVw9miOdHMxevLgFFIxKdfDVaNEr
	rCB1Gcsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJjMn-0006GB-75; Sat, 19 Sep 2020 20:21:53 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJjMk-0006Fq-No
 for linux-riscv@lists.infradead.org; Sat, 19 Sep 2020 20:21:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id kk9so4831342pjb.2
 for <linux-riscv@lists.infradead.org>; Sat, 19 Sep 2020 13:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=jUApdPvpJCDHqyZV5wH+cCcy4W2BfH3WAS1oTl4RxL8=;
 b=t9QdoPJGVqCXCp0Zf5c4fTnZpGl/iAkTsLOWsMjxYMAfDd32yaU+ujDeYTQyJRGF4z
 J70SNQx5f3x0s8oZOEXgLtMGZgca+oyNrSQnDUSVsAPU2hy9hFXeAa7vyW5zcyYW4gmc
 IUDN54pHgqBVsJD3QHCV716S3hBnZYVbuHQTjKJ1uULVqBkJu9fzl3h04wcQg4OqobWl
 KrkW/mreOlnoxTSSuDUPYW4jt+kY2oXN9T14XXRKfL9ctpC7DidELTKgSeoWno5MdhZQ
 Yy8juJZL4GchFOlOArEs2Qa3G7BXQsEBlM/dFux6UeZBVyuKJSSUjhIno00fGwpWtnmD
 ptlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=jUApdPvpJCDHqyZV5wH+cCcy4W2BfH3WAS1oTl4RxL8=;
 b=WmOXVu/6qTpb36UQ2INioYnTqs/vPHi+9475Eb2n61uluebTHIVOkJ/CIHfvVXK7fG
 yslCi6xBeis2zy0lwPFuTDgkqc78lBrFJrn45Q4sHrrlqjwMAhmgL3L+/5S3VjASUeCC
 s0VNJGLdC6yhpz0ZGq12BLjgUCc+5SVD+TZPiY6XE6Rl+1LlhcWh8TWZPUZbu2TQBAji
 Re0svn0ChoU46EuImXuBxVjTXx8oq90Dm1PZTSe2Bj3R+srtsabVWmdwYQ9cQltDyYMk
 gWQvUa1wrgOrlftRipjQQnYntBXS8b0pI09eVeH4xo1l5UEL83b9pH8JLIJNiYtoRywc
 oCpQ==
X-Gm-Message-State: AOAM533U18GxLM0iMIlDsRn0he7a1Co6Xm9/1O2UtnfegWqsp1QF3/Oe
 FzS1UxepZs/HKzBeBt3ZfwoHaw==
X-Google-Smtp-Source: ABdhPJzkqd2nQjhyI0ACjLZ914arsslWJ2Ou3/RJQi0Oox/ysMtjtRU3kNYsTgpBciwoai/rXYXJyQ==
X-Received: by 2002:a17:90a:b302:: with SMTP id
 d2mr17800006pjr.150.1600546907588; 
 Sat, 19 Sep 2020 13:21:47 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q190sm7726228pfc.176.2020.09.19.13.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 13:21:46 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Resurrect the MMIO timer implementation for M-mode
 systems
Date: Sat, 19 Sep 2020 13:21:41 -0700
Message-Id: <20200919202141.2072628-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_162150_819405_E4F18FDA 
X-CRM114-Status: GOOD (  23.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
in the NOMMU systems that means we can't use rdtime.  The K210 is the only
system that anyone is currently running NOMMU or M-mode on, so here we're just
inlining the timer read directly.

This also adds the CLINT driver as an !MMU dependency, as it's currently the
only timer driver availiable for these systems and without it we get a build
failure for some configurations.

Tested-by: Damien Le Moal <damien.lemoal@wdc.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig                |  1 +
 arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
 arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
 drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 arch/riscv/include/asm/clint.h

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index df18372861d8..7766e1289468 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -32,6 +32,7 @@ config RISCV
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select CLONE_BACKWARDS
+	select CLINT_TIMER if !MMU
 	select COMMON_CLK
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
new file mode 100644
index 000000000000..0789fd37b40a
--- /dev/null
+++ b/arch/riscv/include/asm/clint.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 Google, Inc
+ */
+
+#ifndef _ASM_RISCV_CLINT_H
+#define _ASM_RISCV_CLINT_H
+
+#include <linux/types.h>
+#include <asm/mmio.h>
+
+#ifdef CONFIG_RISCV_M_MODE
+/*
+ * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
+ * any overhead when accessing the MMIO timer.
+ *
+ * The ISA defines mtime as a 64-bit memory-mapped register that increments at
+ * a constant frequency, but it doesn't define some other constraints we depend
+ * on (most notably ordering constraints, but also some simpler stuff like the
+ * memory layout).  Thus, this is called "clint_time_val" instead of something
+ * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
+ */
+extern u64 __iomem *clint_time_val;
+#endif
+
+#endif
diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a3fb85d505d4..7f659dda0032 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -10,6 +10,31 @@
 
 typedef unsigned long cycles_t;
 
+#ifdef CONFIG_RISCV_M_MODE
+
+#include <asm/clint.h>
+
+#ifdef CONFIG_64BIT
+static inline cycles_t get_cycles(void)
+{
+	return readq_relaxed(clint_time_val);
+}
+#else /* !CONFIG_64BIT */
+static inline u32 get_cycles(void)
+{
+	return readl_relaxed(((u32 *)clint_time_val));
+}
+#define get_cycles get_cycles
+
+static inline u32 get_cycles_hi(void)
+{
+	return readl_relaxed(((u32 *)clint_time_val) + 1);
+}
+#define get_cycles_hi get_cycles_hi
+#endif /* CONFIG_64BIT */
+
+#else /* CONFIG_RISCV_M_MODE */
+
 static inline cycles_t get_cycles(void)
 {
 	return csr_read(CSR_TIME);
@@ -41,6 +66,8 @@ static inline u64 get_cycles64(void)
 }
 #endif /* CONFIG_64BIT */
 
+#endif /* !CONFIG_RISCV_M_MODE */
+
 #define ARCH_HAS_READ_CURRENT_TIMER
 static inline int read_current_timer(unsigned long *timer_val)
 {
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 8eeafa82c03d..d17367dee02c 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -19,6 +19,11 @@
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/smp.h>
+#include <linux/timex.h>
+
+#ifndef CONFIG_RISCV_M_MODE
+#include <asm/clint.h>
+#endif
 
 #define CLINT_IPI_OFF		0
 #define CLINT_TIMER_CMP_OFF	0x4000
@@ -31,6 +36,10 @@ static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
+#ifdef CONFIG_RISCV_M_MODE
+u64 __iomem *clint_time_val;
+#endif
+
 static void clint_send_ipi(const struct cpumask *target)
 {
 	unsigned int cpu;
@@ -184,6 +193,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
 	clint_timer_freq = riscv_timebase;
 
+#ifdef CONFIG_RISCV_M_MODE
+	/*
+	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
+	 * will die in favor of something cleaner.
+	 */
+	clint_time_val = clint_timer_val;
+#endif
+
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
 
 	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
