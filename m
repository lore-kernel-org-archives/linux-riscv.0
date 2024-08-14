Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DACC52D7B
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MW43Z78oemPjFdmEEpEBIjAkLTtiEYhdqU4oDQ26OMc=; b=Ojhw2MQ82hZnCQ
	XIemuKzbfhaUSGY7gSVKC6GTD1H0YrnbFwtAS2mhHXHp5UNAltwR7bC/TOpjRqgyqbmU6pW6PSGX9
	ellsAOwTgpTaA9HOhblNwZ/MHacgIw/zbiTavch9O/7qUNkD0WtWb/FdFb7qMEN2ym2Aw4bQeOi5x
	twFkIV6JLyl5vqq++GhRJCWfSVGb6GR3f7amW7wjG+tEIt7Tnvc7/nqoynD9z37PO8bbxqTBc1PlN
	rGzP+IzpN0uJ1XtQLDB5L5v3ZSgBaZ1zaBMRjaEpcfg3L0xdxH32Qw2rbtFtsYUhYSuc/zO3uJbHT
	7RQW+YLmGiCrLl83AM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRu-00000007OSM-0D8g;
	Wed, 14 Aug 2024 14:58:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQq-00000007O6U-3PLg
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:57:02 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6857845978
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647416;
	bh=dOSvdt4T3jlTBcb6KodFmG9e7Ly2LfYMJaL7xOSj3eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=Kxif1l5Knw6FBDwv1BqcBfXRwzG44E7ZerrcSYDP0t0YE6sIJ5H0JEMbpj6BBVWJ4
	 n3Z7Ls5NK7sdZjJ30lRl6q4BW/KiPW0oqCePJttt4UONxn3Kjqr8vI3F8494lb5Tw9
	 z7he5a6q76UosSFZiOuFqoQ0nFsu+01rFO0MA3mB5Vejc3gUrOfxTnq1NWxNEBUjUO
	 f8JhE0cS6kA20MU2x+NII/BL+Ly30ud9jVhASsGyLOnIZ2l/Mv31Ce2SHqkjHeZC2b
	 gY2lAa95Reef3gh4ArgrohYk1dR+pRp0adsQmj4N9HpYJf6E5Iwb2NlG7/BytXu7Ly
	 F3BLPguyONwOQ==
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52fceed3473so6311556e87.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647411; x=1724252211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dOSvdt4T3jlTBcb6KodFmG9e7Ly2LfYMJaL7xOSj3eg=;
        b=Q4sPQglOjmCb1Y/65qOG2MqTtPxFUaqt1NBD0kKn2yp6pNNHHaEuPmSee9bJG4cQom
         PByR4UgwANzEMSBx1eP82WFMTy32f+NjEJWAYiNzLxzf18ISJq0sWq6nyLJgAaokdE0x
         SKW1smekjwc/2CJ3CRsSCV7kOVif6xLGCTwbX4nFyP6Ezj++xypePqJEmhFATsqC7BcJ
         WmTaiSP6xYPRRPDEiXK/VKiIKEH+/9pSv6Ul5zaVpeYVv357MH11OQZ+/QseJ7zgLwKq
         qW4vZzpqY9ZBJEV0//0yvflWyYlX6aTzBirSy9Qp+/4jotQfslaFGJZwZlRwCI9CbgzL
         eb/A==
X-Forwarded-Encrypted: i=1; AJvYcCVbGGvAiwZ4h4lICpXNHMMT/XBLAm6EhmLH95j/JdMcKGBDdoVXRxQsdD3FpF0+s0XIeVWbpn5oYp/AvGQi+kKv3uGlwTo0k6RrS1mvoKFT
X-Gm-Message-State: AOJu0Yw76QjGwnhSVYI0Vmxyfzi8QA3lj4QUeIJrS+mv7Cuh2El17n6n
	/y+vu1S/6VkENeDsau4nv5m1Rl8ZNwPfreTc9X5ie3bRBDgl9FJbcI5rXfRx+gAbM4F6xe2arZh
	WyFp8DJwn/9vvwE0F53Tvd75eXEaX+Mz2zG1Og/D6qxcfBfsQWpyBCdAozr3MaIbFP1A4UcSZgo
	NszMI98A==
X-Received: by 2002:a05:6512:3d9f:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-532edbbf2bbmr2673957e87.51.1723647411067;
        Wed, 14 Aug 2024 07:56:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgFXAwyHjES6E7fkIaDAnivwak2wjYQiuQb0rFCs3xDtd1HCvI2yY+1dmem8aEkcG4O8KaeA==
X-Received: by 2002:a05:6512:3d9f:b0:52c:e119:7f1 with SMTP id 2adb3069b0e04-532edbbf2bbmr2673932e87.51.1723647410263;
        Wed, 14 Aug 2024 07:56:50 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 7/9] Revert "irqchip/sifive-plic: Use devm_xyz() for managed allocation"
Date: Wed, 14 Aug 2024 16:56:39 +0200
Message-ID: <20240814145642.344485-8-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075701_023007_26AE38A4 
X-CRM114-Status: GOOD (  16.17  )
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

This reverts commit b68d0ff529a939a118ec52f271be8cad5d99e79a.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 49 +++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 7dbc662a229c..7cf06bbb3098 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -442,30 +442,39 @@ static int plic_probe(struct platform_device *pdev)
 			plic_quirks = (unsigned long)id->data;
 	}
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
 
-	priv->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (WARN_ON(!priv->regs))
-		return -EIO;
+	priv->regs = of_iomap(to_of_node(dev->fwnode), 0);
+	if (WARN_ON(!priv->regs)) {
+		error = -EIO;
+		goto out_free_priv;
+	}
 
+	error = -EINVAL;
 	of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", &nr_irqs);
 	if (WARN_ON(!nr_irqs))
-		return -EINVAL;
+		goto out_iounmap;
 
 	priv->nr_irqs = nr_irqs;
 
-	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
+	priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
-		return -ENOMEM;
+		goto out_free_priority_reg;
 
 	nr_contexts = of_irq_count(to_of_node(dev->fwnode));
 	if (WARN_ON(!nr_contexts))
-		return -EINVAL;
+		goto out_free_priority_reg;
+
+	error = -ENOMEM;
+	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
+						&plic_irqdomain_ops, priv);
+	if (WARN_ON(!priv->irqdomain))
+		goto out_free_priority_reg;
 
 	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
@@ -536,10 +545,10 @@ static int plic_probe(struct platform_device *pdev)
 			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
-						    sizeof(*handler->enable_save), GFP_KERNEL);
+		handler->enable_save =  kcalloc(DIV_ROUND_UP(nr_irqs, 32),
+						sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save)
-			return -ENOMEM;
+			goto out_free_enable_reg;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -549,11 +558,6 @@ static int plic_probe(struct platform_device *pdev)
 		nr_handlers++;
 	}
 
-	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
-						&plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain))
-		return -ENOMEM;
-
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
 	 * and register syscore operations only once after context
@@ -580,6 +584,19 @@ static int plic_probe(struct platform_device *pdev)
 	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
 		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
+
+out_free_enable_reg:
+	for_each_cpu(cpu, cpu_present_mask) {
+		handler = per_cpu_ptr(&plic_handlers, cpu);
+		kfree(handler->enable_save);
+	}
+out_free_priority_reg:
+	kfree(priv->prio_save);
+out_iounmap:
+	iounmap(priv->regs);
+out_free_priv:
+	kfree(priv);
+	return error;
 }
 
 static struct platform_driver plic_driver = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
