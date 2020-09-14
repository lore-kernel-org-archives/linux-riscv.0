Return-Path: <SRS0=Swg1=CX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64138C43461
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 17:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04816206B7
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2020 17:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JUBPDXaA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Nw4GVcwc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04816206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rgiV6ehAux4hGfmUkT5bhvK/SHO+ldwjRaA/Gkq5vTc=; b=JUBPDXaA1Eq8onG2Ptpg77B4OV
	afx7yMOzqDnkttUx4jzoaIakI6D1NttkbjDPBSR77YTePCXO4XPBP/r3Wts2cSXFVoyk8l/fROOv/
	R/aZ7S0qHtMbjribGCA6Lxfd6C/ooMF4X8D9pB4fq9M5UBTPYxJCWvDUiy6DMAHpTWkhWP3e1IHv3
	SZ3puIy3pH+n4iVG4PNn9yy8VIVMyIuXxK1gpBkzsVGKP0SkPwkjUxKF91zwdPr8qJuUvCnyX52wd
	nZDOqmUR209rrY3qiv0pOJXqic1ukqpv5LrzVXi9LRR/p1ERlgYCMFgaMADnZh3BcWbOQCg3ucxLZ
	i2erpKIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHs5d-0007uj-Id; Mon, 14 Sep 2020 17:16:29 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHs5a-0007pG-NC
 for linux-riscv@lists.infradead.org; Mon, 14 Sep 2020 17:16:27 +0000
Received: by mail-pg1-x542.google.com with SMTP id t14so290814pgl.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Sep 2020 10:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=CkTToupSDRWE1TpRjqkS0nXqvp+Qolt4t7RpmMimzBI=;
 b=Nw4GVcwcPEQH+QV+qjVvMJVKDzbFJThg5Qw0ecOewlJgCEp5IhZ451LgRov3qNNZED
 Xu72G5smzM0pnnHwdmnGu/1I86erDLIMM3p7Hbk9PkIG9oa3BUqLKxt6lUrcHDO7vu68
 HSurdtROca6X0o0TBjIbdduH4KmaEo8tBXA+h+lWr1dMXAwJOGmIniZGxEbQb2n3Alp6
 jVkE/c596W8rsWnq/NV/Udh7CPl/qCsSuDIGln40hflLvRZ2ZAk/+VGqdiPzbsRBph7J
 /PFiPY97EtIg2uTE3IytS9vIoqvqagL+X/E4yyQ+EQho3HxJYDhrJ2OWNJc8+i3yRGqs
 tDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=CkTToupSDRWE1TpRjqkS0nXqvp+Qolt4t7RpmMimzBI=;
 b=X3JhZzauJ1vBhzJtwLu9cmnTL2/KKHL8qtQ3M61c8SgbpReevnBoy57MGnasadx5A/
 Ro+C0gdDXB2ALdLhXMv/RZryzJoZlwaoT5Aw0tzRA6FmiXaLJ0C47zC9DFbDEwxWNckz
 Dlan93mgBsaz+LTpPAqZkRYywO7Tky+9En/a1TIj6csXWKOytkDFnGe/EtFBpgbtX9yL
 vnfjA8As1Rsoi9Vzx1+s5ItanLGXA0iXHmkbOskYqtfWxkL06a13eKdL/zi/X65MEzxg
 QGMseyi4yv2XO4NniWMI3UE+mpXBCQdDZ7S2XklnnDRiQA0OHExjN57BK6Ni14SnSxAs
 YZqw==
X-Gm-Message-State: AOAM532s8pzMzSgEf8fc/ud6CoUh8rokX+VPHVH/wspqLqiACx6eIFO1
 +FtrjB94boB00FmJcTKucCzmKw==
X-Google-Smtp-Source: ABdhPJybIdL8jY4y0lNc8RxFybuZu/E83tgPiAvJM4BFYYjk4KSaEGQ7d3XazI4VpaZeMOA6jUelFg==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr13787279pfr.96.1600103778086; 
 Mon, 14 Sep 2020 10:16:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o1sm10656079pfg.83.2020.09.14.10.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 10:16:17 -0700 (PDT)
Subject: [PATCH] RISC-V: Resurrect the MMIO timer implementation for M-mode
 systems
Date: Mon, 14 Sep 2020 09:56:30 -0700
Message-Id: <20200914165628.445087-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_131626_785754_2B60D598 
X-CRM114-Status: GOOD (  23.21  )
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
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <Anup.Patel@wdc.com>,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The K210 doesn't implement rdtime in M-mode, and since that's where Linux runs
in the NOMMU systems that means we can't use rdtime.  The K210 is the only
system that anyone is currently running NOMMU or M-mode on, so here we're just
inlining the timer read directly.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
I don't actually have a K210 so I haven't tested this.  If nobody else has the
time to I'll put together a QEMU that doesn't support rdtime in M-mode, but
I've yet to mess around with the !MMU stuff so that might take a little while.
This certainly doesn't seem worse than what's there right now, though, as
rdtime isn't valid in M-mode on the K210 (our only M-mode platform).
---
 arch/riscv/include/asm/clint.h    | 26 ++++++++++++++++++++++++++
 arch/riscv/include/asm/timex.h    | 27 +++++++++++++++++++++++++++
 drivers/clocksource/timer-clint.c | 17 +++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 arch/riscv/include/asm/clint.h

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
2.28.0.618.gf4bc123cb7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
