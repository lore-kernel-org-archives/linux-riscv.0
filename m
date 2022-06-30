Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562EDCCA481
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOM/fZfuChQPT67KcsOhKK4gWWlB8t0gqnB/tc2dftI=; b=UIjcSmpdhAF68o
	UpiB96mNK5qUlJpFo7BjvbYfSeIqjDbUEpjNhaY30yLlYM6HEpnJy1Yt+9seOZ6x9rMKpdBseGjax
	pjNgxXPxmiw/F02z490Na8wdYmdAHUypKrtq3Dn24j6zA7/qbonl3GfWkrJ/ogFPvQicn7oDrJh+8
	d5ORejb7teegVoxCveBxwLB1aEn+ua6tjKFgup5+uOZS/tvEEEsAZeGmKK9g9uFXT5gekw1yynGXr
	wQHjdFmdutuvUf0XlGNRohABlK46ktV7g0QfWi+RSCU5fb7p/kHznezyUjSatOc0HF5GmL5eXqX23
	nMhfQENp7PWhmNDyEf2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDH-00Fumu-M8; Thu, 30 Jun 2022 08:07:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6pDE-00Fujd-5f
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 08:07:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1656576463; x=1688112463;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HOxFG6VMVDpZcOnJ2+A06OSe9i8X+o2QFCu7W2f5pco=;
  b=Lr983uYZ92WL9uSwEIg+79/1lYjqz69hVrEkALlbx3LoHa8v8AkCj10x
   7nuT3JBTMGxgcYoySMIBcTQXrKHtwSMh6VQolsnPXpCBS+uWWoaCRaF3e
   iLFOL3K1ESEGJIr+L8zToYJIJc5pbju7fA+gD6782jRnQEkfMT/JrCI74
   XMf1UVrLgLrX77AXs0wsIJ+YG+N81TArhzG0uP7Y8DawbLZ2m5+YBAysm
   ZTe/wvXE+mk5UZnQL5W+n2oWT1u9UchrNrvEuRV59SB8D6ydMunoqPnQc
   opECYs0BftJ+3tLqp1f55nDxypV8U7//jljEgQSNRt8i3JFRl7tP6yBcN
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,233,1650956400"; 
   d="scan'208";a="102426637"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Jun 2022 01:07:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 30 Jun 2022 01:07:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Thu, 30 Jun 2022 01:07:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor.dooley@microchip.com>, "Nicolas
 Ferre" <nicolas.ferre@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	"Daire McNamara" <daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v1 04/14] reset: add polarfire soc reset support
Date: Thu, 30 Jun 2022 09:05:23 +0100
Message-ID: <20220630080532.323731-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630080532.323731-1-conor.dooley@microchip.com>
References: <20220630080532.323731-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_010744_378804_DBC4FAEF 
X-CRM114-Status: GOOD (  24.47  )
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

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/reset/Kconfig      |   9 +++
 drivers/reset/Makefile     |   2 +-
 drivers/reset/reset-mpfs.c | 145 +++++++++++++++++++++++++++++++++++++
 3 files changed, 155 insertions(+), 1 deletion(-)
 create mode 100644 drivers/reset/reset-mpfs.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 93c8d07ee328..edf48951f763 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -122,6 +122,15 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
+config RESET_POLARFIRE_SOC
+	bool "Microchip PolarFire SoC (MPFS) Reset Driver"
+	depends on AUXILIARY_BUS && MCHP_CLK_MPFS
+	default MCHP_CLK_MPFS
+	help
+	  This driver supports peripheral reset for the Microchip PolarFire SoC
+
+	  CONFIG_RESET_MPFS
+
 config RESET_MESON
 	tristate "Meson Reset Driver"
 	depends on ARCH_MESON || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index a80a9c4008a7..5fac3a753858 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_RESET_K210) += reset-k210.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
+obj-$(CONFIG_RESET_POLARFIRE_SOC) += reset-mpfs.o
 obj-$(CONFIG_RESET_MESON) += reset-meson.o
 obj-$(CONFIG_RESET_MESON_AUDIO_ARB) += reset-meson-audio-arb.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
@@ -38,4 +39,3 @@ obj-$(CONFIG_RESET_UNIPHIER) += reset-uniphier.o
 obj-$(CONFIG_RESET_UNIPHIER_GLUE) += reset-uniphier-glue.o
 obj-$(CONFIG_RESET_ZYNQ) += reset-zynq.o
 obj-$(CONFIG_ARCH_ZYNQMP) += reset-zynqmp.o
-
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
new file mode 100644
index 000000000000..49c47a3e6c70
--- /dev/null
+++ b/drivers/reset/reset-mpfs.c
@@ -0,0 +1,145 @@
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
+/*
+ * Peripheral clock resets
+ */
+
+static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg;
+
+	reg = mpfs_reset_read(rcdev->dev);
+	reg |= (1u << id);
+	mpfs_reset_write(rcdev->dev, reg);
+
+	return 0;
+}
+
+static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg, val;
+
+	reg = mpfs_reset_read(rcdev->dev);
+	val = reg & ~(1u << id);
+	mpfs_reset_write(rcdev->dev, val);
+
+	return 0;
+}
+
+static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	u32 reg = mpfs_reset_read(rcdev->dev);
+
+	return (reg & (1u << id));
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
+		dev_err(rcdev->dev, "Invalid reset index %u\n", reset_spec->args[0]);
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
+	int ret;
+
+	rcdev = devm_kzalloc(dev, sizeof(*rcdev), GFP_KERNEL);
+	if (!rcdev)
+		return -ENOMEM;
+
+	rcdev->dev = dev;
+	rcdev->dev->parent = adev->dev.parent;
+	rcdev->ops = &mpfs_reset_ops;
+	rcdev->of_node = adev->dev.parent->of_node;
+	rcdev->of_reset_n_cells = 1;
+	rcdev->of_xlate = mpfs_reset_xlate;
+	rcdev->nr_resets = MPFS_NUM_RESETS;
+
+	ret = devm_reset_controller_register(dev, rcdev);
+	if (!ret)
+		dev_info(dev, "Registered MPFS reset controller\n");
+
+	return ret;
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
