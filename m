Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CF9C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jan 2022 05:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4+YuuGg9a+qBCDjmmM8CUL6dW6bzdjNAnsu7LfyjAI=; b=wMPz0EGGwvkdSP
	khA0/9YwYIp5BrLA5oqDCAQEB1/X0eBUktXe9B9K+5W0EgqPd/B+ofZEnSyJZpD/wJtmH8QBSVI1b
	5P1Rmq8XVYn75gVj5ZKK6JwpqTFoLlxYlTIQwYjbjb124cKz48FN1aSCkvp+CCzmqShOV9q+v+Ip9
	+mXFd/kn8NnCIF8DBf8FKI8clYenF2z1v10U7FfX9RSsKWIkw6oQ0BZAcy4i1nZ8b7BJN7C0zzApW
	yZymPgU6AyBiREgslOFuCnsSVhfCWn4sEMdal4OY2gtQs7r4yDU9crWdmqJEP82ht/F0WB9MA3STl
	62ggWtXI7YxwfySk7yjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDJlm-000RWw-Az; Fri, 28 Jan 2022 05:25:58 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDJlj-000RVj-SE
 for linux-riscv@lists.infradead.org; Fri, 28 Jan 2022 05:25:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id b15so4898393plg.3
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 21:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f6Dhv5CqQOYQndQIhDjH4EYISmVCA9GVd9cSSXcZ/p4=;
 b=GaXc22d/Oeuw/Z0L7w4JWWMIkz1bLJPPEfpeg6Gv42VmaRtNwHriEPd8k353vLwaM5
 /b3sM7LdNeYkP7s1RGP+dZJ0s06OwUnAhb9X2ckTffHlVyL1ovu97uvbHZLjCYY/k2yB
 mimEKZwdRi7ScdWTGQf8zD4VLVnwIJn9HOlsMgr2+2CQ2wOs1/nT7a57f2n8W64pLsH6
 V4duYC6ZqwlaEgiKNCSHgxnUgMCwh4jV8vBEhLkn6cCooycRyqhjQ7oWgoZY1+IA5M3H
 b8b2A4Edt584wG2igCvwKDEPlyq9AJFnqZwz1PiwV5I7eXSFZa6CbJLmSSMNWOBESVPY
 mZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f6Dhv5CqQOYQndQIhDjH4EYISmVCA9GVd9cSSXcZ/p4=;
 b=XGyLkKE+ZHaBR7MQido5PLdBidiBgzK0fi1/JgDvxRHBV/11Za9H+p4U9fgfuP6uOw
 nOfMhphUihsO5H7b4jlTDZuUXKaMW0rVQusB2/jEWyn/CWMNLSXIMMvvznlgTGGJWQeO
 VQQawpMCirE/hRMY6L3r6wCVRyltCDcJufkh/tYV2okSRjmYYmCuknoV3CD8LbE5NNqM
 wwLX4KRccAhBPcePNFcmkXnH2rRFtIjFwJn/J3i2mWfn+QAB5agMc8hx2xzTo6N/K2aZ
 lJAbdPxQrPGAO1Q2pgC/ZXa0gd96SNWX/EZ0wH9G0Crlg0hTdoBk1Ahygt+Z0+khpIUK
 asxw==
X-Gm-Message-State: AOAM530iG4hZTxYSYFLVML7TJD5LfNQHAOnxcTCpMPI/n22F1txrAdZb
 EPn8zTuBaYPR9MJAb15BFuXS6A==
X-Google-Smtp-Source: ABdhPJz2/UsyxAXmlYhVZjgHVyydrJYSa6gO05OevE7Cy5PSp7fuRDkxOdQScASf9qei8T7dD657+Q==
X-Received: by 2002:a17:90a:39c6:: with SMTP id
 k6mr17979017pjf.194.1643347555092; 
 Thu, 27 Jan 2022 21:25:55 -0800 (PST)
Received: from localhost.localdomain ([122.171.184.231])
 by smtp.gmail.com with ESMTPSA id b20sm7731744pfv.134.2022.01.27.21.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 21:25:54 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/6] irqchip/riscv-intc: Create domain using named fwnode
Date: Fri, 28 Jan 2022 10:55:01 +0530
Message-Id: <20220128052505.859518-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128052505.859518-1-apatel@ventanamicro.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_212555_948348_BA838822 
X-CRM114-Status: GOOD (  17.94  )
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

We should create INTC domain using a synthetic fwnode which will allow
drivers (such as RISC-V SBI IPI driver, RISC-V timer driver, RISC-V
PMU driver, etc) not having dedicated DT/ACPI node to directly create
interrupt mapping for standard local interrupt numbers defined by the
RISC-V privileged specification.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h      |  2 ++
 arch/riscv/kernel/irq.c           | 13 +++++++++++++
 drivers/clocksource/timer-clint.c | 13 +++++++------
 drivers/clocksource/timer-riscv.c | 11 ++---------
 drivers/irqchip/irq-riscv-intc.c  | 12 ++++++++++--
 drivers/irqchip/irq-sifive-plic.c | 19 +++++++++++--------
 6 files changed, 45 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index e4c435509983..f85ebaf07505 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -12,6 +12,8 @@
 
 #include <asm-generic/irq.h>
 
+extern struct fwnode_handle *riscv_intc_fwnode(void);
+
 extern void __init init_IRQ(void);
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
index 7207fa08d78f..f2fed78ab659 100644
--- a/arch/riscv/kernel/irq.c
+++ b/arch/riscv/kernel/irq.c
@@ -7,9 +7,22 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/seq_file.h>
 #include <asm/smp.h>
 
+static struct fwnode_handle *intc_fwnode;
+
+struct fwnode_handle *riscv_intc_fwnode(void)
+{
+	if (!intc_fwnode)
+		intc_fwnode = irq_domain_alloc_named_fwnode("RISCV-INTC");
+
+	return intc_fwnode;
+}
+EXPORT_SYMBOL_GPL(riscv_intc_fwnode);
+
 int arch_show_interrupts(struct seq_file *p, int prec)
 {
 	show_ipi_stats(p, prec);
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 6cfe2ab73eb0..6e5624989525 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -149,6 +149,7 @@ static int __init clint_timer_init_dt(struct device_node *np)
 	int rc;
 	u32 i, nr_irqs;
 	void __iomem *base;
+	struct irq_domain *domain;
 	struct of_phandle_args oirq;
 
 	/*
@@ -169,14 +170,14 @@ static int __init clint_timer_init_dt(struct device_node *np)
 			       np, i, oirq.args[0]);
 			return -ENODEV;
 		}
-
-		/* Find parent irq domain and map timer irq */
-		if (!clint_timer_irq &&
-		    oirq.args[0] == RV_IRQ_TIMER &&
-		    irq_find_host(oirq.np))
-			clint_timer_irq = irq_of_parse_and_map(np, i);
 	}
 
+	/* Find parent irq domain and map timer irq */
+	domain = irq_find_matching_fwnode(riscv_intc_fwnode(),
+					  DOMAIN_BUS_ANY);
+	if (!clint_timer_irq && domain)
+		clint_timer_irq = irq_create_mapping(domain, RV_IRQ_TIMER);
+
 	/* If CLINT timer irq not found then fail */
 	if (!clint_timer_irq) {
 		pr_err("%pOFP: timer irq not found\n", np);
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..a98f5d18bab9 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -102,7 +102,6 @@ static irqreturn_t riscv_timer_interrupt(int irq, void *dev_id)
 static int __init riscv_timer_init_dt(struct device_node *n)
 {
 	int cpuid, hartid, error;
-	struct device_node *child;
 	struct irq_domain *domain;
 
 	hartid = riscv_of_processor_hartid(n);
@@ -121,14 +120,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (cpuid != smp_processor_id())
 		return 0;
 
-	domain = NULL;
-	child = of_get_compatible_child(n, "riscv,cpu-intc");
-	if (!child) {
-		pr_err("Failed to find INTC node [%pOF]\n", n);
-		return -ENODEV;
-	}
-	domain = irq_find_host(child);
-	of_node_put(child);
+	domain = irq_find_matching_fwnode(riscv_intc_fwnode(),
+					  DOMAIN_BUS_ANY);
 	if (!domain) {
 		pr_err("Failed to find IRQ domain for node [%pOF]\n", n);
 		return -ENODEV;
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index b65bd8878d4f..26ed62c11768 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -112,8 +112,16 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
-					    &riscv_intc_domain_ops, NULL);
+	/*
+	 * Create INTC domain using a synthetic fwnode which will allow
+	 * drivers (such as RISC-V SBI IPI driver, RISC-V timer driver,
+	 * RISC-V PMU driver, etc) not having dedicated DT/ACPI node to
+	 * directly create interrupt mapping for standard local interrupt
+	 * numbers defined by the RISC-V privileged specification.
+	 */
+	intc_domain = irq_domain_create_linear(riscv_intc_fwnode(),
+					       BITS_PER_LONG,
+					       &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 259065d271ef..2c43ab77c014 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -284,6 +284,7 @@ static int __init plic_init(struct device_node *node,
 	u32 nr_irqs;
 	struct plic_priv *priv;
 	struct plic_handler *handler;
+	struct irq_domain *domain;
 
 	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -339,14 +340,6 @@ static int __init plic_init(struct device_node *node,
 			continue;
 		}
 
-		/* Find parent domain and register chained handler */
-		if (!plic_parent_irq && irq_find_host(parent.np)) {
-			plic_parent_irq = irq_of_parse_and_map(node, i);
-			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq,
-							plic_handle_irq);
-		}
-
 		/*
 		 * When running in M-mode we need to ignore the S-mode handler.
 		 * Here we assume it always comes later, but that might be a
@@ -373,6 +366,16 @@ static int __init plic_init(struct device_node *node,
 		nr_handlers++;
 	}
 
+	/* Find parent domain and register chained handler */
+	domain = irq_find_matching_fwnode(riscv_intc_fwnode(),
+					  DOMAIN_BUS_ANY);
+	if (!plic_parent_irq && domain) {
+		plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
+		if (plic_parent_irq)
+			irq_set_chained_handler(plic_parent_irq,
+						plic_handle_irq);
+	}
+
 	/*
 	 * We can have multiple PLIC instances so setup cpuhp state only
 	 * when context handler for current/boot CPU is present.
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
