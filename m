Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70317CDE015
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zqmZVMUFzujYBKr6ld29Grf7I4op/gjOjZYad2otOEo=; b=a47QoKTClsiKJO
	Oor1tiZkWmPJy5kYEJmysbEST+tSb+jr+zyFkzi5EQDxeGyIwDY+bUJ2mnrXcYbdIwV56O1m4MEGD
	Jn80ZL+pCqyNZYsLQbGxDKaOyuxdqexWplTGEvKKEkqZXN0F4dt6ddyvecKxcYm+7EXrdsZM4YZWz
	EqaQN4MxgyzsjnhpA3dyQ6J8/QfUEUSBCUuOi72yaNbrz34myi6u9hCaJNiIVsa6WZ7J18uyRj5xK
	Vz3J5ioDcaUMtClhaQgxoY8i/siLfxVzxXjshiTAgrkEfjZYNdKKk253sjwIF8e7b2x1gL47pmclK
	pSBr40vddYP6E0VMgNIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqeU-00000008m3m-1yY5;
	Thu, 26 Sep 2024 15:43:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqeQ-00000008m2h-1a0J
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 15:43:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727365406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vZ/HKgnyH2HmTsoqiD2jM9GAYr4moWSHAgynrG+F/AQ=;
	b=vHtxVj2yfehMPNOP5iiUaLPrtxiKreiaFchKIbhXVouWyk4l770aQfemwxS44NUbPTOjyK
	Y2k1BGYQwyOTU/h2Xm5depaeU0IjAnkyL7DSCT8RLIUyAudKqhVO2g4dZ+aE3BkNo8Hmur
	ZDHO715TXOYflWj8dc6D/anlY7NQiWCR5G5uP7YzO/EkTC97bF5QiW0I9UU2swsaK8U0rp
	zKxBZT8IsewPNvb7bW8tY8wdODTwfUWNde4b6Bmkhw+PoBCEazYr2ZzaIRYF5XGBVGbTgX
	LUhKvTUHoI5RHzhGqvhAntUXf2jpT3ihh6SNbdco/K0fBjm9NlVxije3ZRqNtw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727365406;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vZ/HKgnyH2HmTsoqiD2jM9GAYr4moWSHAgynrG+F/AQ=;
	b=QGp6NLnHhrwLB/1PcErLd2XM1lSocD1JGiXGFmlJtdoqe4XlvnwChgIDEBL+VZcU2WbZil
	jgoYPvSSG9jFxKAQ==
To: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/sifive-plic: Unmask interrupt in plic_irq_enable()
Date: Thu, 26 Sep 2024 17:43:15 +0200
Message-Id: <20240926154315.1244200-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_084330_586986_F518061C 
X-CRM114-Status: GOOD (  10.28  )
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

It is possible that an interrupt is disabled and masked at the same time.
When the interrupt is enabled again by enable_irq(), only plic_irq_enable()
is called, not plic_irq_unmask(). The interrupt remains masked and never
raises.

An example where interrupt is both disabled and masked is when
handle_fasteoi_irq() is the handler, and IRQS_ONESHOT is set. The interrupt
handler:
  1. Mask the interrupt
  2. Handle the interrupt
  3. Check if interrupt is still enabled, and unmask it (see
     cond_unmask_eoi_irq())

If another task disables the interrupt in the middle of the above steps,
the interrupt will not get unmasked, and will remain masked when it is
enabled in the future.

The problem is occasionally observed when PREEMPT_RT is enabled, because
PREEMPT_RT add the IRQS_ONESHOT flag. But PREEMPT_RT only makes the
problem more likely to appear, the bug has been around since
commit a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask
operations").

Fix it by unmasking interrupt in plic_irq_enable().

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations").
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 drivers/irqchip/irq-sifive-plic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f6ef5c495bd..0efbf14ec9fa 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -128,6 +128,9 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 
 static void plic_irq_enable(struct irq_data *d)
 {
+	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
+
+	writel(1, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
 	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
 }
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
