Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060D0C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S5dWOs5BhIzRqy6GPTeABpvH91Pyo+rROeMZBxrb57M=; b=kHIawlijZzrRbh
	5tcLEqsW6eTcLQ1M8TVnSmS6vChQOY4sqvhEUUUY+rv7ybXe9LOhQU+5oKwDChs5r/4nOMhz+IBU6
	inGwKgsb/GHIJ81QeBEABlu68yF5md4eBW1eOkuHr1PhGxmvCbdENvzhVE6b3NLQgZZF35PAONQK6
	b+iTAIUNdt91Lzs61tZ76UmSTRiFzjwDorUPSgh0hsedkeVxS81W/Q1nM2JKfkh4k1CQqpca+PwF6
	l8SjFjNNUq419wNo/AW7b4k/6MdQqAUXKF2tIoK7zUm4fPgKqtqqSkP/up10hv71U2fip5fGZwLgd
	SZZOHSXwBiccm/DwIKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZU-00000004I3M-2g7v;
	Thu, 22 Feb 2024 09:40:52 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZM-00000004HwE-3IJw
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:40:46 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-595b3644acbso289961eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594842; x=1709199642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Mzp7gOUhADSPQHe9BbGbbZnz24qrFAsUkCIt0RA8CU=;
        b=hKkzRKut1kAkclFxM6n9VwjI0U4VnC9cjrxLr7gvU9RX6yQvejRKWlihqjh15Vngi/
         +Hs0GJ2RC60NDC4sG+UGjj8wrVdC+1f4ud9tleiW+zdrsQN1LOtjzrOtP7kywIm5mJEs
         cvcgQp/tI+opeXHaoPZG08dNZHjdmXTtr+jr6h8dyDW8/2Mww5YALTpg+xm+47bHA6BK
         LkblhVDBQvYXrolUGFLUlnsrnBHg5K1dvkgFGsQKOylwydVlvAY4Urd1ZWDDuQ0hDBTl
         iUhA/Y6TQSZk93k5zDkxat9swSrUluR6lgvA4pRZicuSFoknoRDfb1L4dsRkZWWaMG33
         W5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594842; x=1709199642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Mzp7gOUhADSPQHe9BbGbbZnz24qrFAsUkCIt0RA8CU=;
        b=NFC7Cw+T4wHcOkUVGa5lmDWgjH+N52M8+bed59Gd3qU0FEi5+kwNx7e3aTSooUzi8V
         pAJNthU+kVm/R3fWpAHsfT6GWx49rqmNR4BXSZ/yg1kAQpZzJCwCIOolAQsMrWaGn3+y
         zEiiExzIoYgXSxW2KsurkYEkcJDpKLF4gt/bYiwbmUIps2Okq+7wmPkZVg5AcTvRi078
         QLBT3/iPcbndxugVdBoO7q0dWcjMBJtiIdyl10lIzkxxPL43lV0LD26Cl5ZPuodCr/y1
         CxQ6eMPKgbvft4M3xGH4e5E2fMW6EFQ+LtkY2JdJcV5TFeArJqwuCXMGC3Xn2Hjmbuja
         XKcg==
X-Forwarded-Encrypted: i=1; AJvYcCUWuSonI2b2JM8L77H8OS0yAebAQVS8tUyCq8QkZniwS68O3oQbSqUZTlhA5Vj4hFZHM3L6MqqlraAaT8OGDRPzOykoVPIGWfGku6Q5IS8D
X-Gm-Message-State: AOJu0Yy1BISL344EpnPzSWs7ry8LukHyR/Y+6QNXPIpboonKbaBnQP3T
	GTMAFM7MhZ3dvpySQO4yK4qZpdXreMwPyyIm1c8VBleuArZ+zGnr7H1OJBWEjBA=
X-Google-Smtp-Source: AGHT+IFzj7gpBHsAbfHA1HB2Ahj3EaOotj58ypEPbvRRGrv+4AcOMimIZzwgpDeKvAl20quCShvtNQ==
X-Received: by 2002:a05:6871:4e43:b0:21e:9dbd:ce3b with SMTP id uj3-20020a0568714e4300b0021e9dbdce3bmr938781oab.6.1708594842413;
        Thu, 22 Feb 2024 01:40:42 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:42 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 03/18] irqchip/sifive-plic: Use devm_xyz() for managed allocation
Date: Thu, 22 Feb 2024 15:09:51 +0530
Message-Id: <20240222094006.1030709-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014044_876911_7EF8330F 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use devm_xyz() for allocations and mappings managed by the
Linux device driver framework.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 49 ++++++++++---------------------
 1 file changed, 16 insertions(+), 33 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 3d7a61c35572..558ae63795d9 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -435,39 +435,30 @@ static int plic_probe(struct platform_device *pdev)
 			plic_quirks = (unsigned long)id->data;
 	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	priv->dev = dev;
 	priv->plic_quirks = plic_quirks;
 
-	priv->regs = of_iomap(to_of_node(dev->fwnode), 0);
-	if (WARN_ON(!priv->regs)) {
-		error = -EIO;
-		goto out_free_priv;
-	}
+	priv->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (WARN_ON(!priv->regs))
+		return -EIO;
 
-	error = -EINVAL;
 	of_property_read_u32(to_of_node(dev->fwnode), "riscv,ndev", &nr_irqs);
 	if (WARN_ON(!nr_irqs))
-		goto out_iounmap;
+		return -EINVAL;
 
 	priv->nr_irqs = nr_irqs;
 
-	priv->prio_save = bitmap_alloc(nr_irqs, GFP_KERNEL);
+	priv->prio_save = devm_bitmap_zalloc(dev, nr_irqs, GFP_KERNEL);
 	if (!priv->prio_save)
-		goto out_free_priority_reg;
+		return -ENOMEM;
 
 	nr_contexts = of_irq_count(to_of_node(dev->fwnode));
 	if (WARN_ON(!nr_contexts))
-		goto out_free_priority_reg;
-
-	error = -ENOMEM;
-	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
-						&plic_irqdomain_ops, priv);
-	if (WARN_ON(!priv->irqdomain))
-		goto out_free_priority_reg;
+		return -EINVAL;
 
 	for (i = 0; i < nr_contexts; i++) {
 		struct of_phandle_args parent;
@@ -538,10 +529,10 @@ static int plic_probe(struct platform_device *pdev)
 			i * CONTEXT_ENABLE_SIZE;
 		handler->priv = priv;
 
-		handler->enable_save =  kcalloc(DIV_ROUND_UP(nr_irqs, 32),
-						sizeof(*handler->enable_save), GFP_KERNEL);
+		handler->enable_save = devm_kcalloc(dev, DIV_ROUND_UP(nr_irqs, 32),
+						    sizeof(*handler->enable_save), GFP_KERNEL);
 		if (!handler->enable_save)
-			goto out_free_enable_reg;
+			return -ENOMEM;
 done:
 		for (hwirq = 1; hwirq <= nr_irqs; hwirq++) {
 			plic_toggle(handler, hwirq, 0);
@@ -551,6 +542,11 @@ static int plic_probe(struct platform_device *pdev)
 		nr_handlers++;
 	}
 
+	priv->irqdomain = irq_domain_add_linear(to_of_node(dev->fwnode), nr_irqs + 1,
+						&plic_irqdomain_ops, priv);
+	if (WARN_ON(!priv->irqdomain))
+		return -ENOMEM;
+
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state
 	 * and register syscore operations only once after context
@@ -577,19 +573,6 @@ static int plic_probe(struct platform_device *pdev)
 	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
 		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
-
-out_free_enable_reg:
-	for_each_cpu(cpu, cpu_present_mask) {
-		handler = per_cpu_ptr(&plic_handlers, cpu);
-		kfree(handler->enable_save);
-	}
-out_free_priority_reg:
-	kfree(priv->prio_save);
-out_iounmap:
-	iounmap(priv->regs);
-out_free_priv:
-	kfree(priv);
-	return error;
 }
 
 static struct platform_driver plic_driver = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
