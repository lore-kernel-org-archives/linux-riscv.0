Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2D2C624D6
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 04:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxjnsVSCwN+rXrgFwfkrsLIBKe5OjGm/lIGI6DETEbI=; b=PhwZWf+DzEo3aF
	Wyl1pPjBC88BTsx50ESbei9heHtzsHWHx/CdepNVQPrKLqUbjbzqAKIopT/t6Hsy/umojjl7URJtI
	1HGR5LPVyI0RZpO2SGplpnqpHXCSP+HOe5sC+F6sw+Ar2lImHKtCRhzKtuZJN73AI3SUfKxW7QHwW
	we/Ul28/twzfyNgiAsX9cCUA40ZD2tR3cb/SZD/3y0bFWEf3H4ahd15gU63XySq4fc30Bzimy44lE
	qfyviunuTu++yxFNKKCaYI+YhQxl3xRsf36Q0wH0dxCMgZ9IR0wA5Yh2OpZhk4YKRRK3skPDQ+hE8
	bL/g1b5EH/aT28ARqdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2hkx-00000003ew2-0glp;
	Sat, 05 Sep 2026 04:11:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2hkt-00000003evg-0rUg
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 04:11:53 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788581508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BwJxxpIKPnBHI4VY7zARluva0nthe+9f+WADNwWm2Bw=;
	b=l3FSkkhQoNL0712CA+vw8oKaDvXVKh6pZDOfh4BsyjVg4vfx/6DZz5PYBwmKgshCKy8bP0
	rxUo/8X7154WI3cI+HaL/lN1Tn+yfegJnDtN0ZroGSRWEReFmZWij8ytu1oZnYRaTg9Wnl
	aM65xf1xIGy4wlMKZUZqz+KOx58XXtjOjyM6n7iFFE11gt0K83HSJvVnfegOjKAAu15Itg
	q9s8NgS2U+30xe8c9YN5RIcwgRq/ehjjYUHjuw4JY5vY+yzLJijtArguLiSrIvKmFlH91k
	Jg4CusJ+v41+PZTnWu9FaWY1D80x+kC2EjXNbgs0d5ht+X0iRn+RPPhG8Bu/GQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788581508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BwJxxpIKPnBHI4VY7zARluva0nthe+9f+WADNwWm2Bw=;
	b=IXjolMZ++uvgU20IV4cGzEcHabqvWQLW9BKfXr4L8HPNAOC/JcVcbQ24EPmgrw4/0xFI49
	ehdZY/sPqhQ+KvCw==
To: Thomas Gleixner <tglx@kernel.org>, Haofeng Li <lihaofeng@kylinos.cn>
Cc: linux-kernel@vger.kernel.org, Haofeng Li <13266079573@163.com>, Haofeng
 Li <lihaofeng@kylinos.cn>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 linux-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Radu
 Rendec <radu@rendec.net>
Subject: Re: [PATCH 00/16] irqchip: harden initialization error paths
In-Reply-To: <87y0e1i648.ffs@fw13>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
 <87y0e1i648.ffs@fw13>
Date: Sat, 05 Sep 2026 06:11:46 +0200
Message-ID: <87ik4k9w1p.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_211151_417624_A9F423A3 
X-CRM114-Status: GOOD (  14.01  )
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

Thomas Gleixner <tglx@kernel.org> writes:
> A lot of these "fixes" are purely cosmetic and create a false sense of
> correctness because if the initialization of the root interrupt
> controller of a system fails then machine won't boot at all.
>
> So instead of adding tons of cleanups we rather go and analyze which
> controllers are actually root controllers and therefore essential for
> the machine to boot. For those the only valid error handling is:

PLIC is one of those. I will send a patch.

Nam

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..0fbecaf0d317 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -643,13 +643,11 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 	error = plic_parse_nr_irqs_and_contexts(fwnode, &nr_irqs, &nr_contexts, &gsi_base, &id);
 	if (error)
-		goto fail_free_regs;
+		return error;
 
 	priv = kzalloc_obj(*priv);
-	if (!priv) {
-		error = -ENOMEM;
-		goto fail_free_regs;
-	}
+	if (!priv)
+		return -ENOMEM;
 
 	priv->fwnode = fwnode;
 	priv->plic_quirks = plic_quirks;
@@ -668,10 +666,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	priv->acpi_plic_id = id;
 
 	priv->prio_save = bitmap_zalloc(nr_irqs, GFP_KERNEL);
-	if (!priv->prio_save) {
-		error = -ENOMEM;
-		goto fail_free_priv;
-	}
+	if (!priv->prio_save)
+		return -ENOMEM;
 
 	for (i = 0; i < nr_contexts; i++) {
 		error = plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu,
@@ -735,10 +731,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 
 		handler->enable_save = kcalloc(priv->irq_groups, sizeof(*handler->enable_save),
 					       GFP_KERNEL);
-		if (!handler->enable_save) {
-			error = -ENOMEM;
-			goto fail_cleanup_contexts;
-		}
+		if (!handler->enable_save)
+			return -ENOMEM;
 done:
 		for_each_device_irq(hwirq, priv) {
 			plic_toggle(handler, hwirq, 0);
@@ -748,10 +742,8 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	}
 
 	priv->irqdomain = irq_domain_create_linear(fwnode, nr_irqs, &plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain)) {
-		error = -ENOMEM;
-		goto fail_cleanup_contexts;
-	}
+	if (!priv->irqdomain)
+		return -ENOMEM;
 
 	/*
 	 * We can have multiple PLIC instances so setup global state
@@ -799,33 +791,13 @@ static int plic_probe(struct fwnode_handle *fwnode)
 	pr_info("%pfwP: mapped %d interrupts with %d handlers for %d contexts.\n",
 		fwnode, nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-fail_cleanup_contexts:
-	for (i = 0; i < nr_contexts; i++) {
-		if (plic_parse_context_parent(fwnode, i, &parent_hwirq, &cpu, priv->acpi_plic_id))
-			continue;
-		if (parent_hwirq != RV_IRQ_EXT || cpu < 0)
-			continue;
-
-		handler = per_cpu_ptr(&plic_handlers, cpu);
-		handler->present = false;
-		handler->hart_base = NULL;
-		handler->enable_base = NULL;
-		kfree(handler->enable_save);
-		handler->enable_save = NULL;
-		handler->priv = NULL;
-	}
-	bitmap_free(priv->prio_save);
-fail_free_priv:
-	kfree(priv);
-fail_free_regs:
-	iounmap(regs);
-	return error;
 }
 
 static int plic_platform_probe(struct platform_device *pdev)
 {
-	return plic_probe(pdev->dev.fwnode);
+	if (plic_probe(pdev->dev.fwnode))
+		panic("Failed to initialize root interrupt controller\n");
+	return 0;
 }
 
 static struct platform_driver plic_driver = {
@@ -842,7 +814,10 @@ builtin_platform_driver(plic_driver);
 static int __init plic_early_probe(struct device_node *node,
 				   struct device_node *parent)
 {
-	return plic_probe(&node->fwnode);
+	if (plic_probe(&node->fwnode))
+		panic("Failed to initialize root interrupt controller\n");
+	return 0;
 }
 
 IRQCHIP_DECLARE(riscv, "allwinner,sun20i-d1-plic", plic_early_probe);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
