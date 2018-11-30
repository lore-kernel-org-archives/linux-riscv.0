Return-Path: <SRS0=zN4P=OJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2406C65BAE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32382082F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Nov 2018 08:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVWFkgS/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JKT1gLgU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32382082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2ZERJSP+M/46rcj3J6ShHtuPgHeSDkUlg9583r8tQz4=; b=fVWFkgS/iDG2wNRBQgbUECKMOh
	E5p8xpbTknBl7VPbIEf3h+WZOTPbJZ4Qk2GTI0gfWqaC9k8tfGXVFffBMv/Lr4m2i0OhIwKq1Ru8J
	1I20nFD3dJUa55EpUABHELGSRcSyHKAXkRuTxkDTGXIQ0bvmCJRR2ncqNuuMAfUUo4u3VdAinSzsm
	fZpLQzP+2F3WrvGjDk9ylHXCTE7XS58+HeJHcW702jdltDhnxQ/j+QWZKUjih9vZs6yiCgZp8fdjp
	5nYwkPNbuBkTktFd7BZDSCu+Ac8NvaXX4TMftMMcDoCnHuWY7YPYVWMjSj4ixUQxGiiaDydgFojhF
	rqAk9yVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSdkw-0003jQ-Rc; Fri, 30 Nov 2018 08:02:34 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSdkt-0003gr-KY
 for linux-riscv@lists.infradead.org; Fri, 30 Nov 2018 08:02:33 +0000
Received: by mail-pg1-x542.google.com with SMTP id d72so2151837pga.9
 for <linux-riscv@lists.infradead.org>; Fri, 30 Nov 2018 00:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kkVGy4h7Z995lrFmqX6qHIt4h7IAkxhYZu3D8v9Oubs=;
 b=JKT1gLgUoLVHpe9nJxzu6L/bLqyFy9HwvwF4/VMPXxC+Cq8HGxblegWVPmLLauuWmW
 0kZ3dr5XBp6AgrKZujchCgccSWQOFKdIjDTk5P/jvBtxCPEQbDzKH77TQeYRClI/4vnM
 Zwd0mpi4Z/APgXDB/nuM7Czu4jAEXJDqsD8jxC8aEunGP5MNvlgK5oFv8QXBlxbVdsm2
 /9bYqt/FhuQ+WfiK8tTyn2yTasNGTqZwOAGbU3DCaSJ3j68hfo9KeJoftRFzig7OcGFA
 hZvlXw8moFu25WAQO+qAtYFrGW9AQnbwxg9V6m8spXgGd7R3D01ZxZuoYCss0mG2O5Fr
 EFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kkVGy4h7Z995lrFmqX6qHIt4h7IAkxhYZu3D8v9Oubs=;
 b=FV9mAE9oGX5ratirmmAmTY4GnPjoO3uvha3l7Iayd5lDgx3bOn1OsuTU1ZyOx86eSq
 +BPP5LqywsrRvOhSZWuY1A49WQ7eerFx4o5VBuH0wVswH/hF69uNHqk+AX6l0Uz5nDgR
 cjJj/+NO1R3TXRtZN9SsU+UcaNc0poejw6ocAI5SHK8AmymxdLrOCOhEjVR8//z+7pqP
 zZzhwDozXMcDeRDJQxBW9/JPU4VljXmCF76bWDQy/WIJgtj4S7R88fJB+xPlgpV38tBC
 K8K1hxlQoLw1FPpZhNbX30r9a32cgtdNKzC+4Xgv3Raer2lgBri/7uRVhFaqCak0Bp3W
 uiew==
X-Gm-Message-State: AA+aEWYJM1+uP2fi0MADtolmtUB5n5BQaVLIu3tBB919TUYjpS0aAUIS
 vO53Q6cL0zR7HinCVsGMCHgb2w==
X-Google-Smtp-Source: AFSGD/UELnKSp4FfeQDOOOJa1A3b/H97XMHjOREzupDHSRM3KVvzwy/kAlWP5yoNIRCwEOA40Iw7OA==
X-Received: by 2002:a63:5664:: with SMTP id g36mr3957567pgm.313.1543564945683; 
 Fri, 30 Nov 2018 00:02:25 -0800 (PST)
Received: from anup-ubuntu64.qualcomm.com ([49.207.52.208])
 by smtp.googlemail.com with ESMTPSA id
 q187sm19218333pfq.128.2018.11.30.00.02.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Nov 2018 00:02:24 -0800 (PST)
From: Anup Patel <anup@brainfault.org>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <marc.zyngier@arm.com>
Subject: [PATCH v3 2/6] irqchip: sifive-plic: Add struct plic_hw for global
 PLIC HW details
Date: Fri, 30 Nov 2018 13:32:03 +0530
Message-Id: <20181130080207.20505-3-anup@brainfault.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181130080207.20505-1-anup@brainfault.org>
References: <20181130080207.20505-1-anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_000231_698648_2D208E8A 
X-CRM114-Status: GOOD (  16.68  )
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

This patch adds Add struct plic_hw to represent global PLIC HW details.

Currently, these details are only used in plic_init() but in-future
these will be useful in implementing PM suspend and resume callbacks.

Further, these global details are good debug info about HW so let's
not throw them away after use in plic_init().

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 drivers/irqchip/irq-sifive-plic.c | 59 +++++++++++++++++--------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index c23a293a2aae..48bee877e0f1 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -55,8 +55,6 @@
 #define     CONTEXT_THRESHOLD		0x00
 #define     CONTEXT_CLAIM		0x04
 
-static void __iomem *plic_regs;
-
 struct plic_handler {
 	bool			present;
 	void __iomem		*hart_base;
@@ -67,8 +65,19 @@ struct plic_handler {
 	raw_spinlock_t		enable_lock;
 	void __iomem		*enable_base;
 };
+
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
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
 static inline void plic_toggle(struct plic_handler *handler,
 				int hwirq, int enable)
 {
@@ -87,7 +96,7 @@ static inline void plic_irq_toggle(struct irq_data *d, int enable)
 {
 	int cpu;
 
-	writel(enable, plic_regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
+	writel(enable, plic.regs + PRIORITY_BASE + d->hwirq * PRIORITY_PER_ID);
 	for_each_cpu(cpu, irq_data_get_affinity_mask(d)) {
 		struct plic_handler *handler = per_cpu_ptr(&plic_handlers, cpu);
 
@@ -130,8 +139,6 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 	.xlate		= irq_domain_xlate_onecell,
 };
 
-static struct irq_domain *plic_irqdomain;
-
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -148,7 +155,7 @@ static void plic_handle_irq(struct pt_regs *regs)
 
 	csr_clear(sie, SIE_SEIE);
 	while ((hwirq = readl(claim))) {
-		int irq = irq_find_mapping(plic_irqdomain, hwirq);
+		int irq = irq_find_mapping(plic.irqdomain, hwirq);
 
 		if (unlikely(irq <= 0))
 			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
@@ -177,36 +184,35 @@ static int plic_find_hart_id(struct device_node *node)
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
 
 	error = -ENOMEM;
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
@@ -231,25 +237,26 @@ static int __init plic_init(struct device_node *node,
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		handler->present = true;
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
