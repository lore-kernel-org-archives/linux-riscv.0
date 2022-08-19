Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7807C32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SblnJxK+9//q+YOeZnA+kYpHZuIisnp7fXht1QF1k/k=; b=mM43y9JloP4nQj
	cC/th+wylJaxp3wedMx9ESSWJDq62rbny0phrg3MoqzsgDOfL/Vika8cElCPzS8WepTBYwjP7kB+P
	t8ri+bAa2C3tqiknvFh6Jh1eNqyWKmqIKWsxChdF4m9rC/37e5YmCipDwaEWwLlvPsrcJycWJPJ5W
	dkweSNq6I+xrIMKbmia70LVvFpJWBuQqg5uHIrbJ9aVofzCzr8b1Vkv/eH+Id9p5beQv7BXLi978e
	3y3ZLGA5X1f722f0T7MxmnYmHH6zE24oYry0unusS4TUt+68d6gVUi5HLQneL55P2scZahmc2xSI9
	+H71pFvnCXKbsT5NQK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiW-005JGO-Nz; Fri, 19 Aug 2022 09:55:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOyiK-005J5P-2g
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 09:54:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660902893; x=1692438893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+Af5JAEyadJZYsDa26MITcZUUd/oFSC8ZRLQM82MN5E=;
  b=01Rvqf0jX/lz6HFhtlYKD38UA21+OZRAZQOTTTFxpEqkJWW496tIW+Vo
   8Sx5RbaFO3JyaiIS8SiV++r6EcFTtR321pxsqmg79qH5e6R4pcz2SF1Sw
   DttHZSc+n6JmXTYiXW0Sfunm5zNgovQGNRI4iqmS88CGIH/UTTpdayQmU
   NCPNATkL1hc6AkoNkN9HsHl3v0STcS3LXX01k22nHcR7W8B7JjO4C+wKV
   Vc2ih0j2vWidbmJQqI4skkRBfD+sxwxQ3yK9bWLFMWNxpXBRmwxHNE8iO
   VgF6q0iCf6gdgoBnwuL8M+cBwFUtmlgXrDOb9srhvXatUv4S7tLysRHis
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="176906872"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 02:54:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 02:54:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 02:54:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Daire McNamara <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 04/13] reset: add polarfire soc reset support
Date: Fri, 19 Aug 2022 10:53:12 +0100
Message-ID: <20220819095320.40006-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819095320.40006-1-conor.dooley@microchip.com>
References: <20220819095320.40006-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_025452_205600_1360D183 
X-CRM114-Status: GOOD (  26.03  )
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

Add support for the resets on Microchip's PolarFire SoC (MPFS).
Reset control is a single register, wedged in between registers for
clock control. To fit with existed DT etc, the reset controller is
created using the aux device framework & set up in the clock driver.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/reset/Kconfig      |   7 ++
 drivers/reset/Makefile     |   2 +-
 drivers/reset/reset-mpfs.c | 157 +++++++++++++++++++++++++++++++++++++
 3 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 drivers/reset/reset-mpfs.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 806773e88832..85f7abde3766 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -152,6 +152,13 @@ config RESET_PISTACHIO
 	help
 	  This enables the reset driver for ImgTec Pistachio SoCs.
 
+config RESET_POLARFIRE_SOC
+	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
+	depends on AUXILIARY_BUS && MCHP_CLK_MPFS
+	default MCHP_CLK_MPFS
+	help
+	  This driver supports peripheral reset for the Microchip PolarFire SoC
+
 config RESET_QCOM_AOSS
 	tristate "Qcom AOSS Reset Driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index cd5cf8e7c6a7..3e7e5fd633a8 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -22,6 +22,7 @@ obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_OXNAS) += reset-oxnas.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
+obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
 obj-$(CONFIG_RESET_QCOM_AOSS) += reset-qcom-aoss.o
 obj-$(CONFIG_RESET_QCOM_PDC) += reset-qcom-pdc.o
 obj-$(CONFIG_RESET_RASPBERRYPI) += reset-raspberrypi.o
@@ -40,4 +41,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
-
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
new file mode 100644
index 000000000000..1580d1b68d61
--- /dev/null
+++ b/drivers/reset/reset-mpfs.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PolarFire SoC (MPFS) Peripheral Clock Reset Controller
+ *
+ * Author: Conor Dooley <conor.dooley@microchip.com>
+ * Copyright (c) 2022 Microchip Technology Inc. and its subsidiaries.
+ *
+ */
+#include <linux/auxiliary_bus.h>
+#include <linux/delay.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/microchip,mpfs-clock.h>
+#include <soc/microchip/mpfs.h>
+
+/*
+ * The ENVM reset is the lowest bit in the register & I am using the CLK_FOO
+ * defines in the dt to make things easier to configure - so this is accounting
+ * for the offset of 3 there.
+ */
+#define MPFS_PERIPH_OFFSET	CLK_ENVM
+#define MPFS_NUM_RESETS		30u
+#define MPFS_SLEEP_MIN_US	100
+#define MPFS_SLEEP_MAX_US	200
+
+/* block concurrent access to the soft reset register */
+static DEFINE_SPINLOCK(mpfs_reset_lock);
+
+/*
+ * Peripheral clock resets
+ */
+
+static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&mpfs_reset_lock, flags);
+
+	reg = mpfs_reset_read(rcdev->dev);
+	reg |= BIT(id);
+	mpfs_reset_write(rcdev->dev, reg);
+
+	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
+
+	return 0;
+}
+
+static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	unsigned long flags;
+	u32 reg, val;
+
+	spin_lock_irqsave(&mpfs_reset_lock, flags);
+
+	reg = mpfs_reset_read(rcdev->dev);
+	val = reg & ~BIT(id);
+	mpfs_reset_write(rcdev->dev, val);
+
+	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
+
+	return 0;
+}
+
+static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg = mpfs_reset_read(rcdev->dev);
+
+	/*
+	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
+	 * is never hit.
+	 */
+	return (reg & BIT(id));
+}
+
+static int mpfs_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	mpfs_assert(rcdev, id);
+
+	usleep_range(MPFS_SLEEP_MIN_US, MPFS_SLEEP_MAX_US);
+
+	mpfs_deassert(rcdev, id);
+
+	return 0;
+}
+
+static const struct reset_control_ops mpfs_reset_ops = {
+	.reset = mpfs_reset,
+	.assert = mpfs_assert,
+	.deassert = mpfs_deassert,
+	.status = mpfs_status,
+};
+
+static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
+			    const struct of_phandle_args *reset_spec)
+{
+	unsigned int index = reset_spec->args[0];
+
+	/*
+	 * CLK_RESERVED does not map to a clock, but it does map to a reset,
+	 * so it has to be accounted for here. It is the reset for the fabric,
+	 * so if this reset gets called - do not reset it.
+	 */
+	if (index == CLK_RESERVED) {
+		dev_err(rcdev->dev, "Resetting the fabric is not supported\n");
+		return -EINVAL;
+	}
+
+	if (index < MPFS_PERIPH_OFFSET || index >= (MPFS_PERIPH_OFFSET + rcdev->nr_resets)) {
+		dev_err(rcdev->dev, "Invalid reset index %u\n", index);
+		return -EINVAL;
+	}
+
+	return index - MPFS_PERIPH_OFFSET;
+}
+
+static int mpfs_reset_probe(struct auxiliary_device *adev,
+			    const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct reset_controller_dev *rcdev;
+
+	rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
+	if (!rcdev)
+		return -ENOMEM;
+
+	rcdev->dev = dev;
+	rcdev->dev->parent = dev->parent;
+	rcdev->ops = &mpfs_reset_ops;
+	rcdev->of_node = dev->parent->of_node;
+	rcdev->of_reset_n_cells = 1;
+	rcdev->of_xlate = mpfs_reset_xlate;
+	rcdev->nr_resets = MPFS_NUM_RESETS;
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
+static const struct auxiliary_device_id mpfs_reset_ids[] = {
+	{
+		.name = "clk_mpfs.reset-mpfs",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
+
+static struct auxiliary_driver mpfs_reset_driver = {
+	.probe		= mpfs_reset_probe,
+	.id_table	= mpfs_reset_ids,
+};
+
+module_auxiliary_driver(mpfs_reset_driver);
+
+MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
+MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(MCHP_CLK_MPFS);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
