Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CFCF856D
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Oct 2024 08:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MD9WKw1ncIHShRy1mEDyKWCWDU7/eacPPjHc4XGEP54=; b=iJU1RYb4IshLv2
	UMmnzdVAGdwqdUaB3KvELCd5eFKKmCgrwaQZz32oKSt24BKzTbsEPfn6R9Hn8pMsFZyHOLAzKTqqw
	mROdRGnUYVG7wDDdARwlQwivUqYpEnWbMKWdVoEsr5unReQYm7vBxRJxc4xm0ipX958VV1SvvQLGd
	np3dUmNkJs4IwnR0rnPhOPSWm9bw6XeKqb21gprotn1bctuhqGfwUNg7xgZGpnGECj4m4ViBjsaGt
	9cwGdzu28IS/bvvrjm+QXzMNbUJzWVpK2gRlp9Re6DG+bDl1DtpCt3FoA2qr1ptuMJFv7scHecYOa
	MX7XNYN8Iqp4ltBkENgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swHPX-00000008bKH-0dnF;
	Thu, 03 Oct 2024 08:42:11 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swHPR-00000008bJB-1ka8
	for linux-riscv@lists.infradead.org;
	Thu, 03 Oct 2024 08:42:10 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727944921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rwv7c4XBUYlK7OuEf5OGodB7wdW8JkOOx3+ovXT0/yA=;
	b=gDFM3aPcSHzQk9Nq0Ac6UZIj6UneTF9kc+1+7PtO4KMg8BQSlGWo/9wbgojQLOUJkmxpbD
	CPlH083bA4S9kWahpx8Ira1MW9uUG6x/4cq3BZ/PBxEGgRV28kCZTK9wrDe1A9gm8F5Pon
	wWKRpvNm4XesfzMAuTr5+D5AQTsY9vbH+4rkZVkQAG06GdMflUT7EAeg+27N8GmJnbLl4r
	6N6b/rhgNT8FiT87kCiA2PjF+yHxib8AaKFqJqgVkUzKBtXUHrWb/E4afBqwwp/H4bHdEY
	bgV1bXAAjknZiJnuY2tXuSrW9r22p91nMNu0xaSogdRzMqjo17/lpj5zzS7rvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727944921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rwv7c4XBUYlK7OuEf5OGodB7wdW8JkOOx3+ovXT0/yA=;
	b=mKdHY1W4AoZI5KWvzwikGqlnOCzQP4N+0b9H4jAGcJGLHeZv8ZAkkyN3sxHbVRQMTaogi3
	SpyUY03p778buxCw==
To: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH v2] irqchip/sifive-plic: Unmask interrupt in plic_irq_enable()
Date: Thu,  3 Oct 2024 10:41:52 +0200
Message-Id: <20241003084152.2422969-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_014205_623764_BA9944DA 
X-CRM114-Status: GOOD (  10.92  )
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

Fixes: a1706a1c5062 ("irqchip/sifive-plic: Separate the enable and mask operations")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
v2: re-use plic_irq_unmask() instead of duplicating its code

 drivers/irqchip/irq-sifive-plic.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 2f6ef5c495bd..503d36d5a869 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -126,16 +126,6 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
 	}
 }
 
-static void plic_irq_enable(struct irq_data *d)
-{
-	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
-}
-
-static void plic_irq_disable(struct irq_data *d)
-{
-	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
-}
-
 static void plic_irq_unmask(struct irq_data *d)
 {
 	struct plic_priv *priv = irq_data_get_irq_chip_data(d);
@@ -150,6 +140,17 @@ static void plic_irq_mask(struct irq_data *d)
 	writel(0, priv->regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
 }
 
+static void plic_irq_enable(struct irq_data *d)
+{
+	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 1);
+	plic_irq_unmask(d);
+}
+
+static void plic_irq_disable(struct irq_data *d)
+{
+	plic_irq_toggle(irq_data_get_effective_affinity_mask(d), d, 0);
+}
+
 static void plic_irq_eoi(struct irq_data *d)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
