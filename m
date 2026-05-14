Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FB8CD4F25
	for <linux-riscv@archiver.kernel.org>; Thu, 14 May 2026 09:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMH065F2qE1SDCT5IdJ5GJw6/KZyG/2Tb9ZjEq6Uyjs=; b=kohzRepveYGVTn
	rwyu3Gooo5Dn/FqAS5DSKMlorVXL9Vn9+g4Gifc9CZW9OEtqHU+9qgxJl8RJpXNNOiXWkpZ26wLe4
	6P2BzXuZAWJNUW+tD5OSlD0RYWUpdjCcoJgDM5mBQS3vD7irhOnahDqVtVmto3Qcb+fmYusFGtW9f
	Jqp9alSGlpB7eQ2GZnQCNSa0Fu5FWbVAandKfcvcfZLeIp602nSmdXjgwKLgdZs3ST9JRdJfNhnn5
	ZGGep2ZxEe1eCvCTqDgDWbxax9xA5HIljlCkrJaVLOKlk79eFgQi5pVJOEVJnviZfW0UOAmp7uqyc
	BrmyIRpXRwpV6TrA0FuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSN5-000000053p3-4A0i;
	Thu, 14 May 2026 09:28:47 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNSN3-000000053ng-2rPw
	for linux-riscv@lists.infradead.org;
	Thu, 14 May 2026 09:28:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1778750922; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g6qUXN3ruByJSFx5QZYqb3piirgMmwoPMc75keSy8gUKz0TpRXR8MNauZI03iTHYbRD3JrW7dyI+tDgnA9U4bx+UjtBVN+6U2s/+gBpf7U/OszX+Xexe6V4/MHEsmDXnQ0vLRSR8SLUaLex2vxnX9Xh8XwW9BLphxkJZvGmMnAA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1778750922; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uM82xqu0AusXULaIJ+x/zNC09+MvS/PQE5kIVt6UpkI=; 
	b=ac/MOn1tZhKQbyEARR4uZZn7CjPWWJan4Xh8m+R/yGgzIV17VNx5bRfMVTMRnnUkVkC90k0B3UrmHgsUOBAxoAS8A+QofumvEO8ljzesuLtZF0eHVRxb8VN0yEVx6YIQ6ltFN5IHXP0bptbYJFluZQx1+ZJx6MkqPHytfgpLVxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778750922;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=uM82xqu0AusXULaIJ+x/zNC09+MvS/PQE5kIVt6UpkI=;
	b=FP9Z8YN8X9eWWvfQL7q60OEecisA5X8VvcCCGdC7Y17sdfl+t+cdAZjuQpBDwsAX
	s7szPO8l14Am8uCH3KcD6XV/oaH0Y5Qng/CVKF3nzXWHaDq9OGyF/SPt05HxP7BGHMN
	UM8bnTTHNLhGNdN2yJQiokGtDhRalQMToQoQjS7E=
Received: by mx.zohomail.com with SMTPS id 1778750920414559.4090568898675;
	Thu, 14 May 2026 02:28:40 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 14 May 2026 17:27:20 +0800
Subject: [PATCH v5 4/6] reset: anlogic: add support for Anlogic DR1V90
 resets
MIME-Version: 1.0
Message-Id: <20260514-dr1v90-cru-v5-4-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778750853; l=6076;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=cTtXPYejpQ6UE0vczng1fEqCuFjSh3psTTgpWrmeTmA=;
 b=bPXAh0O0ScunhxNAnarQORw8vkE7LeGP/QEY4V4bCfvkZxhnYaCgUFHjP9ZscfaVKEgS/xgHl
 QYKbzjjJ0/UDeiPBAY+G0B/togsyP0Z2h+IQiyayHJDLKX3kU6KKIOV
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_022845_759761_38D99D8C 
X-CRM114-Status: GOOD (  17.25  )
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

Add reset controller support for the Anlogic DR1V90 SoC, which is an
auxiliary device associated with the Clock and Reset Unit (CRU). All
resets are active-low.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/reset/Kconfig        |  10 ++++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-dr1v90.c | 140 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 151 insertions(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..0bc1723224a4 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -73,6 +73,16 @@ config RESET_BRCMSTB_RESCAL
 	  This enables the RESCAL reset controller for SATA, PCIe0, or PCIe1 on
 	  BCM7216 or the BCM2712.
 
+config RESET_DR1V90
+	tristate "Anlogic DR1V90 reset controller"
+	depends on ARCH_ANLOGIC || COMPILE_TEST
+	depends on ANLOGIC_DR1V90_CRU
+	select AUXILIARY_BUS
+	default ARCH_ANLOGIC
+	help
+	  This enables the reset controller driver for Anlogic DR1V90 SoCs
+	  provided by the CRU unit.
+
 config RESET_EIC7700
 	bool "Reset controller driver for ESWIN SoCs"
 	depends on ARCH_ESWIN || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..ab2bbc917b73 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_RESET_BCM6345) += reset-bcm6345.o
 obj-$(CONFIG_RESET_BERLIN) += reset-berlin.o
 obj-$(CONFIG_RESET_BRCMSTB) += reset-brcmstb.o
 obj-$(CONFIG_RESET_BRCMSTB_RESCAL) += reset-brcmstb-rescal.o
+obj-$(CONFIG_RESET_DR1V90) += reset-dr1v90.o
 obj-$(CONFIG_RESET_EIC7700) += reset-eic7700.o
 obj-$(CONFIG_RESET_EYEQ) += reset-eyeq.o
 obj-$(CONFIG_RESET_GPIO) += reset-gpio.o
diff --git a/drivers/reset/reset-dr1v90.c b/drivers/reset/reset-dr1v90.c
new file mode 100644
index 000000000000..daa99c797b1a
--- /dev/null
+++ b/drivers/reset/reset-dr1v90.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/reset-controller.h>
+
+#include <dt-bindings/reset/anlogic,dr1v90-cru.h>
+
+struct dr1v90_reset_map {
+	u32 offset;
+	u32 bit;
+};
+
+struct dr1v90_reset_controller {
+	struct reset_controller_dev rcdev;
+	void __iomem *base;
+	spinlock_t lock; /* protect register read-modify-write */
+};
+
+static inline struct dr1v90_reset_controller *
+to_dr1v90_reset_controller(struct reset_controller_dev *rcdev)
+{
+	return container_of(rcdev, struct dr1v90_reset_controller, rcdev);
+}
+
+static const struct dr1v90_reset_map dr1v90_resets[] = {
+	[RESET_OCM]		= { 0x74, BIT(4)},
+	[RESET_QSPI]		= { 0x74, BIT(5)},
+	[RESET_SMC]		= { 0x74, BIT(6)},
+	[RESET_WDT]		= { 0x74, BIT(7)},
+	[RESET_DMAC_AXI]	= { 0x74, BIT(8)},
+	[RESET_DMAC_AHB]	= { 0x74, BIT(9)},
+	[RESET_NPU]		= { 0x74, BIT(12)},
+	[RESET_JPU]		= { 0x74, BIT(13)},
+	[RESET_DDRBUS]		= { 0x74, BIT(14)},
+	[RESET_NIC_HP0]		= { 0x78, BIT(0)},
+	[RESET_NIC_HP1]		= { 0x78, BIT(1)},
+	[RESET_NIC_GP0M]	= { 0x78, BIT(4)},
+	[RESET_NIC_GP1M]	= { 0x78, BIT(5)},
+	[RESET_GPIO]		= { 0x78, BIT(8)},
+	[RESET_IPC]		= { 0x78, BIT(12)},
+	[RESET_USB0]		= { 0x7C, BIT(0)},
+	[RESET_USB1]		= { 0x7C, BIT(1)},
+	[RESET_GBE0]		= { 0x7C, BIT(4)},
+	[RESET_GBE1]		= { 0x7C, BIT(5)},
+	[RESET_SDIO0]		= { 0x7C, BIT(8)},
+	[RESET_SDIO1]		= { 0x7C, BIT(9)},
+	[RESET_UART0]		= { 0x7C, BIT(12)},
+	[RESET_UART1]		= { 0x7C, BIT(13)},
+	[RESET_SPI0]		= { 0x7C, BIT(16)},
+	[RESET_SPI1]		= { 0x7C, BIT(17)},
+	[RESET_CAN0]		= { 0x7C, BIT(20)},
+	[RESET_CAN1]		= { 0x7C, BIT(21)},
+	[RESET_TTC0]		= { 0x7C, BIT(24)},
+	[RESET_TTC1]		= { 0x7C, BIT(25)},
+	[RESET_I2C0]		= { 0x7C, BIT(28)},
+	[RESET_I2C1]		= { 0x7C, BIT(29)}
+};
+
+static int dr1v90_reset_control_update(struct reset_controller_dev *rcdev,
+				       unsigned long id, bool assert)
+{
+	struct dr1v90_reset_controller *rstc = to_dr1v90_reset_controller(rcdev);
+	u32 offset = dr1v90_resets[id].offset;
+	u32 bit = dr1v90_resets[id].bit;
+	u32 reg;
+
+	guard(spinlock_irqsave)(&rstc->lock);
+
+	reg = readl(rstc->base + offset);
+	if (assert)
+		reg &= ~bit;
+	else
+		reg |= bit;
+	writel(reg, rstc->base + offset);
+
+	return 0;
+}
+
+static int dr1v90_reset_control_assert(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, true);
+}
+
+static int dr1v90_reset_control_deassert(struct reset_controller_dev *rcdev,
+					 unsigned long id)
+{
+	return dr1v90_reset_control_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops dr1v90_reset_control_ops = {
+	.assert = dr1v90_reset_control_assert,
+	.deassert = dr1v90_reset_control_deassert,
+};
+
+static int dr1v90_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct dr1v90_reset_controller *rstc;
+	struct device *dev = &adev->dev;
+
+	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
+	if (!rstc)
+		return -ENOMEM;
+
+	spin_lock_init(&rstc->lock);
+
+	rstc->base = dev->platform_data;
+	rstc->rcdev.dev = dev;
+	rstc->rcdev.nr_resets = ARRAY_SIZE(dr1v90_resets);
+	rstc->rcdev.of_node = dev->parent->of_node;
+	rstc->rcdev.ops = &dr1v90_reset_control_ops;
+	rstc->rcdev.owner = THIS_MODULE;
+
+	return devm_reset_controller_register(dev, &rstc->rcdev);
+}
+
+static const struct auxiliary_device_id dr1v90_reset_ids[] = {
+	{
+		.name = "anlogic_dr1_cru.reset"
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, dr1v90_reset_ids);
+
+static struct auxiliary_driver dr1v90_reset_driver = {
+	.probe = dr1v90_reset_probe,
+	.id_table = dr1v90_reset_ids,
+};
+module_auxiliary_driver(dr1v90_reset_driver);
+
+MODULE_AUTHOR("Junhui Liu <junhui.liu@pigmoral.tech>");
+MODULE_DESCRIPTION("Anlogic DR1V90 reset controller driver");
+MODULE_LICENSE("GPL");

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
