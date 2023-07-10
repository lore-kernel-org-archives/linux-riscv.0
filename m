Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469B4EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soQe+8wXvupTLGAtqL3l3m43Ycdg5gYa+oxa/nMKi9E=; b=kQTjHdVydz/LA7
	hfSqFaJktTyz4Px2yR8fgy0SHRHe6IFfv6tsW2pkB6Yx+pSzAOdfJqy0f1t4DKvf/ap86e8F/9Fda
	WB1HCtCk9swa92At3xWZZbI60VvH+MSXPnXqxnuroRR8xTRXWS2IOTtqa1EVNu2IqS0BdsfdbmNKj
	+XC/j8XjNWR7suv58ZRBNEFOhPUGRNjvoHeE6Z6xI4Rd1IfflWb0GF5FlmkmXJxCDQlYdfntznCpI
	HjDsCpZgRrStRvwmi7+lNdUTRJPw4jMCbYWpAv76PdYLdcNPoz7u95of0w92UkscdYqHJT6f+ZS4M
	QMAptgQZHN61CIFneJmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQz-00B57c-0R;
	Mon, 10 Jul 2023 09:43:57 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInQw-00B55g-1b
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:43:55 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-78374596182so213703039f.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Jul 2023 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1688982232; x=1691574232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXSsvlQ/R6yHM0Hz/nbqBTRJ+migXFNIKunDjIZh+EE=;
        b=W/of7M624lty1wnoYq2AEd8m6M/KJ2u+uFQsUmtTpS50lkX1mksFm1FF5vcO1pWyZj
         xyZSuo6XsQozWpsz8wvW2dGylYfwwi6Xxx/2iqxH+rhf3Na64EivLBq50b6jQmgOsEcW
         PpSKzmM3OKO+rcyZHvfD4RlVGPHN94F59v5oBbcRv381JFtmEyzQ5Xij4MBPhGIuMDjW
         tReZsODNXa3NudsL5yhXPFj9NjjOyJcql86MO0x13wu/D/Z//ItyNqxqhqPMlr2O7t/M
         XBnWb9YMUym97gSAJFEzaU8PVfVSRHbXzlDk9spe5Gk604RvBZUToV/TtMQrRSROw0M7
         FFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688982232; x=1691574232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XXSsvlQ/R6yHM0Hz/nbqBTRJ+migXFNIKunDjIZh+EE=;
        b=hJ3vZ0Nrw/ejCOt1hZ77qUjOcikZA+hAmxr64VUnpK3aZaiAfqcuUC80Od/QBfnY9m
         B/5XnFaElXFdFzf35td2loEzeEjOwxyeiAnI10joex30AxrRCG/gg3Zpj5qNoJ0TCebJ
         ge7zLOKHvawJZezjMDRabqURB1mqMI6sriFVUbwQIdhoovv+B9rTfNCdzLCpo8NeaFdb
         7i9n1n7aJRkB6JQFq1vBJu7ynm5TtcUs//by6DEpZJrKs7ehBd7D9LZOHCSl9axHYvDI
         UO/IQU010XZTt5327+O7NX8vRWYjlCq4nRckRvtXbcStmDafextpDBx3O40drbhn8BUS
         Sfsg==
X-Gm-Message-State: ABy/qLZ8hCbA7pkquCcqyuwL4HCtz7PVoatIkLff7HvlQZCpzrc6yLTW
	jagTFo5oIRs2W1L1+8nFK/6dEw==
X-Google-Smtp-Source: APBJJlF+I80RYaN2WMHLcsN/9T5/HGm+CHwRryl4eQj0HMo93xFCdJg54YKQO8Y2dqiU0aMU4FHSkg==
X-Received: by 2002:a6b:7904:0:b0:786:cc36:360c with SMTP id i4-20020a6b7904000000b00786cc36360cmr10770193iop.8.1688982232246;
        Mon, 10 Jul 2023 02:43:52 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k1-20020a6b7a41000000b007870c56387dsm936938iop.49.2023.07.10.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 02:43:51 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 2/9] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Mon, 10 Jul 2023 15:13:14 +0530
Message-Id: <20230710094321.1378351-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230710094321.1378351-1-apatel@ventanamicro.com>
References: <20230710094321.1378351-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_024354_537655_FA9200DF 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
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
 drivers/irqchip/irq-riscv-intc.c | 36 ++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..e235bf1708a4 100644
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
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
@@ -115,16 +131,22 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 
 static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
-	int rc;
+	int rc, nr_irqs = BITS_PER_LONG;
+
+	if (riscv_isa_extension_available(NULL, SxAIA) && BITS_PER_LONG == 32)
+		nr_irqs = nr_irqs * 2;
 
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
@@ -132,7 +154,9 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
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
