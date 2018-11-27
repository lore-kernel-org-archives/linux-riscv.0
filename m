Return-Path: <SRS0=t+O9=OG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C20C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDDB20873
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 27 Nov 2018 10:03:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aV75B7vN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="AjMXe0LY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDDB20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8Rp34+hRKhs+2ChbDAllp/FmPOeo1dGEmD3b62gwwpE=; b=aV75B7vNBsolxDhYIGY18W7obo
	rwTsJ5Jh9qO6ANM96xjpnA1oZzLX9N8ARTpY04KzDfQLkc9Hv0k/X9Ti9zedxsk+bsjnZx80voXli
	0jih96+CJb7hQ+h+jGiigvd+LKnrrUMH13bKGTN8raXlSGKkjSgjIGiodTrW+w7ZgtD4EMxQ5kpyI
	wEoQPeh04B8cnKDBM7dyZ2drnlk2wSwCVJIUuqEzOlIPMI3VePG8+bz/6B2ZxfmYowGoY6qsv1ko0
	86meWtjGTgEquw9errZdwM9+OKo+Zp/j7KlTrXPGpRkpxJ6jP1KlCgDD7o/2yDvLOlldUFRzO7f8z
	X3qD1w/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gRaDg-0005wZ-MV; Tue, 27 Nov 2018 10:03:52 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRaDe-0005pB-Hy
 for linux-riscv@lists.infradead.org; Tue, 27 Nov 2018 10:03:52 +0000
Received: by mail-pg1-x543.google.com with SMTP id 80so7642709pge.4
 for <linux-riscv@lists.infradead.org>; Tue, 27 Nov 2018 02:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3xSjc0ofOnBOqQBPEyDFqfqunP4/jYbjTPOvYEfpGXk=;
 b=AjMXe0LYwwn9qCrzRrnKMvqiElw6fVHyStytZTXMF3c2e772O1sl3SCTfXTfAWJzu3
 dOuKocKVqUdi48zlQJAxuGEoyASuczjj3jhayvZTg4a2Cs4XjPBeHIXa/pUMHYaQIZwK
 UiOFSx8PhRi9zU37/jUfOXuLktE8FWZqNQPedE/J+ML7m1RJI1zCAkDCJO+6MME1oih8
 Yapt2h7tURHqLrVrbBqELlvtXEo+9RA5+kkIDAAmxjQb8/KcTQ8+C4P7yzL0MbDej5U6
 oO2s8H8DK3Sfa8CcYvHvYBu5RE9ZVlNYGKPEPJQYuRw170Uh1T4LVNnGTIRadgGcmvU0
 CJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3xSjc0ofOnBOqQBPEyDFqfqunP4/jYbjTPOvYEfpGXk=;
 b=mdzk8YYNzMFzE2QItAHsK0h9qb5G7ZXkMd1MTp9UdG0ZmfTuSxSBH8xu3J5atVQf+Q
 OjPIoo3eYltgQnE3e281mgPqoRJsbjAj9Ql1ydIG2MMYGoe6xKbMtWde3p5EpUQ+sIIz
 nWR3RJquS88qh0WUyFx3c9E2kojK43CMnslryqkoigWRWO8+a5YISlRbY95AVKulKfZ2
 B9esc2ddEinHgXcdm6E0AjjDd9GwktNVpj6ya0fZz97upd22S1BRZMkCGQ0QDQwFUZVa
 FQJK5umeeqQya/bm+54+w0RLzqdOZI4vJhYYSx3Knop/UVFbc8lesuJ2/3f2Olg2zUI1
 9D9g==
X-Gm-Message-State: AA+aEWYP4uysxeHsdkjg/XJYQ0xI7JfLUCyxBLaZhqFvfyGu8ybGLKO2
 x1cNZY6z9WGC/DhllGJksu/iqg==
X-Google-Smtp-Source: AFSGD/XjxfbH7D3RTxngLf37n9XcoAqdlBOw5Gulbp9b1apUNfZRKjXrXNtVu6/LAl87WwbdzzvV3Q==
X-Received: by 2002:a63:6150:: with SMTP id v77mr28002092pgb.266.1543313019860; 
 Tue, 27 Nov 2018 02:03:39 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.48.241])
 by smtp.googlemail.com with ESMTPSA id t87sm9519590pfk.122.2018.11.27.02.03.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Nov 2018 02:03:39 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v2 2/4] irqchip: sifive-plic: More flexible plic_irq_toggle()
Date: Tue, 27 Nov 2018 15:33:15 +0530
Message-Id: <20181127100317.12809-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181127100317.12809-1-anup@brainfault.org>
References: <20181127100317.12809-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181127_020350_590517_4CA39646 
X-CRM114-Status: GOOD (  16.36  )
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
Message-ID: <20181127100315.G54T-ungvQiyV-uWJnrp145y1Kbxh6nrL_MkRYW4GEk@z>

We make plic_irq_toggle() more generic so that we can enable/disable
hwirq for given cpumask. This generic plic_irq_toggle() will be
eventually used to implement set_affinity for PLIC driver.

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 79 +++++++++++++++----------------
 1 file changed, 39 insertions(+), 40 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 56fce648a901..95b4b92ca9b8 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -55,19 +55,26 @@
 #define     CONTEXT_THRESHOLD		0x00
 #define     CONTEXT_CLAIM		0x04
 
-static void __iomem *plic_regs;
-
 struct plic_handler {
 	bool			present;
-	int			ctxid;
 	void __iomem		*hart_base;
 	raw_spinlock_t		enable_lock;
 	void __iomem		*enable_base;
 };
+
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
-static inline void plic_toggle(struct plic_handler *handler,
-				int hwirq, int enable)
+struct plic_hw {
+	u32			nr_irqs;
+	u32			nr_handlers;
+	u32			nr_mapped;
+	void __iomem		*regs;
+	struct irq_domain	*irqdomain;
+};
+
+static struct plic_hw plic;
+
+static void plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
 	u32 __iomem *reg = handler->enable_base + (hwirq / 32);
 	u32 hwirq_mask = 1 << (hwirq % 32);
@@ -80,27 +87,23 @@ static inline void plic_toggle(struct plic_handler *handler,
 	raw_spin_unlock(&handler->enable_lock);
 }
 
-static inline void plic_irq_toggle(struct irq_data *d, int enable)
+static void plic_irq_toggle(const struct cpumask *mask, int hwirq, int enable)
 {
 	int cpu;
 
-	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
-	for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
-		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
-
-		if (handler->present)
-			plic_toggle(handler, d->hwirq, enable);
-	}
+	writel(enable, plic.regs + PRIORITY_BASE + hwirq * PRIORITY_PER_ID);
+	for_each_cpu(cpu, mask)
+		plic_toggle(per_cpu_ptr(&plic_handlers, cpu), hwirq, enable);
 }
 
 static void plic_irq_enable(struct irq_data *d)
 {
-	plic_irq_toggle(d, 1);
+	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 1);
 }
 
 static void plic_irq_disable(struct irq_data *d)
 {
-	plic_irq_toggle(d, 0);
+	plic_irq_toggle(irq_data_get_affinity_mask(d), d->hwirq, 0);
 }
 
 static struct irq_chip plic_chip = {
@@ -127,8 +130,6 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 	.xlate		= irq_domain_xlate_onecell,
 };
 
-static struct irq_domain *plic_irqdomain;
-
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -145,7 +146,7 @@ static void plic_handle_irq(struct pt_regs *regs)
 
 	csr_clear(sie, SIE_SEIE);
 	while ((hwirq = readl(claim))) {
-		int irq = irq_find_mapping(plic_irqdomain, hwirq);
+		int irq = irq_find_mapping(plic.irqdomain, hwirq);
 
 		if (unlikely(irq <= 0))
 			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
@@ -174,36 +175,34 @@ static int plic_find_hart_id(struct device_node *node)
 static int __init plic_init(struct device_node *node,
 		struct device_node *parent)
 {
-	int error = 0, nr_handlers, nr_mapped = 0, i;
-	u32 nr_irqs;
+	int error = 0, i;
 
-	if (plic_regs) {
+	if (plic.regs) {
 		pr_warn("PLIC already present.\n");
 		return -ENXIO;
 	}
 
-	plic_regs = of_iomap(node, 0);
-	if (WARN_ON(!plic_regs))
+	plic.regs = of_iomap(node, 0);
+	if (WARN_ON(!plic.regs))
 		return -EIO;
 
 	error = -EINVAL;
-	of_property_read_u32(node, "riscv,ndev", &nr_irqs);
-	if (WARN_ON(!nr_irqs))
+	of_property_read_u32(node, "riscv,ndev", &plic.nr_irqs);
+	if (WARN_ON(!plic.nr_irqs))
 		goto out_iounmap;
 
-	nr_handlers = of_irq_count(node);
-	if (WARN_ON(!nr_handlers))
+	plic.nr_handlers = of_irq_count(node);
+	if (WARN_ON(!plic.nr_handlers))
 		goto out_iounmap;
-	if (WARN_ON(nr_handlers < num_possible_cpus()))
+	if (WARN_ON(plic.nr_handlers < num_possible_cpus()))
 		goto out_iounmap;
 
-	error = -ENOMEM;
-	plic_irqdomain = irq_domain_add_linear(node, nr_irqs + 1,
-			&plic_irqdomain_ops, NULL);
-	if (WARN_ON(!plic_irqdomain))
+	plic.irqdomain = irq_domain_add_linear(node, plic.nr_irqs + 1,
+						&plic_irqdomain_ops, NULL);
+	if (WARN_ON(!plic.irqdomain))
 		goto out_iounmap;
 
-	for (i = 0; i < nr_handlers; i++) {
+	for (i = 0; i < plic.nr_handlers; i++) {
 		struct of_phandle_args parent;
 		struct plic_handler *handler;
 		irq_hw_number_t hwirq;
@@ -227,27 +226,27 @@ static int __init plic_init(struct device_node *node,
 		cpu = riscv_hartid_to_cpuid(hartid);
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
-		handler->ctxid = i;
 		handler->hart_base =
-			plic_regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
+			plic.regs + CONTEXT_BASE + i * CONTEXT_PER_HART;
 		raw_spin_lock_init(&handler->enable_lock);
 		handler->enable_base =
-			plic_regs + ENABLE_BASE + i * ENABLE_PER_HART;
+			plic.regs + ENABLE_BASE + i * ENABLE_PER_HART;
 
 		/* priority must be > threshold to trigger an interrupt */
 		writel(0, handler->hart_base + CONTEXT_THRESHOLD);
-		for (hwirq = 1; hwirq <= nr_irqs; hwirq++)
+		for (hwirq = 1; hwirq <= plic.nr_irqs; hwirq++)
 			plic_toggle(handler, hwirq, 0);
-		nr_mapped++;
+
+		plic.nr_mapped++;
 	}
 
 	pr_info("mapped %d interrupts to %d (out of %d) handlers.\n",
-		nr_irqs, nr_mapped, nr_handlers);
+		plic.nr_irqs, plic.nr_mapped, plic.nr_handlers);
 	set_handle_irq(plic_handle_irq);
 	return 0;
 
 out_iounmap:
-	iounmap(plic_regs);
+	iounmap(plic.regs);
 	return error;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
