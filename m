Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB70C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SacLgN/ASyTi27ExpNCVx+3NR7uzqMlei/WSvoj8iek=; b=DP2TqW8KZy0SPJ
	rz65jyniQjfUL0C2sx2sQT7b5ggHL89QDKYRPbl9ebQ38n/Q2iMqQgpXvqJJrpINrc47rtU1OTGIM
	8wV+h0vgRoK2rul6Ce2dcNB7YYulo0HQdg9aUUZsgt+kpCMtrimk/aW2fGn0gqKCccnZpHPehpJb4
	aa5jgLoJZ6J8X/82tyob1Qtcow+rmMDPnaVwJSOrSICU6DRbWeNcCkOaA52uVBKKnraEtE1eynaUV
	MCoY9Elt2mPpEO7pPJiGCJHbfc00HC2SdAebAexKNnG6znY3gy7XeSxM14T5En8lCxAWgs6tMbdtK
	NfoI3aJ7j199lLoGYNow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCknZ-003GLJ-3f; Tue, 03 Jan 2023 17:10:01 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi3o-001rdh-Er
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:38 +0000
Received: by mail-pg1-x52c.google.com with SMTP id e10so6291041pgc.9
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMnEu1L7WFfep+GtEK3XbJoNHy7vRLVmrYxDUF3pXUo=;
        b=SiKPY3h/+9QEDnzkM6/2/4jx9hnsbrjoGkusw+bqIV00BTHZgnJU/z3vR7NH8UkLCX
         MVCfaH2Ullt0x5D0HZZKT5PPk9gnALZQoecgANY7tgYoy/Ek3vzTCVq8IsvkwwyvZaRz
         hfvy8BD5m7FHvUxCJZ2/THWuUht24BdVVooFkzN8qG5HUMd2zejSzHFqjTSzKiAn4SoN
         lPC7iA6xcFKqUTF1vdxfGG4fR9ux91j9f2wtRDYPeIMgm8A4sIhaIxvEy3UKxEMlY1AO
         Yd7DZu3x1fg6Amhv6We8zy4YMbnfOsLahh7dmS7LsFVj9UT8dSZtIJJJegt0uGAJy6lX
         thEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMnEu1L7WFfep+GtEK3XbJoNHy7vRLVmrYxDUF3pXUo=;
        b=mJ9Fx5KZwa5yYRI3Hk8Zo3Vhnsdia7PJCN53yrUb7IE+I86PHAFezeEGZWhy8QICHJ
         IJWXFUwjN2PiY4s6OUEPPiVAnVvLrVqHhMeUJsB0Ke0GnvO8Fb3DQwStg7gb/FiOM2hV
         ry7Vy8x8OCILhuqeLR5i7lCPTdnHpS/9gIVAsH2kRJIVfamOHHa0cVHKe9y8sMWvUbOM
         NR8QgDZK6A0oethQzBpgolfsbuUEptD2/P1MMn4xeXGK2Qvsu0Gsgg73aPXe3OJFdVFn
         SVe9Iog2rhKdgjm/CAnfg4j2kH267th3ArLG7r8DFQF4yR/nQoTXT3Lym+1CATZ33rXj
         xV+A==
X-Gm-Message-State: AFqh2kq2l0jPh5xG4R9TKhHsDPS1UvRIhvK04sFOhsd7jjHmnsxA6LHd
	e6Q99+8pZdcZCSUYtGc1qU6xLQ==
X-Google-Smtp-Source: AMrXdXtXDJqCqs/z8eCUFfnfYZgkufc/9nvHnLgJ8ivBhVDFka0v/ZeE33WoH5DpPi+xlC2/Yvfdxw==
X-Received: by 2002:aa7:99cb:0:b0:580:d188:f516 with SMTP id v11-20020aa799cb000000b00580d188f516mr41042481pfi.19.1672755272500;
        Tue, 03 Jan 2023 06:14:32 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:32 -0800 (PST)
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
Subject: [PATCH v2 3/9] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Tue,  3 Jan 2023 19:44:03 +0530
Message-Id: <20230103141409.772298-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061436_566258_ADC6C9CE 
X-CRM114-Status: GOOD (  15.53  )
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
index f229e3e66387..880d1639aadc 100644
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
 
 static void riscv_intc_irq_eoi(struct irq_data *d)
@@ -115,7 +131,7 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 static int __init riscv_intc_init(struct device_node *node,
 				  struct device_node *parent)
 {
-	int rc;
+	int rc, nr_irqs;
 	unsigned long hartid;
 
 	rc = riscv_of_parent_hartid(node, &hartid);
@@ -133,14 +149,21 @@ static int __init riscv_intc_init(struct device_node *node,
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
@@ -148,7 +171,9 @@ static int __init riscv_intc_init(struct device_node *node,
 
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
