Return-Path: <SRS0=Nd4X=PE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A95C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:18:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8168A214AE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Dec 2018 11:18:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeJG2M4N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="n/d3YUhZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8168A214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vMt/R8qiaQKYuN+klNJZbjttu1qEiqj0nNRVIuk23Gg=; b=MeJG2M4NMoakJF14aoYZzB3Dws
	y+7lGkAN16+udkaySuum8R/TZw6cpcpFktemgy1HawUNMKZU8JK2V4Qj36Oy7QDAhFZoS5cEXmnvn
	jnSFhnLyPC+8bHhiT5vyGETK3GRO4U7QeTT0rZx1LZ+qAqRfyJzRVsqiLwwIms07/WGBcxyzK5PEK
	jPHD52VGvPI856EK+GP8bj6soKUERxBaXZNH4OTPVSnd7nK6wDyuwib5rUK31Swvta2f7/baT/dxx
	2f21m9ockcNHJQ8v/yYgxbrJ6gjSnV7VN7uEpij+6aD9IBYeNpTCmM498H0X34pD7lAFuDRQdH77O
	3CsXvAVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gcTgk-0001ok-BV; Thu, 27 Dec 2018 11:18:54 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gcTgh-0001lR-HP
 for linux-riscv@lists.infradead.org; Thu, 27 Dec 2018 11:18:52 +0000
Received: by mail-pg1-x541.google.com with SMTP id g189so8694859pgc.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Dec 2018 03:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=EWRMoEC/A0hBjLIZuy6KvNFGbEVqYyO/63HQJNeKmb0=;
 b=n/d3YUhZCxj7eZFrEZNSG181qtPIVM9yoXtg+iIHfEprSrzlTFU+Y6dnLD0tX8K3+y
 j0v3hhLU2YBgUsK5Olw43hiIO77qcYRuqxCkzNB5OYOwgl2GRrrejFLZipAw0VMV+PMI
 dDAeuDEDSaAoESR1bIByMBMGlqbD3wJiTJXo0qXNyZVN0vxm6Pt788t1Y0y7jy0/HW+6
 SExQXa6/7UgKU84z33sTDpfFd4hAWM7+X7Gz1au4UntP4SQRr9XCG4N3DvVUR9/SQiDr
 2WvJ2c4OZm/6LV2TGXuzMMecfKJbYCjNxWnamCkm9grVjbAKZmk9LpASFIkkZVBDx2mF
 /E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=EWRMoEC/A0hBjLIZuy6KvNFGbEVqYyO/63HQJNeKmb0=;
 b=MSDBRkayi7dkDzUx6C1NwG0fk0UFs4aPDM27oUvYDQhqZ7EJKHqsEQhsGx2UfkdzcS
 MwI612AwUDAHyjZrEJ9g1Wbk3uxtnCMi8yQcyVktZZ7IqzE8hLElOJXuXspzWTfEW/s7
 0Cs4PD1hsKN369Hm+6cHUkVWB/M5lfA3xZWMgd+9+VvTEeIJlI0Nx0dnFY3gbDSSsxvh
 VPk6lpgSWwigJob4ETynSlCxoK0rKvzGk7ycS0kQwzShQs2jlYjHtCVMpn/cNuffR+Z4
 QFKiBj5MfS+uYZLur8wY4y7rCod+/Zx42Tm1bp+Avf1axgUs9hatEiQnvldWNrHfmbrg
 kZlQ==
X-Gm-Message-State: AA+aEWbjE8NYnAxcznImTpPGFS4fhNeBX/FpQc2rau/XQFKMFA/RxrKn
 hdg1GT2WXXKsFONhhuDYiPuLpA==
X-Google-Smtp-Source: AFSGD/UYGcQ9bKMI7TC+KNrvXccHJMd+rk2BtjFCExFwLt2vxNaMFzuyV6LID0v9fU34hzRsRBm3Ew==
X-Received: by 2002:a62:29c3:: with SMTP id
 p186mr24144025pfp.117.1545909520438; 
 Thu, 27 Dec 2018 03:18:40 -0800 (PST)
Received: from localhost.localdomain ([106.51.18.57])
 by smtp.gmail.com with ESMTPSA id u137sm66830105pfc.140.2018.12.27.03.18.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Dec 2018 03:18:39 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v4 1/5] irqchip: sifive-plic: Pre-compute context hart base
 and enable base
Date: Thu, 27 Dec 2018 16:48:17 +0530
Message-Id: <20181227111821.80908-2-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181227111821.80908-1-anup@brainfault.org>
References: <20181227111821.80908-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181227_031851_578073_08B273A1 
X-CRM114-Status: GOOD (  14.58  )
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
