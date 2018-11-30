Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A963FC64EB4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B7C2082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nq83WOSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="pX7HPyIt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B7C2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vMt/R8qiaQKYuN+klNJZbjttu1qEiqj0nNRVIuk23Gg=; b=Nq83WOSYa5N50fltpq6FTKB4kS
	voLyyfjfppSbknjkzqk/w6+1GJmJU8aGoXMWHQ8vECRVBXmNBykTuTJs8KCYzw/ex9J8nestL1mfm
	wFAtXOoe7rNGywbnXvND9ErPg0gTGjPDy2+gctreu2E6uIUlnb/yKH3qDkhYa38t7lYuZxInquKns
	7j+Zk6B8aMSUCIvF0dawPSOv6k23gQudlpLBu99lrg4Mf2QLGjyvp2lQDWf49PfQBmccuov7wBb3b
	DduD1r0Tt3scvZWK3ivjnpJR7Zlu0sUba4KIW7YZyTkA2AIAi4S2JxbahWrY544W1/phvPCxB3wM4
	6c0hRI7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdkx-0003kI-Tc; Fri, 30 Nov 2018 08:02:36 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdkt-0003gR-Kc
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:33 +0000
Received: by mail-pg1-x542.google.com with SMTP id t13so2141246pgr.11
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EWRMoEC/A0hBjLIZuy6KvNFGbEVqYyO/63HQJNeKmb0=;
 b=pX7HPyItHcvL7I8CcRC8mkwocrohyKK3alsWU9f5QyEhzn++uVl2rDF8JQpfm9Po0F
 RvisQ3PFP1wqGQSwcjnV8tCuC3mKVA9uMu8uWXVQBOn21iGnQ8Allzn8AQe2lHbp/62e
 feBUxcOG3gAN7bZ4qWxb16X3INMEg+S+2RUADXLR6M6nN/F2ynYc72Uq72DIH7DDgyjv
 ASJvyiIuzTZElpns+FNBtnwsOtszMI5AXDpxEs+QfpA5Wb08QOwPde2AQiT+KF4dWlP3
 EcvsbREhGyd1RmsMANr3kyMngc7xJ+HG1y0kgCuBZCRzB9vfKKRVIg5KrgaCQhPfbI/d
 9MuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EWRMoEC/A0hBjLIZuy6KvNFGbEVqYyO/63HQJNeKmb0=;
 b=iloyY30kXcOnq+9PWrwDltdo1LOk2Q9COvLHLo9WeF9R7SujGIjvp46Je0vvTnQ48T
 Dh9YHfFDkPizR9xKV+wdgcCHlB2JvQVSyRY6weG4aDrOF2DpjfYRQiBGGORxbfA/OCaR
 iCRm4bUsNP6ItLal33YARwLlonSnGtqhYuq1c7UrPfB02YPBFnrhfRpthhP3AthPY3vq
 ggxwYePiN1a2q7mJPVGfIwBp3UU0KZzmEKMyzs6BrUdOBl9c3EypAdEJBDGG7aRwNMPa
 sHxYYQLuA1VlaaAjoxpq6r7TAWmyjahmZggpb7+TAaZclQQIkygcMvOjHgv5ZTzmcsXC
 VsVA==
X-Gm-Message-State: AA+aEWahP3Mtk7Q6ZDdjflNqxc32k87rJoZZVoDrl16C7Iq8jmLVchfM
 LiJuPhkclv8VEV7hAI/FbHaVdQ==
X-Google-Smtp-Source: AFSGD/Ub6+Gy2QjoIjZVBIMAwBrw3VEeQrDAKyz5rAgWqgdnxHYwwjZIs/V44sgepk1OjgJblvIjpw==
X-Received: by 2002:a62:2f06:: with SMTP id v6mr4722584pfv.216.1543564940610; 
 Fri, 30 Nov 2018 00:02:20 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:19 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 1/6] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
Date: Fri, 30 Nov 2018 13:32:02 +0530
Message-Id: <20181130080207.20505-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
References: <20181130080207.20505-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000231_700441_29BBE51C 
X-CRM114-Status: GOOD (  14.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup@brainfault.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch does following optimizations:
1. Pre-compute hart base for each context handler
2. Pre-compute enable base for each context handler
3. Have enable lock for each context handler instead
of global plic_toggle_lock

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 47 ++++++++++++++-----------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 357e9daf94ae..c23a293a2aae 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -59,37 +59,28 @@ static void __iomem *plic_regs;
 
 struct plic_handler {
 	bool			present;
-	int			ctxid;
+	void __iomem		*hart_base;
+	/*
+	 * Protect mask operations on the registers given that we can't
+	 * assume atomic memory operations work on them.
+	 */
+	raw_spinlock_t		enable_lock;
+	void __iomem		*enable_base;
 };
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void __iomem *plic_hart_offset(int ctxid)
-{
-	return plic_regs + CONTEXT_BASE + ctxid * CONTEXT_PER_HART;
-}
-
-static inline u32 __iomem *plic_enable_base(int ctxid)
-{
-	return plic_regs + ENABLE_BASE + ctxid * ENABLE_PER_HART;
-}
-
-/*
- * Protect mask operations on the registers given that we can't assume that
- * atomic memory operations work on them.
- */
-static DEFINE_RAW_SPINLOCK(plic_toggle_lock);
-
-static inline void plic_toggle(int ctxid, int hwirq, int enable)
+static inline void plic_toggle(struct plic_handler *handler,
+				int hwirq, int enable)
 {
-	u32 __iomem *reg = plic_enable_base(ctxid) + (hwirq / 32);
+	u32 __iomem *reg = handler->enable_base + (hwirq / 32) * sizeof(u32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
 
-	raw_spin_lock(&plic_toggle_lock);
+	raw_spin_lock(&handler->enable_lock);
 	if (enable)
 		writel(readl(reg) | hwirq_mask, reg);
 	else
 		writel(readl(reg) & ~hwirq_mask, reg);
-	raw_spin_unlock(&plic_toggle_lock);
+	raw_spin_unlock(&handler->enable_lock);
 }
 
 static inline void plic_irq_toggle(struct irq_data *d, int enable)
@@ -101,7 +92,7 @@ static inline void plic_irq_toggle(struct irq_data *d, int enable)
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
 		if (handler->present)
-			plic_toggle(handler->ctxid, d->hwirq, enable);
+			plic_toggle(handler, d->hwirq, enable);
 	}
 }
 
@@ -150,7 +141,7 @@ static struct irq_domain *plic_irqdomain;
 static void plic_handle_irq(struct pt_regs *regs)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-	void __iomem *claim = plic_hart_offset(handler->ctxid) + CONTEXT_CLAIM;
+	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
 	irq_hw_number_t hwirq;
 
 	WARN_ON_ONCE(!handler->present);
@@ -239,12 +230,16 @@ static int __init plic_init(struct device_node *node,
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
-		handler->ctxid = i;
+		handler->hart_base =
+			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+		raw_spin_lock_init(&handler->enable_lock);
+		handler->enable_base =
+			plic_regs + ENABLE_BASE + i * ENABLE_PER_HART;
 
 		/* priority must be > threshold to trigger an interrupt */
-		writel(0, plic_hart_offset(i) + CONTEXT_THRESHOLD);
+		writel(0, handler->hart_base + CONTEXT_THRESHOLD);
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
-			plic_toggle(i, hwirq, 0);
+			plic_toggle(handler, hwirq, 0);
 		nr_mapped++;
 	}
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
