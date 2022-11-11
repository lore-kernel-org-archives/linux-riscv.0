Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804EFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnoXiCx91BqzK67d8/WPr78UfgWPlaizq2O4fIkMq64=; b=XU2anr7L+FpRxS
	R0uaxzoZdUQkqcYGitTQ6PZs7jetBXv6vYwt6YjNp52z4flimUC+4COHqaKhl7Sp8u7kFWvT+bWac
	Wi02s/cPquDgKmL6SWi2//F3XYs6T/n4PgN2w/4tGsiM0s7FynT1EwO2wIZK08guMKTZJIecuNyCC
	iO5BcPc/nUwTI/0UnrZYELh571fO3f6NffmssM08b1l7qizZDtJQiOrZO2ZIizHX3KS8DX9wH11il
	qv6kAFIgqLKhZGHSwfWF67WB820YFAO1EbmJhO46v+Fm5XAz57XDWs2da+BBbqrgr6zXtAGhGHw2K
	OGIsp9KyqyheG7u7zcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsj-00Cz5V-Ll; Fri, 11 Nov 2022 04:43:09 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsc-00Cz27-Ax
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:43:06 +0000
Received: by mail-ot1-x335.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so2256527otl.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0whY6CuX4CjDJzLdZou1ftrY3RLAFDBaqvIT3+qCC0=;
        b=ex4g+HVmPtKwUsgRtgBGZc6dEnU40ikO5oUN+/xbjTgKAsQ4AmcA8indPUodHr5bW+
         H/iwZxP/S29A8whf7W6sj+wo/kEJs5SUnXHo7x6EMz0jVaxnuuz+DS0hloWJ1J1FvCO1
         sfAKi08Zhl0viCznsZrsgns2XLwc46Yo92WHpoeAV2SvfqD/K6pEKLlTKGa2RFE/qW5Z
         PlrCBNqwzqyhq6XpEOHfHhpbMCjUFL18t4rKIFiXb9W3y3hrwl0tMhCrYdNBlr3wvmaJ
         ODZV7/7SbguEDMCD2rP9+jJ2/+moHsuMBhEqs3aaKAGc6e0PWSZzJAUC3FJ1R7ntoKZN
         iMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0whY6CuX4CjDJzLdZou1ftrY3RLAFDBaqvIT3+qCC0=;
        b=j+ojxYvnkI+7Lqf4cvGpO0wmZQ3zluAmtIL/eBAc9aip78fiS4MGMNfu6PqoOj7osw
         xNvzX8FKbH7+vrKdwJ8987ERShMQv/lceGDrB+eFIuD2M3TT1JDG4KJiyJIqILhN7sOB
         2gQa83ivlZ4ClPMfniLsjnZ18Eb/aztfgRBdnzwPAdWolppPnwqA3Ost3Bb6IANlZaJi
         +LkxA+27gYpqTLNuf9/6NAvFqJhT/eQyL1Gq0amh46BVOLIFS/l5mgTE0cOxAJDSlBCT
         6txbOvZ+YailYgMir5Dx1xs3i/IhYfhqYlyqfwpjgP9D3W5P674hy3OvgHvNL8xv2FTN
         wS6Q==
X-Gm-Message-State: ANoB5pkleWB2grg2BhU/yNFzSYMNkn9d5Iz+olcG2yRwXhwxsQPYNw/r
	e6iKWYimgaPrdRwz4Wppmvbocg==
X-Google-Smtp-Source: AA0mqf5MndJeJfOoAMW4mJ9r4EwnrWkrc/tZWwYMozRKaabuYjW3ZiXnwST3SGNkMyE30OTKRoJnew==
X-Received: by 2002:a05:6830:20ca:b0:66c:4f87:fd14 with SMTP id z10-20020a05683020ca00b0066c4f87fd14mr454372otq.159.1668141780427;
        Thu, 10 Nov 2022 20:43:00 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:43:00 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/9] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Fri, 11 Nov 2022 10:12:01 +0530
Message-Id: <20221111044207.1478350-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204302_415131_AF73EDB7 
X-CRM114-Status: GOOD (  15.34  )
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

The RISC-V advanced interrupt architecture (AIA) extends the per-HART
local interrupts in following ways:
1. Minimum 64 local interrupts for both RV32 and RV64
2. Ability to process multiple pending local interrupts in same
   interrupt handler
3. Priority configuration for each local interrupts
4. Special CSRs to configure/access the per-HART MSI controller

This patch adds support for RISC-V AIA in the RISC-V intc driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 37 ++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 784d25645704..e72969295241 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -16,6 +16,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <asm/hwcap.h>
 
 static struct irq_domain *intc_domain;
 
@@ -29,6 +30,15 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
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
@@ -38,12 +48,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
 static void riscv_intc_irq_mask(struct irq_data *d)
 {
-	csr_clear(CSR_IE, BIT(d->hwirq));
+	if (d->hwirq < BITS_PER_LONG)
+		csr_clear(CSR_IE, BIT(d->hwirq));
+	else
+		csr_clear(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
 }
 
 static void riscv_intc_irq_unmask(struct irq_data *d)
 {
-	csr_set(CSR_IE, BIT(d->hwirq));
+	if (d->hwirq < BITS_PER_LONG)
+		csr_set(CSR_IE, BIT(d->hwirq));
+	else
+		csr_set(CSR_IEH, BIT(d->hwirq - BITS_PER_LONG));
 }
 
 static struct irq_chip riscv_intc_chip = {
@@ -98,7 +114,7 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int rc;
+	int rc, nr_irqs;
 	unsigned long hartid;
 
 	rc = riscv_of_parent_hartid(node, &hartid);
@@ -116,14 +132,21 @@ static int __init riscv_intc_init(struct device_node *node,
 	if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
 		return 0;
 
-	intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
+	nr_irqs = BITS_PER_LONG;
+	if (riscv_isa_extension_available(NULL, SxAIA) && BITS_PER_LONG == 32)
+		nr_irqs = nr_irqs * 2;
+
+	intc_domain = irq_domain_add_linear(node, nr_irqs,
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
@@ -131,7 +154,9 @@ static int __init riscv_intc_init(struct device_node *node,
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped%s\n",
+		nr_irqs, (riscv_isa_extension_available(NULL, SxAIA)) ?
+			 " using AIA" : "");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
