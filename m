Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402BC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52fINBEHtdilr3pihHRmcw6vB1Tp9a+7/FU2XFFQOIU=; b=4HWNydXkjaCmiC
	8I4slpE/i3jV9BVabQlIlyKZEP0zzn+dbhR63MBxUrJH0cMEpGWFkNRo6Ak7wQxoaFL8CBNc7DPm3
	NP6EnOl/iBuoWdoNSHzSYHlmUeZW/wsEBGdxtCU/fnR/8WYc3qXjLrc8wWQPL9zmH75N9DjQY6upC
	hD1dz5duozzZJ+eZ606BEYQ0c7L3nHVahTbT2fM9CIyyT8vrKEZfkS7RuwRZbl1MbNK7VngDyBSMN
	j5aIBpesHHjRBflFT2+Le5tW3ZmJUH4PQS4Urdd8Wa1GZm1Oix79LJcD9kHsM5xTvR0ZGK11dScsB
	DU69CQSJka4BrilTtGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rona1-00000000sng-0aYg;
	Mon, 25 Mar 2024 16:53:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZx-00000000skn-2wdD
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72EA8CE1B9C;
	Mon, 25 Mar 2024 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E98C433C7;
	Mon, 25 Mar 2024 16:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385622;
	bh=NrGlxqgZh3B1ZksAfxarZEX2wTrdfyxjcZNnuUN0fWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sbe2U8cHcKbsb3NjqeI+VDc1Bq5b3EylZM6uqyiPyKXZ3EuJuhgYjfp6Tf1WyBsNa
	 dP4VEkfxtxGFCZqC8jHHbhJQ/1+MxsNMSLxTMGQ1HsQb2YvGSFCKTgWuWwUmUHPb2V
	 /ByEg7Vas3QPjTBvMMPzmQpyoluP9C3KnGMwgCeOn/2Cod4L7saQFCa/FI5JJfiQXx
	 DLeSGwQKaumx1Aqo+ho0dZjVC18qWDt4LzXuCzrPLOAgviB8jMQrdK5Do/O+2yl8Jr
	 MCo+Dc69iwxnjqQiwCG5+Ftiebcub+WIp6whR7p2BMc9kYBMSFAcemQ91LgPNgZ/cJ
	 RikMAyfdIif3g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] clocksource/drivers/timer-clint: Remove clint_time_val
Date: Tue, 26 Mar 2024 00:40:19 +0800
Message-ID: <20240325164021.3229-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325164021.3229-1-jszhang@kernel.org>
References: <20240325164021.3229-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095346_177798_B92DE85E 
X-CRM114-Status: GOOD (  13.78  )
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

The usage have been removed, so it's time to remove clint_time_val.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/clint.h    | 26 --------------------------
 drivers/clocksource/timer-clint.c | 17 -----------------
 2 files changed, 43 deletions(-)
 delete mode 100644 arch/riscv/include/asm/clint.h

diff --git a/arch/riscv/include/asm/clint.h b/arch/riscv/include/asm/clint.h
deleted file mode 100644
index 0789fd37b40a..000000000000
--- a/arch/riscv/include/asm/clint.h
+++ /dev/null
@@ -1,26 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2020 Google, Inc
- */
-
-#ifndef _ASM_RISCV_CLINT_H
-#define _ASM_RISCV_CLINT_H
-
-#include <linux/types.h>
-#include <asm/mmio.h>
-
-#ifdef CONFIG_RISCV_M_MODE
-/*
- * This lives in the CLINT driver, but is accessed directly by timex.h to avoid
- * any overhead when accessing the MMIO timer.
- *
- * The ISA defines mtime as a 64-bit memory-mapped register that increments at
- * a constant frequency, but it doesn't define some other constraints we depend
- * on (most notably ordering constraints, but also some simpler stuff like the
- * memory layout).  Thus, this is called "clint_time_val" instead of something
- * like "riscv_mtime", to signify that these non-ISA assumptions must hold.
- */
-extern u64 __iomem *clint_time_val;
-#endif
-
-#endif
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 09fd292eb83d..56acaa93b6c3 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -24,10 +24,6 @@
 #include <linux/smp.h>
 #include <linux/timex.h>
 
-#ifndef CONFIG_RISCV_M_MODE
-#include <asm/clint.h>
-#endif
-
 #define CLINT_IPI_OFF		0
 #define CLINT_TIMER_CMP_OFF	0x4000
 #define CLINT_TIMER_VAL_OFF	0xbff8
@@ -40,11 +36,6 @@ static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
-#ifdef CONFIG_RISCV_M_MODE
-u64 __iomem *clint_time_val;
-EXPORT_SYMBOL(clint_time_val);
-#endif
-
 #ifdef CONFIG_SMP
 static void clint_send_ipi(unsigned int cpu)
 {
@@ -217,14 +208,6 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
 	clint_timer_freq = riscv_timebase;
 
-#ifdef CONFIG_RISCV_M_MODE
-	/*
-	 * Yes, that's an odd naming scheme.  time_val is public, but hopefully
-	 * will die in favor of something cleaner.
-	 */
-	clint_time_val = clint_timer_val;
-#endif
-
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
 
 	rc = clocksource_register_hz(&clint_clocksource, clint_timer_freq);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
