Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B8FC0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnfYYA98WT2wuEaptkxtTevCDfrb9EoN/LsOwfLwx/k=; b=LEp/EDXZhkxAEP
	+UBU31IvzU4Gu9/4mO2KrOkDpVQQnQNNJ6QbK2LInvNtJ6x1xTYZjfHFgMNuC2Eb5cPBzQT33d0gt
	ScGM/y3q/sJx+W4GRr0hPrP4FDFBKUmk20lxdmdBMaPY50pRGPoqgRbG27q+ftiG+SpdXWqOfnw39
	yFFvPsqljQcvAVMo+YbMIyVEm46TPEVtjGVYTxjSDzvJo8OoaHk4FxNiuL19o22/CnrkZVSPAmrZS
	MfxBQcso5f8wcNK8l/6kGBkfLlfojOOgQ6t5NijgmZOYWlV8zTLBh35hn9RTzWfJiQ7CfL+nP4dFY
	14npDi/+fZgCa6K30CoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5UO-007GOD-0h;
	Wed, 19 Jul 2023 11:37:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5UK-007GM4-2A
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:37:02 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-68336d06620so6821630b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766620; x=1690371420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIRHWQ6lD8BXcBFSbzuNg2KElD/REbFzMvbhWViQNgU=;
        b=UHVDl9y0ufw0pMuW1Qxl9T2NhZ6bzNkWrPU/ap80f8MTBS49+x2jQAM+9P0MMlLWGU
         6sUmcT5GUWXIgfqFnfx2ydwTCYD3/5bqISvwVPHgNN5ANKlA+PyslMugDQQNx4OKdUcg
         p0utDzgkPrtcsbi1tfUnRVTHfChM9XGu/yL+qkiq1gN9qQlWJA5TrSG/EVspIDdwLin4
         DdimTomTmGoY095hILqSWUYGTytG77ogTEv+AFKLfcFRhYNBNNu18mjGoz3lc+GH+yCk
         4Yg/qugm3rr07SKemzJZ1VzjAeI6fsq2M+x6uvaH0dtsKFD/m7mSkpJHmCwmHJZHwb0h
         N3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766620; x=1690371420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIRHWQ6lD8BXcBFSbzuNg2KElD/REbFzMvbhWViQNgU=;
        b=d6B6gucFaXHQaTAnczdwAxDseJ9z7xBL3SWIDYbL1ipAQqLFiwSg8l48frbA+s6daG
         1R4RPpflqdgPymFSDL6BK3t38IdVrfqo2vwhijE3EVChD8LRRHwNZFA9BWkeB/EjRfid
         NBKeW9tdcAI5pyqPuCzZpCsuBcwMoY5x/VLZRWVSWniD1sX/aZBVV8KaYk7mkYTdKUCy
         MMZdM/YHnZ2GLq/KQ7ZXmPNh2bm+LBd2/WtHpcbYbdsTzZrPwtg/jQjtNW5I+MU6dRbo
         KoHg5f2e4MYKw06nHiLgN2wjmGu9zS/Tm1BgL6wgDKsfqHfVbYiL/jGRwAB3F1CaHMUw
         yueQ==
X-Gm-Message-State: ABy/qLYbM+oznqqNc8lqsDL/Ijkp7YPCUNaKi/JK9D8IHZOqZKV4unS7
	5zifB+OsjYCmCocxmjk7uhl4aw==
X-Google-Smtp-Source: APBJJlGSZb6htFOnlmiTUiG2Fhzbuhr9OsxsL1XU+y2N26KLyhv+WHpDjcEtHQpoDaATFC/8z0VpcA==
X-Received: by 2002:a05:6a20:9496:b0:133:be9d:a9e6 with SMTP id hs22-20020a056a20949600b00133be9da9e6mr14930881pzb.17.1689766619939;
        Wed, 19 Jul 2023 04:36:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:59 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 12/14] irqchip/riscv-aplic: Add support for MSI-mode
Date: Wed, 19 Jul 2023 17:05:40 +0530
Message-Id: <20230719113542.2293295-13-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043700_729472_FB7AA6F7 
X-CRM114-Status: GOOD (  30.72  )
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

The RISC-V advanced platform-level interrupt controller (APLIC) has
two modes of operation: 1) Direct mode and 2) MSI mode.
(For more details, refer https://github.com/riscv/riscv-aia)

In APLIC MSI-mode, wired interrupts are forwared as message signaled
interrupts (MSIs) to CPUs via IMSIC.

We extend the existing APLIC irqchip driver to support MSI-mode for
RISC-V platforms having both wired interrupts and MSIs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/Kconfig                |   6 +
 drivers/irqchip/Makefile               |   1 +
 drivers/irqchip/irq-riscv-aplic-main.c |   2 +-
 drivers/irqchip/irq-riscv-aplic-main.h |   8 +
 drivers/irqchip/irq-riscv-aplic-msi.c  | 285 +++++++++++++++++++++++++
 5 files changed, 301 insertions(+), 1 deletion(-)
 create mode 100644 drivers/irqchip/irq-riscv-aplic-msi.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 8875065d8af9..1a337ab9dd41 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -549,6 +549,12 @@ config RISCV_APLIC
 	depends on RISCV
 	select IRQ_DOMAIN_HIERARCHY
 
+config RISCV_APLIC_MSI
+	bool
+	depends on RISCV_APLIC
+	select GENERIC_MSI_IRQ
+	default RISCV_APLIC
+
 config RISCV_IMSIC
 	bool
 	depends on RISCV
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 7f8289790ed8..47995fdb2c60 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -96,6 +96,7 @@ obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
 obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
 obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
 obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
+obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
 obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
 obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
 obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d62a096774c4..f225ac77ea3c 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -203,7 +203,7 @@ static int aplic_probe(struct platform_device *pdev)
 	 * otherwise setup APLIC direct mode.
 	 */
 	if (fwnode_property_present(dev->fwnode, "msi-parent"))
-		rc = -ENODEV;
+		rc = aplic_msi_setup(dev, regs);
 	else
 		rc = aplic_direct_setup(dev, regs);
 	if (rc) {
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index 474a04229334..78267ec58098 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -41,5 +41,13 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev,
 		     void __iomem *regs);
 int aplic_direct_setup(struct device *dev, void __iomem *regs);
+#ifdef CONFIG_RISCV_APLIC_MSI
+int aplic_msi_setup(struct device *dev, void __iomem *regs);
+#else
+static inline int aplic_msi_setup(struct device *dev, void __iomem *regs)
+{
+	return -ENODEV;
+}
+#endif
 
 #endif
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
new file mode 100644
index 000000000000..086d00e0429e
--- /dev/null
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ */
+
+#include <linux/bitops.h>
+#include <linux/cpu.h>
+#include <linux/interrupt.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/riscv-aplic.h>
+#include <linux/irqchip/riscv-imsic.h>
+#include <linux/module.h>
+#include <linux/msi.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/smp.h>
+
+#include "irq-riscv-aplic-main.h"
+
+static void aplic_msi_irq_unmask(struct irq_data *d)
+{
+	aplic_irq_unmask(d);
+	irq_chip_unmask_parent(d);
+}
+
+static void aplic_msi_irq_mask(struct irq_data *d)
+{
+	aplic_irq_mask(d);
+	irq_chip_mask_parent(d);
+}
+
+static void aplic_msi_irq_eoi(struct irq_data *d)
+{
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+	u32 reg_off, reg_mask;
+
+	/*
+	 * EOI handling only required only for level-triggered
+	 * interrupts in APLIC MSI mode.
+	 */
+
+	reg_off = APLIC_CLRIP_BASE + ((d->hwirq / APLIC_IRQBITS_PER_REG) * 4);
+	reg_mask = BIT(d->hwirq % APLIC_IRQBITS_PER_REG);
+	switch (irqd_get_trigger_type(d)) {
+	case IRQ_TYPE_LEVEL_LOW:
+		if (!(readl(priv->regs + reg_off) & reg_mask))
+			writel(d->hwirq, priv->regs + APLIC_SETIPNUM_LE);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		if (readl(priv->regs + reg_off) & reg_mask)
+			writel(d->hwirq, priv->regs + APLIC_SETIPNUM_LE);
+		break;
+	}
+}
+
+static struct irq_chip aplic_msi_chip = {
+	.name		= "APLIC-MSI",
+	.irq_mask	= aplic_msi_irq_mask,
+	.irq_unmask	= aplic_msi_irq_unmask,
+	.irq_set_type	= aplic_irq_set_type,
+	.irq_eoi	= aplic_msi_irq_eoi,
+#ifdef CONFIG_SMP
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+#endif
+	.flags		= IRQCHIP_SET_TYPE_MASKED |
+			  IRQCHIP_SKIP_SET_WAKE |
+			  IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static int aplic_msi_irqdomain_translate(struct irq_domain *d,
+					 struct irq_fwspec *fwspec,
+					 unsigned long *hwirq,
+					 unsigned int *type)
+{
+	struct aplic_priv *priv = platform_msi_get_host_data(d);
+
+	return aplic_irqdomain_translate(fwspec, priv->gsi_base, hwirq, type);
+}
+
+static int aplic_msi_irqdomain_alloc(struct irq_domain *domain,
+				     unsigned int virq, unsigned int nr_irqs,
+				     void *arg)
+{
+	int i, ret;
+	unsigned int type;
+	irq_hw_number_t hwirq;
+	struct irq_fwspec *fwspec = arg;
+	struct aplic_priv *priv = platform_msi_get_host_data(domain);
+
+	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = platform_msi_device_domain_alloc(domain, virq, nr_irqs);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < nr_irqs; i++) {
+		irq_domain_set_info(domain, virq + i, hwirq + i,
+				    &aplic_msi_chip, priv, handle_fasteoi_irq,
+				    NULL, NULL);
+		/*
+		 * APLIC does not implement irq_disable() so Linux interrupt
+		 * subsystem will take a lazy approach for disabling an APLIC
+		 * interrupt. This means APLIC interrupts are left unmasked
+		 * upon system suspend and interrupts are not processed
+		 * immediately upon system wake up. To tackle this, we disable
+		 * the lazy approach for all APLIC interrupts.
+		 */
+		irq_set_status_flags(virq + i, IRQ_DISABLE_UNLAZY);
+	}
+
+	return 0;
+}
+
+static const struct irq_domain_ops aplic_msi_irqdomain_ops = {
+	.translate	= aplic_msi_irqdomain_translate,
+	.alloc		= aplic_msi_irqdomain_alloc,
+	.free		= platform_msi_device_domain_free,
+};
+
+static void aplic_msi_write_msg(struct msi_desc *desc, struct msi_msg *msg)
+{
+	unsigned int group_index, hart_index, guest_index, val;
+	struct irq_data *d = irq_get_irq_data(desc->irq);
+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
+	struct aplic_msicfg *mc = &priv->msicfg;
+	phys_addr_t tppn, tbppn, msg_addr;
+	void __iomem *target;
+
+	/* For zeroed MSI, simply write zero into the target register */
+	if (!msg->address_hi && !msg->address_lo && !msg->data) {
+		target = priv->regs + APLIC_TARGET_BASE;
+		target += (d->hwirq - 1) * sizeof(u32);
+		writel(0, target);
+		return;
+	}
+
+	/* Sanity check on message data */
+	WARN_ON(msg->data > APLIC_TARGET_EIID_MASK);
+
+	/* Compute target MSI address */
+	msg_addr = (((u64)msg->address_hi) << 32) | msg->address_lo;
+	tppn = msg_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+
+	/* Compute target HART Base PPN */
+	tbppn = tppn;
+	tbppn &= ~APLIC_xMSICFGADDR_PPN_HART(mc->lhxs);
+	tbppn &= ~APLIC_xMSICFGADDR_PPN_LHX(mc->lhxw, mc->lhxs);
+	tbppn &= ~APLIC_xMSICFGADDR_PPN_HHX(mc->hhxw, mc->hhxs);
+	WARN_ON(tbppn != mc->base_ppn);
+
+	/* Compute target group and hart indexes */
+	group_index = (tppn >> APLIC_xMSICFGADDR_PPN_HHX_SHIFT(mc->hhxs)) &
+		     APLIC_xMSICFGADDR_PPN_HHX_MASK(mc->hhxw);
+	hart_index = (tppn >> APLIC_xMSICFGADDR_PPN_LHX_SHIFT(mc->lhxs)) &
+		     APLIC_xMSICFGADDR_PPN_LHX_MASK(mc->lhxw);
+	hart_index |= (group_index << mc->lhxw);
+	WARN_ON(hart_index > APLIC_TARGET_HART_IDX_MASK);
+
+	/* Compute target guest index */
+	guest_index = tppn & APLIC_xMSICFGADDR_PPN_HART(mc->lhxs);
+	WARN_ON(guest_index > APLIC_TARGET_GUEST_IDX_MASK);
+
+	/* Update IRQ TARGET register */
+	target = priv->regs + APLIC_TARGET_BASE;
+	target += (d->hwirq - 1) * sizeof(u32);
+	val = (hart_index & APLIC_TARGET_HART_IDX_MASK)
+				<< APLIC_TARGET_HART_IDX_SHIFT;
+	val |= (guest_index & APLIC_TARGET_GUEST_IDX_MASK)
+				<< APLIC_TARGET_GUEST_IDX_SHIFT;
+	val |= (msg->data & APLIC_TARGET_EIID_MASK);
+	writel(val, target);
+}
+
+int aplic_msi_setup(struct device *dev, void __iomem *regs)
+{
+	const struct imsic_global_config *imsic_global;
+	struct irq_domain *irqdomain;
+	struct aplic_priv *priv;
+	struct aplic_msicfg *mc;
+	phys_addr_t pa;
+	int rc;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	rc = aplic_setup_priv(priv, dev, regs);
+	if (!priv) {
+		dev_err(dev, "failed to create APLIC context\n");
+		return rc;
+	}
+	mc = &priv->msicfg;
+
+	/*
+	 * The APLIC outgoing MSI config registers assume target MSI
+	 * controller to be RISC-V AIA IMSIC controller.
+	 */
+	imsic_global = imsic_get_global_config();
+	if (!imsic_global) {
+		dev_err(dev, "IMSIC global config not found\n");
+		return -ENODEV;
+	}
+
+	/* Find number of guest index bits (LHXS) */
+	mc->lhxs = imsic_global->guest_index_bits;
+	if (APLIC_xMSICFGADDRH_LHXS_MASK < mc->lhxs) {
+		dev_err(dev, "IMSIC guest index bits big for APLIC LHXS\n");
+		return -EINVAL;
+	}
+
+	/* Find number of HART index bits (LHXW) */
+	mc->lhxw = imsic_global->hart_index_bits;
+	if (APLIC_xMSICFGADDRH_LHXW_MASK < mc->lhxw) {
+		dev_err(dev, "IMSIC hart index bits big for APLIC LHXW\n");
+		return -EINVAL;
+	}
+
+	/* Find number of group index bits (HHXW) */
+	mc->hhxw = imsic_global->group_index_bits;
+	if (APLIC_xMSICFGADDRH_HHXW_MASK < mc->hhxw) {
+		dev_err(dev, "IMSIC group index bits big for APLIC HHXW\n");
+		return -EINVAL;
+	}
+
+	/* Find first bit position of group index (HHXS) */
+	mc->hhxs = imsic_global->group_index_shift;
+	if (mc->hhxs < (2 * APLIC_xMSICFGADDR_PPN_SHIFT)) {
+		dev_err(dev, "IMSIC group index shift should be >= %d\n",
+			(2 * APLIC_xMSICFGADDR_PPN_SHIFT));
+		return -EINVAL;
+	}
+	mc->hhxs -= (2 * APLIC_xMSICFGADDR_PPN_SHIFT);
+	if (APLIC_xMSICFGADDRH_HHXS_MASK < mc->hhxs) {
+		dev_err(dev, "IMSIC group index shift big for APLIC HHXS\n");
+		return -EINVAL;
+	}
+
+	/* Compute PPN base */
+	mc->base_ppn = imsic_global->base_addr >> APLIC_xMSICFGADDR_PPN_SHIFT;
+	mc->base_ppn &= ~APLIC_xMSICFGADDR_PPN_HART(mc->lhxs);
+	mc->base_ppn &= ~APLIC_xMSICFGADDR_PPN_LHX(mc->lhxw, mc->lhxs);
+	mc->base_ppn &= ~APLIC_xMSICFGADDR_PPN_HHX(mc->hhxw, mc->hhxs);
+
+	/* Setup global config and interrupt delivery */
+	aplic_init_hw_global(priv, true);
+
+	/* Set the APLIC device MSI domain if not available */
+	if (!dev_get_msi_domain(dev)) {
+		/*
+		 * The device MSI domain for OF devices is only set at the
+		 * time of populating/creating OF device. If the device MSI
+		 * domain is discovered later after the OF device is created
+		 * then we need to set it explicitly before using any platform
+		 * MSI functions.
+		 *
+		 * In case of APLIC device, the parent MSI domain is always
+		 * IMSIC and the IMSIC MSI domains are created later through
+		 * the platform driver probing so we set it explicitly here.
+		 */
+		if (is_of_node(dev->fwnode))
+			of_msi_configure(dev, to_of_node(dev->fwnode));
+	}
+
+	/* Create irq domain instance for the APLIC MSI-mode */
+	irqdomain = platform_msi_create_device_domain(
+						dev, priv->nr_irqs + 1,
+						aplic_msi_write_msg,
+						&aplic_msi_irqdomain_ops,
+						priv);
+	if (!irqdomain) {
+		dev_err(dev, "failed to create MSI irq domain\n");
+		return -ENOMEM;
+	}
+
+	/* Advertise the interrupt controller */
+	pa = priv->msicfg.base_ppn << APLIC_xMSICFGADDR_PPN_SHIFT;
+	dev_info(dev, "%d interrupts forwared to MSI base %pa\n",
+		 priv->nr_irqs, &pa);
+
+	return 0;
+}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
