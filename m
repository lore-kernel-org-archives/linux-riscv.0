Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94ADDC4151A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D37214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 12:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TxOfrzSQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="EdXk3o+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D37214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j7bqfwD8zsANAYVSRFFswVkBZKK+sFJ4tNpzbjDVXHo=; b=TxOfrzSQmTopURkSXEiO4Z9htA
	R93jkQgLlfURfBXGKRh9MlEGruvDCfNHKaFCel1pvC6m+mxISO8d8TZRYjSVWOyrzqQno3HKJR7F6
	5JfsVXuAPY96pkT60dM9WCdDP29kcbjHJ3wtfp095F3cD/es5R2lm2D+35NviFhkLnmsIlA6Znoi5
	bRh9QFpT+i8lIZgbwXcvBom2cM0u8mnTtyI2m/qoRU2G1J30KpONM1UXi0ksg9VKnt8WaEzZ5C+hn
	aNvEe8bUrdJd+ehtnqwO1rP10mVNbCUbzZnbbP+LJ4kDl0Y33bN4K+7LmQBfNOMb3vF2W/lRvrOgb
	fLiQdphw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtXYk-0007UT-89; Tue, 12 Feb 2019 12:53:10 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtXYf-0007So-TJ
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 12:53:08 +0000
Received: by mail-pl1-x642.google.com with SMTP id p8so1274946plo.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O2ZupOs/WFdJwiPbINO+V0JVWJpBFSTcpyV82FP5qBM=;
 b=EdXk3o+6gdqZKzksNpcQPvKazI9T4E+YuALjwlEN4jqTM3nsgzi0G+ONOdProNnzGi
 MT+RIUATXqc4I7sVFHico//NN3pteF0wLMN90CiNOjMrm1AGeVmk1xNe8/7JOtb9AfFw
 y1T+//eYC349DP5llgisAvJZd0eCpJ3Pr6NQMpTk6856Oh4lsfgIvyqxNhFdvbvufPSA
 1MV1MEnrvMFRfCKqOXuGoImmWkzasQxGSePY9a2OXjNzpBo0XueN6Y2Ihppzom+SDLaN
 UWcPBY8MCmof+Ocj1UhznO2it7iw0Vmt9NBd8Dfr2O1B97W/HB3khVBs1GwhAUhxpxYn
 MTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O2ZupOs/WFdJwiPbINO+V0JVWJpBFSTcpyV82FP5qBM=;
 b=G71lMwWJc+o59Avvtv1JbbkbY/Y9RHQj2dwAgW7zfNpGwWoWSgzNYnUijcOaNUviIg
 GiNjUlQpy0n/rsWdaMYkW0GG92EuwJQpoSx/W1z4HuaFrYh3xtCAJ87cwj59ZOE+dFqA
 RMmdxj6tiHjWFJLEDke5ueKKdiBPNJS31KTcG8orQZlM7fQo0jcS7EniCYhhbLGWZW8o
 Sh89uYIQNgR1w8fSIEDCnrvo2xJwoa3130hQZbNmNDgtJdtgDxpWDipz/Zu/LEcZihxl
 PBDTOyjFlB53SQ7VkP73L3NqzJOW4kdE2NwJZ6QBOvj0kTz7jNZ6JOWGFGaz7vByQErq
 3/Zw==
X-Gm-Message-State: AHQUAubULVgKEoXKDfIe1PQNGpFIKb33ceTsksF9aehw0TSnKctoi8RU
 LAvDVhXWIOqviccIe5xkRpw7/Q==
X-Google-Smtp-Source: AHgI3IbGqT57HdMf9TSaf9uzNQL4Nsb2en1MF+Af7z4R0Du5m7S1+OaE5P2A5Axwy8ck9gG8OVEDpA==
X-Received: by 2002:a17:902:6a4:: with SMTP id 33mr3831492plh.99.1549975985360; 
 Tue, 12 Feb 2019 04:53:05 -0800 (PST)
Received: from localhost.localdomain ([49.207.48.205])
 by smtp.gmail.com with ESMTPSA id z67sm27894828pfd.188.2019.02.12.04.53.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Feb 2019 04:53:04 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v6 1/4] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
Date: Tue, 12 Feb 2019 18:22:43 +0530
Message-Id: <20190212125246.69239-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190212125246.69239-1-anup@brainfault.org>
References: <20190212125246.69239-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_045305_952060_F911D5D4 
X-CRM114-Status: GOOD (  14.41  )
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
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
