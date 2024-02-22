Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3F6C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hNAIEMoU9V0BFUCFKyIInoo6PWpTXrHkFEKazq2MjwA=; b=CoSMdWKUPUtuBb
	LPqUvgQXWpsNM6/FK4I2Z+KA1dkqkbdeU1QBTAN85ZRxdREGR+dSHUccIBFumQ1ssmQYkPtjYaDIN
	OtV3QShgc+nZ4wI7oUjOoSbOlWK9FUg00ExT3Wd5ju7GPyt3D2SZr2KPAQp3yw00xzmTmKeZj2Y+m
	nhKlfjDtmJJudkpIqhvJm7q6b+ILG+/SCyp8qMYCH6skb4xkmJ6TNheyaOtQcqpB3io5zti8h2hxd
	ceudXPkXONpgNrHA3CwGTgmM81hDeuPaAlkHiuWabfuB/o81VRJAg95K/97icYKUx5nLRg1xKd2aB
	tBOqe1mdh5k8RmpBPwkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZR-00000004I08-2Nzn;
	Thu, 22 Feb 2024 09:40:49 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZF-00000004HqC-1sEX
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:40:40 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3c0467b94c6so4763342b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594835; x=1709199635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6AtwHVNk/A02rm2BNjvTDG/J53NTzs7XDtfqSpV9KE=;
        b=cpmw/8js9/9Om3rcZIlD3ivMUYdCYh3ngn5SOTgX3fbiYEVru9cmaoYDWEz4M38vjg
         YYWxgGhJ4rfLSrieKQZajwDr8fMpQQ/ojri1dOknVI2wzZlZcOf7oj9Yei57CgkztBmL
         ydP26U3CP1rT7bJXRVAmUCwoGgwj0c6BmuTgHvHU8GyNuTbrj/1wFb3ACTqSm0Ad6PeN
         RzVb7d0ToG9qw8gwEcXBJlLOuRK+jqC+wtYwq29jngufYpN9r3CiIWTSbFc9Mfus4H7n
         1oUIwzi5Yf7UlLJekZvanAnQ9UBjYRfw0P6WAYHeLDRo79cHeMcvFwa1OlxPtxLRrKkq
         JZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594835; x=1709199635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6AtwHVNk/A02rm2BNjvTDG/J53NTzs7XDtfqSpV9KE=;
        b=J1g8fMX38KQAOfuDkIt5/NlgM5x1tqjBfSby/ap71nTRyQw2nFaFOc3R7eKYVvubV0
         7GhaxdA+Dg5qZQ0317k17q/9wvIa5kZGgI7oAlzyXUHv87ZCX9WC8nxZeg0Q8ddLctgm
         aEs03tSt4l2Ce05wTR3UZnkvmwxjsqsRymdwLO1i67x6ezEvNdchWsa0Dvdgc9TxCvIT
         klbBEsV68iAEZkAJkwAyHUWssOJsvz6SVPb9lSiIN3jU757ISlMzXTnou3gimFyyDwmN
         Vadhl9kP5VXTe9pfhyrFWC7UbubLMl8Y0sETRTaighBrqElCzgCY/bG5CpEXHUAHpnJF
         XJeA==
X-Forwarded-Encrypted: i=1; AJvYcCWRSJvoq0m/A2KPK0WvHzVl0b9yib/2XU4VG2U2y5TwXnpa9gcuzKupTHQ2yE9gR/+4KdymrzuYkOjsPQRrqA4ruYBXfVrBrz5n3dYgf8bv
X-Gm-Message-State: AOJu0YwZ9HApj3Q4P6PobEOeIsfe8Twyn+7zQOKqNq+ryxoRo0jAhxi0
	7ZgX9VN2woojSLTgU1V6hT+s6S3j0dXxhqkbvkiSZ3j3t1vctyDDXGb6xduHmfPGx+Rs6x0sLXK
	ofhY=
X-Google-Smtp-Source: AGHT+IF8OgbTXViwpivkEQdHOkIi0+Npt3Tll1vfHu4pj3kF2ykzuXdajZKv4KF3NLZSSnHpD8JjgA==
X-Received: by 2002:a05:6808:169f:b0:3c1:33a1:5ab4 with SMTP id bb31-20020a056808169f00b003c133a15ab4mr25347876oib.23.1708594835238;
        Thu, 22 Feb 2024 01:40:35 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:34 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 02/18] irqchip/sifive-plic: Use dev_xyz() in-place of pr_xyz()
Date: Thu, 22 Feb 2024 15:09:50 +0530
Message-Id: <20240222094006.1030709-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014037_653846_E072BE2E 
X-CRM114-Status: GOOD (  12.60  )
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

Use dev_info(), dev_warn(), and dev_err() in-place of pr_info(),
pr_warn(), and pr_err().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 7400a07fc479..3d7a61c35572 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 SiFive
  * Copyright (C) 2018 Christoph Hellwig
  */
-#define pr_fmt(fmt) "plic: " fmt
 #include <linux/cpu.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -372,8 +371,8 @@ static void plic_handle_irq(struct irq_desc *desc)
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
 		if (unlikely(err))
-			pr_warn_ratelimited("can't find mapping for hwirq %lu\n",
-					hwirq);
+			dev_warn_ratelimited(handler->priv->dev,
+					     "can't find mapping for hwirq %lu\n", hwirq);
 	}
 
 	chained_irq_exit(chip, desc);
@@ -401,7 +400,7 @@ static int plic_starting_cpu(unsigned int cpu)
 		enable_percpu_irq(plic_parent_irq,
 				  irq_get_trigger_type(plic_parent_irq));
 	else
-		pr_warn("cpu%d: parent irq not available\n", cpu);
+		dev_warn(handler->priv->dev, "cpu%d: parent irq not available\n", cpu);
 	plic_set_threshold(handler, PLIC_ENABLE_THRESHOLD);
 
 	return 0;
@@ -477,7 +476,7 @@ static int plic_probe(struct platform_device *pdev)
 		unsigned long hartid;
 
 		if (of_irq_parse_one(to_of_node(dev->fwnode), i, &parent)) {
-			pr_err("failed to parse parent for context %d.\n", i);
+			dev_err(dev, "failed to parse parent for context %d.\n", i);
 			continue;
 		}
 
@@ -500,13 +499,13 @@ static int plic_probe(struct platform_device *pdev)
 
 		error = riscv_of_parent_hartid(parent.np, &hartid);
 		if (error < 0) {
-			pr_warn("failed to parse hart ID for context %d.\n", i);
+			dev_warn(dev, "failed to parse hart ID for context %d.\n", i);
 			continue;
 		}
 
 		cpu = riscv_hartid_to_cpuid(hartid);
 		if (cpu < 0) {
-			pr_warn("Invalid cpuid for context %d\n", i);
+			dev_warn(dev, "Invalid cpuid for context %d\n", i);
 			continue;
 		}
 
@@ -525,7 +524,7 @@ static int plic_probe(struct platform_device *pdev)
 		 */
 		handler = per_cpu_ptr(&plic_handlers, cpu);
 		if (handler->present) {
-			pr_warn("handler already present for context %d.\n", i);
+			dev_warn(dev, "handler already present for context %d.\n", i);
 			plic_set_threshold(handler, PLIC_DISABLE_THRESHOLD);
 			goto done;
 		}
@@ -575,8 +574,8 @@ static int plic_probe(struct platform_device *pdev)
 		}
 	}
 
-	pr_info("%pOFP: mapped %d interrupts with %d handlers for %d contexts.\n",
-		to_of_node(dev->fwnode), nr_irqs, nr_handlers, nr_contexts);
+	dev_info(dev, "mapped %d interrupts with %d handlers for %d contexts.\n",
+		 nr_irqs, nr_handlers, nr_contexts);
 	return 0;
 
 out_free_enable_reg:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
