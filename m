Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82F2C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ffvIgW5l8wqw7cnd7DnoXVXgkFVKK9OKY5RyOpDeZRI=; b=Q+QmM/2HycX98m
	lJGy0IErbyaK0eGbkQyA2rWx+ORqCOof/ZndaVrTdufpLNv8cxfvzjnyYOKdznAB/Ed2Oddzb0GBz
	hT9vAGonWpJxytN5JHIhfH/nS3aMHohqgXdxGNG4Bv/LtP14bHDLffTorWRQwld6mv+oJ5rcyi45s
	r9WVA7RkU4s9mDbvr1TVK5kHttOL8G2gVTYQD5peSszEcG6S6/H+NQ/wfbk8wRO6vfU2KHz9ji75u
	QG1ASv/t83n8++qKSSXhxODMs6QWQz1nrmyqBoxIBtc4qFKriHzaKl+AycNABpB/FV9XNWBGDmANq
	pjG4jSa+QE4EMCj84Dqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rona4-00000000sq5-36c1;
	Mon, 25 Mar 2024 16:53:52 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZz-00000000slW-1QIR
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A457ACE1BAA;
	Mon, 25 Mar 2024 16:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 285A8C433F1;
	Mon, 25 Mar 2024 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385624;
	bh=JxFNqk1udzBJf0wb9hzCshesMQ7wj/gJiBIIdlgKlnQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BBUCPAz08ws6G27uwdiYhJaiZaAMK7cNJLpZ3myQHlDdWdUAFQob1dxDd7GbxJDXC
	 k6naSdjnDeynjjzTHXDxmX/sg5j/MpwZUwme4C+kkQdZb05BeggwrFCrA3cMQRhTye
	 V6FcJfKXPjEN46BvjPOqWyJG6J+gnBNpyDXxIU0pmN2bmMy7or9UKvEwU4aGYV76+H
	 UI88J060emfq8sn9e7+H8iy+rsYI4/JaSAqgtL3YmWp2xs3a6phKS5b7cZBNlZDRE8
	 fd/IKf4ULYTZzOIzybOI4+UBb8g+ZSZ4DGIhi4fhhJMfwgxtk+ROyxU0+2qJ+y/bLe
	 XZi9O/tukUQrg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] clocksource/drivers/timer-clint: Use get_cycles()
Date: Tue, 26 Mar 2024 00:40:20 +0800
Message-ID: <20240325164021.3229-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240325164021.3229-1-jszhang@kernel.org>
References: <20240325164021.3229-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095347_618322_49D106F8 
X-CRM114-Status: GOOD (  11.48  )
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

Per riscv privileged spec, "The time CSR is a read-only shadow of the
memory-mapped mtime register", "On RV32I the timeh CSR is a read-only
shadow of the upper 32 bits of the memory-mapped mtime register, while
time shadows only the lower 32 bits of mtime.", so it's fine to use
time CSR to implement sched_clock and clint clockevent/clocksource.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/clocksource/timer-clint.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 56acaa93b6c3..4537c77e623c 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -32,7 +32,6 @@
 static u32 __iomem *clint_ipi_base;
 static unsigned int clint_ipi_irq;
 static u64 __iomem *clint_timer_cmp;
-static u64 __iomem *clint_timer_val;
 static unsigned long clint_timer_freq;
 static unsigned int clint_timer_irq;
 
@@ -60,31 +59,10 @@ static void clint_ipi_interrupt(struct irq_desc *desc)
 }
 #endif
 
-#ifdef CONFIG_64BIT
-#define clint_get_cycles()	readq_relaxed(clint_timer_val)
-#else
-#define clint_get_cycles()	readl_relaxed(clint_timer_val)
-#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
-#endif
-
-#ifdef CONFIG_64BIT
 static u64 notrace clint_get_cycles64(void)
 {
-	return clint_get_cycles();
-}
-#else /* CONFIG_64BIT */
-static u64 notrace clint_get_cycles64(void)
-{
-	u32 hi, lo;
-
-	do {
-		hi = clint_get_cycles_hi();
-		lo = clint_get_cycles();
-	} while (hi != clint_get_cycles_hi());
-
-	return ((u64)hi << 32) | lo;
+	return get_cycles64();
 }
-#endif /* CONFIG_64BIT */
 
 static u64 clint_rdtime(struct clocksource *cs)
 {
@@ -205,7 +183,6 @@ static int __init clint_timer_init_dt(struct device_node *np)
 
 	clint_ipi_base = base + CLINT_IPI_OFF;
 	clint_timer_cmp = base + CLINT_TIMER_CMP_OFF;
-	clint_timer_val = base + CLINT_TIMER_VAL_OFF;
 	clint_timer_freq = riscv_timebase;
 
 	pr_info("%pOFP: timer running at %ld Hz\n", np, clint_timer_freq);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
