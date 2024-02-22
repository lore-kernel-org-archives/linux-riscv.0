Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A74AC5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rd6HiE2tdRFVBWUfgzxOAcM+Wrox7PsRGesATPVsNYs=; b=iHBeGnJRYlOKdJ
	SwL4HfVfoAnhTwKkcAydS6/Dt8tXY25Vd5kqA2oL1ZwofgvlKNlZGFef2Opn3lSHsTBYyX81fhN0t
	nR7lkHHpS0aoqaCLtMycss6b+3nZajOa5S1qbMGjzqZnmRFYA8kQeP8ib48eLmONWfO6VSyD02YWu
	M468qJ23V/HE70IuKaZRa4zJADmOUuJZnr9hxl295TMoPVyYNxvgvaOh5LdRidab8/4plsGJ4w5u3
	2DvLvUbAB9wRhXJLzqTSpw1Cl91AyQ5ilc6h3K+mJYRdFyenk431nBM5igqCxSSE3VbzzLZH5NOIo
	CCMUjELJESePyo5Q1esQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5as-00000004J9I-1FHj;
	Thu, 22 Feb 2024 09:42:18 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zx-00000004IPr-2OiC
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:41:23 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3c15d1bd5b1so3045357b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594881; x=1709199681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dw8y24wZWNZ04w7x8csHkLTJ35ivq17oSt9+7/D12iY=;
        b=mRJxLRhdBtDLePh31fEhQ+wv1s5PiqXg7TnXV4YMJm1GESE8UjAxm8k7kas7uwHAHi
         rXKHiMY20YQm8xJYd2oDpuw9cMNJ62OXZ3c0WRNQmqEt4IcjFmhlWv8LjxgP+/iWbUX5
         1iUnFypDQaI9eTNFdiv9VcExNRGKVahqhSAXaBdbhvGlCnjySt+0jswGSITb2YW5xv8B
         VT1fmaoOZLFkWH6ydEYWuoYv+MgWtsPtSyKrd6CEwhBtQf9z/hFXlTPyawcfnQifIDBB
         LUDM60s9W503XWjIyV5eNkGELd7VYGT2rLbUVuSltcFUVt9q2wThbEVujLph60o2TDqa
         8eag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594881; x=1709199681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw8y24wZWNZ04w7x8csHkLTJ35ivq17oSt9+7/D12iY=;
        b=gmw5RUjfdrEwNeNLOin56xtllKZS/umphVvva/HfrbUmuMAE2TV5fF8KzTB2pJXdFt
         jQyVTyWuTle6eKSA7iqecRKCpFmm9hPwCotJ9HXG89hsI9Cy06WAF4VvoTwhmrQmhyq3
         xxK3yafhCtqKR8yZunoMXO9x5lJEsNTqPUCJWl6iHJNTMK0gxQpkdHf4nHyTPfWP77HI
         Fc+TJ6nU0SJ8RCmls8PcORvlk7gXUDMIpAF7vvfogP3BIX7FPvietZtZDVWNTTGhLKKo
         05/3FxXAv7VYeg6/d6sWXGFqh9JtbjMeTOySTfXWDBsYVZYxgqB8Q2XsZ0h9oIjMRuYx
         jasw==
X-Forwarded-Encrypted: i=1; AJvYcCWpNW+/rq6StO4x3318pGz62SYjpaqAEBvNm0ZSPV8O5KLe9kj01HcNYTVYKdBWn5qm9CT7JjRWHPg0325CARM/quHwf9Se6QXKwVnGj3py
X-Gm-Message-State: AOJu0YzvtVe+vhoCLl7ooYeV/MaXdQt/xQUtz14xFI7DZkRnIyZcZqoi
	ZF3+tD7K3rlaC5wk/Kc1qpNDEXTI9qOGOlNkgr1p6fdnCgiIKZzuzzIrPmrO6gs=
X-Google-Smtp-Source: AGHT+IEOb1Yx2hf7SfgFjAX4PLImkj9wNrlWxC26sYi3FIjcQ1SGd91HFyROaXeS/Zjiup30flFeDw==
X-Received: by 2002:a05:6808:d47:b0:3c1:8039:f8b9 with SMTP id w7-20020a0568080d4700b003c18039f8b9mr408375oik.21.1708594880741;
        Thu, 22 Feb 2024 01:41:20 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:41:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 08/18] irqchip/riscv-intc: Add support for RISC-V AIA
Date: Thu, 22 Feb 2024 15:09:56 +0530
Message-Id: <20240222094006.1030709-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014121_737268_F16BA79D 
X-CRM114-Status: GOOD (  13.25  )
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

The RISC-V advanced interrupt architecture (AIA) extends the per-HART
local interrupts in following ways:
1. Minimum 64 local interrupts for both RV32 and RV64
2. Ability to process multiple pending local interrupts in same
   interrupt handler
3. Priority configuration for each local interrupts
4. Special CSRs to configure/access the per-HART MSI controller

Add support for #1 and #2 described above in the RISC-V intc driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index e8d01b14ccdd..8997f6986f89 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/smp.h>
+#include <asm/hwcap.h>
 
 static struct irq_domain *intc_domain;
 
@@ -30,6 +31,14 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 	generic_handle_domain_irq(intc_domain, cause);
 }
 
+static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
+{
+	unsigned long topi;
+
+	while ((topi = csr_read(CSR_TOPI)))
+		generic_handle_domain_irq(intc_domain, topi >> TOPI_IID_SHIFT);
+}
+
 /*
  * On RISC-V systems local interrupts are masked or unmasked by writing
  * the SIE (Supervisor Interrupt Enable) CSR.  As CSRs can only be written
@@ -39,12 +48,18 @@ static asmlinkage void riscv_intc_irq(struct pt_regs *regs)
 
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
@@ -115,16 +130,18 @@ static struct fwnode_handle *riscv_intc_hwnode(void)
 
 static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 {
-	int rc;
+	int rc, nr_irqs = riscv_isa_extension_available(NULL, SxAIA) ? 64 : BITS_PER_LONG;
 
-	intc_domain = irq_domain_create_linear(fn, BITS_PER_LONG,
-					       &riscv_intc_domain_ops, NULL);
+	intc_domain = irq_domain_create_linear(fn, nr_irqs, &riscv_intc_domain_ops, NULL);
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
@@ -132,7 +149,8 @@ static int __init riscv_intc_init_common(struct fwnode_handle *fn)
 
 	riscv_set_intc_hwnode_fn(riscv_intc_hwnode);
 
-	pr_info("%d local interrupts mapped\n", BITS_PER_LONG);
+	pr_info("%d local interrupts mapped%s\n", nr_irqs,
+		riscv_isa_extension_available(NULL, SxAIA) ? " using AIA" : "");
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
