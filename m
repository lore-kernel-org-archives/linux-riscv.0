Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3577EC021B3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 01:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLmUCSCATyJf5LAFQVs7Y6xE81yz/V2Xnw7mBR6EYcI=; b=AacyiQ1pKfvcog
	JDrVU+CBuu3chf+uYn4cwe67g1IrEI0MnFdydYza+SCQgJY98M7IeJ5ufkEFC3RclIf5z2p21maOK
	M/ouKLdIMDMtMXo7PtZJo1Nd79pcdTioR+27UqJOjgE00hwML03wA7k0Yh/UuelESt6O+ox0i11Bj
	bs+Qwkp39jZy6oI9t4fjGuy19rz8gN1tpnI5Qkj56EU1It2aU7bf2vbuW3JjdypAXASQ3zg8vk8d3
	QXWKC5Xq6CGDuntKjFC23+rBAEhT5sM3yaTUpuJXPuW021ZHBKFBrVSnyCheyAOv1LsbcW6FfIXsu
	uxnIOEjeuANEir531aQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzm-00000003iaX-0CNE;
	Fri, 21 Feb 2025 01:38:26 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlHzj-00000003iYy-3MRZ
	for linux-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 01:38:24 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6e68943a295so13104686d6.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Feb 2025 17:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740101902; x=1740706702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qp1IP5+HElNmeU+NJ4GhzwMTUSG29HHyxLtNo1Dkjg8=;
        b=h1fHPUD3vOViarlmgECmFegqN7uSFPypouOYmZXy2N5tAcRjnihqR2ERe/6foln89n
         VbC16Z9Xd4gNQUsY6f+pPMZtmQzewGoqUwkXhNoj+CXRh0k1rqOvsnwHraZqASnvd/6o
         ymHoBw+uYb0GNbcY/w9943jz2FR3s0X9/6YZeymPfoVc1/cMnvsH3NeuMmmXKQeXNynW
         TpK50gwcmljVTxsZdi61XpywsbxD0njYBigbelO7pPIZzvN/i43LU7niMQTw/vUttrDQ
         vrN5stoLs4TbhlNsWzwEo/LEHuy9nJCbGm6Q+HHCMSFCCJhvBg8odfHb/v/U9OXMkWIR
         FWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740101902; x=1740706702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp1IP5+HElNmeU+NJ4GhzwMTUSG29HHyxLtNo1Dkjg8=;
        b=Np4ZD/19DX9SNIUWkdXaWYVSpQyXIthfJgJX+XE/tQXaWoi5uCvDj86inB/FIj8U9W
         GCIgq8e/hRe/E5Gk0qBWgBmhFqL5GY/GOJmlabi4TeQDlK6QO5htaksQcJRcc+/QpIeL
         RpiKN8FiEEupBW4+gkquDetutWMNNqcokxHzp9ZRjS8X9EkyltmdYyA3fIZqOnGB6tWy
         qmVz8XOhhFkul4ceDBiLlZoSA9sAgaIqiCs4XXoDlDiL0cOYFZepVl5p57namdJNYPW5
         Hih0JQ5aZlOxuN+KRgPsRWQpY17AiAFz5esklVMiiRYdjSGtQEhplQ8NRLqOE6g8VBJX
         kGzw==
X-Forwarded-Encrypted: i=1; AJvYcCUWJAh2/OI8h+l48Rku8RjQvb3Mo3lIMu9iAEuhl1xL5v8yfegXpTqJER+dbVtCSJV53F83eG4AzDy2ww==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbjwwk+fJ72OBzOVe6FzddlWaFEZ6LxOcaaTyltetdOaOiqIEN
	XQY8cCC9Vn/X9r638Id+LdbDLcpgj37fgc9J5nW82h52ggKFAUC9
X-Gm-Gg: ASbGnctEe9tDr2brri5bsb1DYI9AaT+rZybR+2f61s35IzMnKe5TGIqrDrvXy3P7GLQ
	LjSTTPnhfqBmlpU2i1ddh9zJ32QY217WjKF02tOcMyFZlH7GQLmJ2MfzbkysS7vqjWU5g0t0pir
	iXnYd9ikWDb9Gf8zNlFEyLdV7NS9SmeWfrZ/jsyfr4jb+dYuHo/zCbrpka5V5QythS+g2RWeymj
	0B9rx6nSu8RtCOyquIf5kfULuG7ht9RzKQW3X4lFiNwHUZm763TyOSmoKy+yin9rBrtW+lQy2sX
	WA==
X-Google-Smtp-Source: AGHT+IEAbGRWnSOKgLJXuNq9xwDRMgvjuDpj3BpstTmUkHKTNT/40wstmq+MDG9u4VdjZS+bniOt2w==
X-Received: by 2002:a05:6214:d65:b0:6e4:2f90:a9ca with SMTP id 6a1803df08f44-6e6b0036108mr15298496d6.3.1740101902516;
        Thu, 20 Feb 2025 17:38:22 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e65d785ce5sm91783986d6.41.2025.02.20.17.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 17:38:22 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Niklas Cassel <cassel@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] PCI: sophgo-dwc: Add Sophgo SG2044 PCIe driver
Date: Fri, 21 Feb 2025 09:37:56 +0800
Message-ID: <20250221013758.370936-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221013758.370936-1-inochiama@gmail.com>
References: <20250221013758.370936-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_173823_849167_50E48C1B 
X-CRM114-Status: GOOD (  22.48  )
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

Add support for DesignWare-based PCIe controller in SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig          |  10 +
 drivers/pci/controller/dwc/Makefile         |   1 +
 drivers/pci/controller/dwc/pcie-dw-sophgo.c | 282 ++++++++++++++++++++
 3 files changed, 293 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-dw-sophgo.c

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index b6d6778b0698..202014acf260 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -341,6 +341,16 @@ config PCIE_ROCKCHIP_DW_EP
 	  Enables support for the DesignWare PCIe controller in the
 	  Rockchip SoC (except RK3399) to work in endpoint mode.
 
+config PCIE_SOPHGO_DW
+	bool "SOPHGO DesignWare PCIe controller"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on PCI_MSI
+	depends on OF
+	select PCIE_DW_HOST
+	help
+	  Enables support for the DesignWare PCIe controller in the
+	  SOPHGO SoC.
+
 config PCI_EXYNOS
 	tristate "Samsung Exynos PCIe controller"
 	depends on ARCH_EXYNOS || COMPILE_TEST
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index a8308d9ea986..193150056dd3 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -18,6 +18,7 @@ obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o
 obj-$(CONFIG_PCIE_ARMADA_8K) += pcie-armada8k.o
 obj-$(CONFIG_PCIE_ARTPEC6) += pcie-artpec6.o
 obj-$(CONFIG_PCIE_ROCKCHIP_DW) += pcie-dw-rockchip.o
+obj-$(CONFIG_PCIE_SOPHGO_DW) += pcie-dw-sophgo.o
 obj-$(CONFIG_PCIE_INTEL_GW) += pcie-intel-gw.o
 obj-$(CONFIG_PCIE_KEEMBAY) += pcie-keembay.o
 obj-$(CONFIG_PCIE_KIRIN) += pcie-kirin.o
diff --git a/drivers/pci/controller/dwc/pcie-dw-sophgo.c b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
new file mode 100644
index 000000000000..a4ca4f1e26e0
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-dw-sophgo.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * PCIe host controller driver for Sophgo SoCs.
+ *
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/phy/phy.h>
+#include <linux/property.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset.h>
+
+#include "pcie-designware.h"
+
+#define to_sophgo_pcie(x)		dev_get_drvdata((x)->dev)
+
+#define PCIE_INT_SIGNAL			0xc48
+#define PCIE_INT_EN			0xca0
+
+#define PCIE_SIGNAL_INTX_SHIFT		5
+
+#define PCIE_INT_EN_INTX_SHIFT		1
+#define PCIE_INT_EN_INT_SII		BIT(0)
+#define PCIE_INT_EN_INT_INTA		BIT(1)
+#define PCIE_INT_EN_INT_INTB		BIT(2)
+#define PCIE_INT_EN_INT_INTC		BIT(3)
+#define PCIE_INT_EN_INT_INTD		BIT(4)
+#define PCIE_INT_EN_INT_MSI		BIT(5)
+
+struct sophgo_pcie {
+	struct dw_pcie pci;
+	void __iomem *app_base;
+	struct clk_bulk_data *clks;
+	unsigned int clk_cnt;
+	struct reset_control *rst;
+	struct irq_domain *irq_domain;
+};
+
+static int sophgo_pcie_readl_app(struct sophgo_pcie *sophgo, u32 reg)
+{
+	return readl_relaxed(sophgo->app_base + reg);
+}
+
+static void sophgo_pcie_writel_app(struct sophgo_pcie *sophgo, u32 val, u32 reg)
+{
+	writel_relaxed(val, sophgo->app_base + reg);
+}
+
+static void sophgo_pcie_intx_handler(struct irq_desc *desc)
+{
+	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
+	unsigned long hwirq = PCIE_SIGNAL_INTX_SHIFT;
+	unsigned long reg;
+
+	chained_irq_enter(chip, desc);
+
+	reg = sophgo_pcie_readl_app(sophgo, PCIE_INT_SIGNAL);
+
+	for_each_set_bit_from(hwirq, &reg, PCI_NUM_INTX + PCIE_SIGNAL_INTX_SHIFT)
+		generic_handle_domain_irq(sophgo->irq_domain,
+					  hwirq - PCIE_SIGNAL_INTX_SHIFT);
+
+	chained_irq_exit(chip, desc);
+}
+
+static void sophgo_intx_mask(struct irq_data *d)
+{
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&pp->lock, flags);
+
+	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
+	val &= ~BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
+	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
+
+	raw_spin_unlock_irqrestore(&pp->lock, flags);
+};
+
+static void sophgo_intx_unmask(struct irq_data *d)
+{
+	struct dw_pcie_rp *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&pp->lock, flags);
+
+	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
+	val |= BIT(d->hwirq + PCIE_INT_EN_INTX_SHIFT);
+	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
+
+	raw_spin_unlock_irqrestore(&pp->lock, flags);
+};
+
+static void sophgo_intx_eoi(struct irq_data *d)
+{
+}
+
+static struct irq_chip sophgo_intx_irq_chip = {
+	.name			= "INTx",
+	.irq_mask		= sophgo_intx_mask,
+	.irq_unmask		= sophgo_intx_unmask,
+	.irq_eoi		= sophgo_intx_eoi,
+};
+
+static int sophgo_pcie_intx_map(struct irq_domain *domain, unsigned int irq,
+				irq_hw_number_t hwirq)
+{
+	irq_set_chip_and_handler(irq, &sophgo_intx_irq_chip, handle_fasteoi_irq);
+	irq_set_chip_data(irq, domain->host_data);
+
+	return 0;
+}
+
+static const struct irq_domain_ops intx_domain_ops = {
+	.map = sophgo_pcie_intx_map,
+};
+
+static int sophgo_pcie_init_irq_domain(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
+	struct device *dev = sophgo->pci.dev;
+	struct fwnode_handle *intc;
+	int irq;
+
+	intc = device_get_named_child_node(dev, "interrupt-controller");
+	if (!intc) {
+		dev_err(dev, "missing child interrupt-controller node\n");
+		return -ENODEV;
+	}
+
+	irq = fwnode_irq_get(intc, 0);
+	if (irq < 0) {
+		dev_err(dev, "failed to get INTx irq number\n");
+		fwnode_handle_put(intc);
+		return irq;
+	}
+
+	sophgo->irq_domain = irq_domain_create_linear(intc, PCI_NUM_INTX,
+						      &intx_domain_ops, sophgo);
+	fwnode_handle_put(intc);
+	if (!sophgo->irq_domain) {
+		dev_err(dev, "failed to get a INTx irq domain\n");
+		return -EINVAL;
+	}
+
+	return irq;
+}
+
+static void sophgo_pcie_msi_enable(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
+	unsigned long flags;
+	u32 val;
+
+	raw_spin_lock_irqsave(&pp->lock, flags);
+
+	val = sophgo_pcie_readl_app(sophgo, PCIE_INT_EN);
+	val |= PCIE_INT_EN_INT_MSI;
+	sophgo_pcie_writel_app(sophgo, val, PCIE_INT_EN);
+
+	raw_spin_unlock_irqrestore(&pp->lock, flags);
+}
+
+static int sophgo_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	int irq;
+
+	irq = sophgo_pcie_init_irq_domain(pp);
+	if (irq < 0)
+		return irq;
+
+	irq_set_chained_handler_and_data(irq, sophgo_pcie_intx_handler,
+					 pp);
+
+	sophgo_pcie_msi_enable(pp);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops sophgo_pcie_host_ops = {
+	.init = sophgo_pcie_host_init,
+};
+
+static int sophgo_pcie_clk_init(struct sophgo_pcie *sophgo)
+{
+	struct device *dev = sophgo->pci.dev;
+	int ret;
+
+	ret = devm_clk_bulk_get_all_enabled(dev, &sophgo->clks);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+
+	sophgo->clk_cnt = ret;
+
+	return 0;
+}
+
+static int sophgo_pcie_resource_get(struct platform_device *pdev,
+				    struct sophgo_pcie *sophgo)
+{
+	sophgo->app_base = devm_platform_ioremap_resource_byname(pdev, "app");
+	if (IS_ERR(sophgo->app_base))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sophgo->app_base),
+				     "failed to map app registers\n");
+
+	return 0;
+}
+
+static int sophgo_pcie_configure_rc(struct sophgo_pcie *sophgo)
+{
+	struct dw_pcie_rp *pp;
+
+	pp = &sophgo->pci.pp;
+	pp->ops = &sophgo_pcie_host_ops;
+
+	return dw_pcie_host_init(pp);
+}
+
+static int sophgo_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sophgo_pcie *sophgo;
+	int ret;
+
+	sophgo = devm_kzalloc(dev, sizeof(*sophgo), GFP_KERNEL);
+	if (!sophgo)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, sophgo);
+
+	sophgo->pci.dev = dev;
+
+	ret = sophgo_pcie_resource_get(pdev, sophgo);
+	if (ret)
+		return ret;
+
+	ret = sophgo_pcie_clk_init(sophgo);
+	if (ret)
+		return ret;
+
+	return sophgo_pcie_configure_rc(sophgo);
+}
+
+static const struct of_device_id sophgo_pcie_of_match[] = {
+	{ .compatible = "sophgo,sg2044-pcie" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sophgo_pcie_acpi_match);
+
+static const struct acpi_device_id sophgo_pcie_acpi_match[] = {
+	{ "SOPHO000", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sophgo_pcie_acpi_match);
+
+static struct platform_driver sophgo_pcie_driver = {
+	.driver = {
+		.name = "sophgo-dw-pcie",
+		.of_match_table = sophgo_pcie_of_match,
+		.acpi_match_table = sophgo_pcie_acpi_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = sophgo_pcie_probe,
+};
+builtin_platform_driver(sophgo_pcie_driver);
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
