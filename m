Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF53EE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm5/I63Ctg4GWFOHm6z/fIugiOkYXtGdPZrus4BFSr8=; b=2M5KswGzzuZzBd
	V7BUlh0RGAHsxpv+O891xXBZSv3UjcyvXrs1bkgI1skCfFIOQFj5pGVMNlCkjrUOtRtcyykKkQjRE
	kCwEcBs1/wx/SIfNPrtILYFE2v4+gyrZHN4x5t2LD+8u5Wc4u/pdz/Gczd23S2snmHGHYyoJgt55f
	t0vtPwpnEjt0SWlfLAW3uN6epkhBv86PtVHKSDdHuDig+9kB/he9c6rlI5Vl8npLM7VJcDjIqFmv3
	QcbivhWSJxwK9DETiIVFo2YhdlumgDaGXfVLgIaHZAAB1Uj+0H9L8WvlB7rcQrQ+WMgFelFeZz5Qg
	trIq4UN4nbeTgHt4WDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XW-003vwk-1v;
	Tue, 12 Sep 2023 17:51:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7XU-003vti-2B
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:51:06 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf57366ccdso580095ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541061; x=1695145861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKnkNq9mHXbpDqEgJF2mGpUUpQc6aLvqIlFOdqDcBBw=;
        b=faks5Yte/GQcLHBnlMgJDIHoU9SKqmPMav9vBFMc3AQhO2dvf6VSx8j12RLr5FfTIW
         1GVmu1qDmNXtux4uxed4KoeReS1ksXeJ9Und2F2bB9pXigY9v7KYK5MxQiFvS7eAZrq6
         MHZfNwSJPep+dBrn/802VPIVM+6d+Vgm1VHFaUO9yvHef/ftX28KgNKCt/mM1drtex6C
         gYsJPkF6zwz5l0E1UQg6AnEW8WM1TcyfbChmAln69vlbExOu5stZ+zHAYfbzxg6bSqx2
         xgFtr3wBhgq4auVR/ZpKfSBplvTf+sFVFqrVQVTzfN5IgBrv4qGs7Ywj/1T17gMXmRoG
         82nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541061; x=1695145861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKnkNq9mHXbpDqEgJF2mGpUUpQc6aLvqIlFOdqDcBBw=;
        b=Np/rkYCAkXUTpCYkbzWAy95/vYMHL18p6BtyIwDR7Msb5tbc27+kpxWw9jEjbII9l+
         XOv40cexCYW8v1s6J7D8pZ1uqMPJ95hEwwbG6+uPL7fcKsDitetDPyeB1I1JC7KB21YX
         bFGhapvCLeLtz+fXjJdr2ewMG+JeXMbEy6uq/WCeEQ0gXCEJH57L6MvwtQCT2Uy63/7k
         TmpWQlViXVMPfFDh0kZ26vD/tI2sZ3/myLskP2q9y+yojTbVp/eAsZYH3VBZnzqcAMGw
         SvjNeIZyEuVohHcR5tWYte1eNxnwn0j6yJ5VVPV5QTSTjbCOtgtizLAVUJF5JeqRfWF/
         z30A==
X-Gm-Message-State: AOJu0YwBZC+RLhoDw2Auj85zGdEqOapcGY+xn9EOJxAVmJ56bQfuhq92
	3Mg34eZ/dkwcOtBPn+PJ8F9iNQ==
X-Google-Smtp-Source: AGHT+IEdBdHH9Btet5Ich4bV21wPWcrSfaR/35rHv6Xb+ixcfghTnrQH+Q3+fa97LNZiXr4guWt+zQ==
X-Received: by 2002:a17:903:22c7:b0:1bc:4415:3c1 with SMTP id y7-20020a17090322c700b001bc441503c1mr4832136plg.7.1694541061020;
        Tue, 12 Sep 2023 10:51:01 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:51:00 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 07/16] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Tue, 12 Sep 2023 23:19:19 +0530
Message-Id: <20230912174928.528414-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105104_717715_CF7BC22C 
X-CRM114-Status: GOOD (  15.41  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V advanced interrupt architecture (AIA) extends the per-HART
local interrupts in following ways:
1. Minimum 64 local interrupts for both RV32 and RV64
2. Ability to process multiple pending local interrupts in same
   interrupt handler
3. Priority configuration for each local interrupts
4. Special CSRs to configure/access the per-HART MSI controller

We add support for #1 and #2 described above in the RISC-V intc driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 34 ++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4e2704bc25fb..1a0fc87152c5 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <asm/hwcap.h>
 
 static struct irq_domain *intc_domain;
 
@@ -30,6 +31,15 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 	generic_handle_domain_irq(intc_domain, cause);
 }
 
+static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
+{
+	unsigned long topi;
+
+	while ((topi = csr_read(CSR_TOPI)))
+		generic_handle_domain_irq(intc_domain,
+					  topi >> TOPI_IID_SHIFT);
+}
+
 /*
  * On RISC-V systems local interrupts are masked or unmasked by writing
  * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
@@ -39,12 +49,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
 static void riscv_intc_irq_mask(struct irq_data *d)
 {
-	csr_clear(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_clear(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_clear(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_unmask(struct irq_data *d)
 {
-	csr_set(CSR_IE, BIT(d->hwirq));
+	if (IS_ENABLED(CONFIG_32BIT) && d->hwirq >= BITS_PER_LONG)
+		csr_set(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
+	else
+		csr_set(CSR_IE, BIT(d->hwirq));
 }
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
@@ -115,16 +131,20 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 
 static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
-	int rc;
+	int rc, nr_irqs = riscv_isa_extension_available(NULL, SxAIA) ?
+			  64 : BITS_PER_LONG;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
+	intc_domain = irq_domain_create_linear(fn, nr_irqs,
 					       &riscv_intc_domain_ops, NULL);
 	if (!intc_domain) {
 		pr_err("unable to add IRQ domain\n");
 		return -ENXIO;
 	}
 
-	rc = set_handle_irq(&riscv_intc_irq);
+	if (riscv_isa_extension_available(NULL, SxAIA))
+		rc = set_handle_irq(&riscv_intc_aia_irq);
+	else
+		rc = set_handle_irq(&riscv_intc_irq);
 	if (rc) {
 		pr_err("failed to set irq handler\n");
 		return rc;
@@ -132,7 +152,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped%s\n",
+		nr_irqs, riscv_isa_extension_available(NULL, SxAIA) ?
+			 " using AIA" : "");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
