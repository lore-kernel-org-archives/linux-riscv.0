Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280C6C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Nov 2023 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZEUi2SLlaYnKUoMi3R2fAfOc2p2zXk+2NnseF/nlTQ8=; b=ZcLCT4PGg9nF9B
	T7LRrdKXIJk7HL5VZtpkLyEB52bQ4ZRUi3AxnnGjIA2fPi8wwjg0edbk7Z83kIrLQl2JsR8gJ3LOq
	JNRtNIt0B0RKeYZaWBxr+yVLRFWNRGN2YgM2AA+kfqdJ10txEwM95RXa71pU/dU9Ws9Ia6k8QT2Z9
	6iyKKUWejuaHCSs100/mK3QyNL0FwYbV2zBJMhstRV+24Zi4ZBKPiNzkv/EjLqFRr7pC+dxOvsGzh
	KDdKDq7x20s/V3LUKvbyZ/vYPhY8HGCDR+lC5lenHML9p1/gvoeXAYxTtIjqVllYP/g20Nb4sYxPa
	F6ezMXkG7kS6jXd9Wdgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jRg-00400D-1E;
	Wed, 08 Nov 2023 14:22:16 +0000
Received: from m1563.mail.126.com ([220.181.15.63])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jRc-003zy6-1J
	for linux-riscv@lists.infradead.org;
	Wed, 08 Nov 2023 14:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Date:From:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ETzSHXEE7w/Yufa7DZyCIIqAzyabzEzJwUezfaNJedA=; b=I
	qBRb8AGzeW3c4z1jeW6MVFHDUuiYSFcFaDKSRupgN2YmVvuQI5reiBBzHzHBEoPy
	k3Qen0YPdScP3pKKpYz2veejlcdpqt9L8W/UZfH8BkymcnGlqMAvztSIseIJEgXb
	WLQNFVGwI9NvfHbtzI1qgqTtx/cUFnoZdxsCWSzr6c=
Received: from figure1802$126.com ( [183.193.16.145] ) by
 ajax-webmail-wmsvr63 (Coremail) ; Wed, 8 Nov 2023 22:20:09 +0800 (CST)
X-Originating-IP: [183.193.16.145]
Date: Wed, 8 Nov 2023 22:20:09 +0800 (CST)
From: Ben  <figure1802@126.com>
To: "Anup Patel" <apatel@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Thomas Gleixner" <tglx@linutronix.de>, 
	"Rob Herring" <robh+dt@kernel.org>, 
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, 
	"Frank Rowand" <frowand.list@gmail.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	"Saravana Kannan" <saravanak@google.com>, 
	"Marc Zyngier" <maz@kernel.org>, "Anup Patel" <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
	"Atish Patra" <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, 
	"Andrew Jones" <ajones@ventanamicro.com>
Subject: Re:Re:[PATCH v11 12/14] irqchip/riscv-aplic: Add support for
 MSI-mode
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20230109(dcb5de15)
 Copyright (c) 2002-2023 www.mailtech.cn 126com
In-Reply-To: <22d5d9e9.258.18b97d65ce7.Coremail.figure1802@126.com>
References: <20231023172800.315343-1-apatel@ventanamicro.com>
 <20231023172800.315343-13-apatel@ventanamicro.com>
 <22d5d9e9.258.18b97d65ce7.Coremail.figure1802@126.com>
X-NTES-SC: AL_QuySC/ievEor7yOYZ+kfm08Xhew/XsK1vfkm3I5QN5FwjD3n4xE7X2FoJUnu1MCENR2ViTO8Sz5zwOFVdqtZZr8S8+CyQJdKJrlBrPGvK1p2iw==
MIME-Version: 1.0
Message-ID: <246db5c.5817.18baf4e0ad9.Coremail.figure1802@126.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: P8qowAD3f9MamUtlOHAcAA--.29571W
X-CM-SenderInfo: pilj32bhryija6rslhhfrp/1tbiuR8iXlpECjIOvgACsO
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_062212_953565_3B42157F 
X-CRM114-Status: GOOD (  12.73  )
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




At 2023-11-04 08:58:10, "Ben" <figure1802@126.com> wrote:
>At 2023-10-24 01:27:58, "Anup Patel" <apatel@ventanamicro.com> wrote:
>>The RISC-V advanced platform-level interrupt controller (APLIC) has
>>two modes of operation: 1) Direct mode and 2) MSI mode.
>>(For more details, refer https://github.com/riscv/riscv-aia)
>>
>>In APLIC MSI-mode, wired interrupts are forwared as message signaled
>>interrupts (MSIs) to CPUs via IMSIC.
>>
>>We extend the existing APLIC irqchip driver to support MSI-mode for
>>RISC-V platforms having both wired interrupts and MSIs.
>>
>>Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>>---
>> drivers/irqchip/Kconfig                |   6 +
>> drivers/irqchip/Makefile               |   1 +
>> drivers/irqchip/irq-riscv-aplic-main.c |   2 +-
>> drivers/irqchip/irq-riscv-aplic-main.h |   8 +
>> drivers/irqchip/irq-riscv-aplic-msi.c  | 285 +++++++++++++++++++++++++
>> 5 files changed, 301 insertions(+), 1 deletion(-)
>> create mode 100644 drivers/irqchip/irq-riscv-aplic-msi.c
>>
>>diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
>>index 1996cc6f666a..7adc4dbe07ff 100644
>>--- a/drivers/irqchip/Kconfig
>>+++ b/drivers/irqchip/Kconfig
>>@@ -551,6 +551,12 @@ config RISCV_APLIC
>> 	depends on RISCV
>> 	select IRQ_DOMAIN_HIERARCHY
>> 
>>+config RISCV_APLIC_MSI
>>+	bool
>>+	depends on RISCV_APLIC
>>+	select GENERIC_MSI_IRQ
>>+	default RISCV_APLIC
>>+
>> config RISCV_IMSIC
>> 	bool
>> 	depends on RISCV
>>diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
>>index 7f8289790ed8..47995fdb2c60 100644
>>--- a/drivers/irqchip/Makefile
>>+++ b/drivers/irqchip/Makefile
>>@@ -96,6 +96,7 @@ obj-$(CONFIG_CSKY_MPINTC)		+= irq-csky-mpintc.o
>> obj-$(CONFIG_CSKY_APB_INTC)		+= irq-csky-apb-intc.o
>> obj-$(CONFIG_RISCV_INTC)		+= irq-riscv-intc.o
>> obj-$(CONFIG_RISCV_APLIC)		+= irq-riscv-aplic-main.o irq-riscv-aplic-direct.o
>>+obj-$(CONFIG_RISCV_APLIC_MSI)		+= irq-riscv-aplic-msi.o
>> obj-$(CONFIG_RISCV_IMSIC)		+= irq-riscv-imsic-state.o irq-riscv-imsic-early.o irq-riscv-imsic-platform.o
>> obj-$(CONFIG_SIFIVE_PLIC)		+= irq-sifive-plic.o
>> obj-$(CONFIG_IMX_IRQSTEER)		+= irq-imx-irqsteer.o
>>diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
>>index 87450708a733..d1b342b66551 100644
>>--- a/drivers/irqchip/irq-riscv-aplic-main.c
>>+++ b/drivers/irqchip/irq-riscv-aplic-main.c
>>@@ -205,7 +205,7 @@ static int aplic_probe(struct platform_device *pdev)
>> 		msi_mode = of_property_present(to_of_node(dev->fwnode),
>> 						"msi-parent");
>> 	if (msi_mode)
>>-		rc = -ENODEV;
>>+		rc = aplic_msi_setup(dev, regs);
>> 	else
>> 		rc = aplic_direct_setup(dev, regs);
>> 	if (rc) {
>>diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
>>index 474a04229334..78267ec58098 100644
>>--- a/drivers/irqchip/irq-riscv-aplic-main.h
>>+++ b/drivers/irqchip/irq-riscv-aplic-main.h
>>@@ -41,5 +41,13 @@ void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
>> int aplic_setup_priv(struct aplic_priv *priv, struct device *dev,
>> 		     void __iomem *regs);
>> int aplic_direct_setup(struct device *dev, void __iomem *regs);
>>+#ifdef CONFIG_RISCV_APLIC_MSI
>>+int aplic_msi_setup(struct device *dev, void __iomem *regs);
>>+#else
>>+static inline int aplic_msi_setup(struct device *dev, void __iomem *regs)
>>+{
>>+	return -ENODEV;
>>+}
>>+#endif
>> 
>> #endif
>>diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
>>new file mode 100644
>>index 000000000000..086d00e0429e
>>--- /dev/null
>>+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
>>@@ -0,0 +1,285 @@
>>+// SPDX-License-Identifier: GPL-2.0
>>+/*
>>+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
>>+ * Copyright (C) 2022 Ventana Micro Systems Inc.
>>+ */
>>+
>>+#include <linux/bitops.h>
>>+#include <linux/cpu.h>
>>+#include <linux/interrupt.h>
>>+#include <linux/irqchip.h>
>>+#include <linux/irqchip/riscv-aplic.h>
>>+#include <linux/irqchip/riscv-imsic.h>
>>+#include <linux/module.h>
>>+#include <linux/msi.h>
>>+#include <linux/of_irq.h>
>>+#include <linux/platform_device.h>
>>+#include <linux/printk.h>
>>+#include <linux/smp.h>
>>+
>>+#include "irq-riscv-aplic-main.h"
>>+
>>+static void aplic_msi_irq_unmask(struct irq_data *d)
>>+{
>>+	aplic_irq_unmask(d);
>>+	irq_chip_unmask_parent(d);
>>+}
>>+
>>+static void aplic_msi_irq_mask(struct irq_data *d)
>>+{
>>+	aplic_irq_mask(d);
>>+	irq_chip_mask_parent(d);
>>+}
>>+
>>+static void aplic_msi_irq_eoi(struct irq_data *d)
>>+{
>>+	struct aplic_priv *priv = irq_data_get_irq_chip_data(d);
>>+	u32 reg_off, reg_mask;
>>+
>>+	/*
>>+	 * EOI handling only required only for level-triggered
>>+	 * interrupts in APLIC MSI mode.
>>+	 */
>>+
>>+	reg_off = APLIC_CLRIP_BASE + ((d->hwirq / APLIC_IRQBITS_PER_REG) * 4);
>>+	reg_mask = BIT(d->hwirq % APLIC_IRQBITS_PER_REG);
>>+	switch (irqd_get_trigger_type(d)) {
>>+	case IRQ_TYPE_LEVEL_LOW:
>>+		if (!(readl(priv->regs + reg_off) & reg_mask))
>>+			writel(d->hwirq, priv->regs + APLIC_SETIPNUM_LE);
>>+		break;
>>+	case IRQ_TYPE_LEVEL_HIGH:
>>+		if (readl(priv->regs + reg_off) & reg_mask)
>>+			writel(d->hwirq, priv->regs + APLIC_SETIPNUM_LE);
>>+		break;
>>+	}
>>+}
>>+
>>+static struct irq_chip aplic_msi_chip = {
>>+	.name		= "APLIC-MSI",
>>+	.irq_mask	= aplic_msi_irq_mask,
>>+	.irq_unmask	= aplic_msi_irq_unmask,
>>+	.irq_set_type	= aplic_irq_set_type,
>>+	.irq_eoi	= aplic_msi_irq_eoi,
>>+#ifdef CONFIG_SMP
>>+	.irq_set_affinity = irq_chip_set_affinity_parent,
>>+#endif
>>+	.flags		= IRQCHIP_SET_TYPE_MASKED |
>>+			  IRQCHIP_SKIP_SET_WAKE |
>>+			  IRQCHIP_MASK_ON_SUSPEND,
>>+};
>>+
>>+static int aplic_msi_irqdomain_translate(struct irq_domain *d,
>>+					 struct irq_fwspec *fwspec,
>>+					 unsigned long *hwirq,
>>+					 unsigned int *type)
>>+{
>>+	struct aplic_priv *priv = platform_msi_get_host_data(d);
>>+
>>+	return aplic_irqdomain_translate(fwspec, priv->gsi_base, hwirq, type);
>>+}
>>+
>>+static int aplic_msi_irqdomain_alloc(struct irq_domain *domain,
>>+				     unsigned int virq, unsigned int nr_irqs,
>>+				     void *arg)
>>+{
>>+	int i, ret;
>>+	unsigned int type;
>>+	irq_hw_number_t hwirq;
>>+	struct irq_fwspec *fwspec = arg;
>>+	struct aplic_priv *priv = platform_msi_get_host_data(domain);
>>+
>>+	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base, &hwirq, &type);
>>+	if (ret)
>>+		return ret;
>
>In your patchset, the wired IRQ and IRQ of platform device will go into APLIC-MSI domain firstly.
>Let me assume here is a MSI IRQ not wired IRQ on a device, and it is a platform device in system.
>so in aplic_irqdomain_translate() function, it will parse the APLIC physical IRQ number by fwspec->param[0],
>but this is not a wried IRQ, it is a MSI IRQ, it should not has a APLIC physical IRQ number, the hwirq number should be allocated by MSI bitmap,
>what value will be parse by DTS? zero or negative? 
>
>if this is a nonexistent physical IRQ number for APLIC, in aplic_msi_irq_unmask()->aplic_irq_unmask(), how it works?
>
>writel(d->hwirq, priv->regs + APLIC_SETIENUM);

hi Anup,
Any comments about this question for an MSI interrupt (not wired interrupt) of non-PCI device?

Thanks,
Ben


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
