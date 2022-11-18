Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D819C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbN0C/hzdTknzzdc87MjfcCmGKx9wyiVWhWfhDdRkkc=; b=r/30AzrPWRL65u
	AgUPkeGsgTa63vQzPR9739CphoJsTwIveCBytamNsWkovBFT07qSuieb4jmQYKaWXrvHwSFRj31DD
	ugFk3OrZ6FNEe4s3riuy2bf/C3qSdQcUkKt9dNF7uL/V9CcKtQwGG6wXWbJZtacAlJ8PEh9gRs7x2
	qxT7OoPV76X4U5Cql2TBg2+dUhgT6tc6QlbNglbxBX6RGvSSzj23aQdZbmsWjJpgfqvvUAYBu7f6R
	jxlaEm5U6YdFzR0ZdFVHxPmMO8hZqyUYJsfJREWy0CROlz5hYn07D3AvGcAkT4Z5D+qBHhSroybGa
	pLoAAIktRpvooKB019/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpr2-00179G-5u; Fri, 18 Nov 2022 01:07:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpqt-00171N-LC
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:07:33 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id D244624E188;
	Fri, 18 Nov 2022 09:06:38 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:38 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:06:38 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
	"Michael Turquette" <mturquette@baylibre.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 13/14] reset: starfive: Add StarFive JH7110 reset driver
Date: Fri, 18 Nov 2022 09:06:26 +0800
Message-ID: <20221118010627.70576-14-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221118010627.70576-1-hal.feng@starfivetech.com>
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_170732_052746_D8BF01AE 
X-CRM114-Status: GOOD (  16.47  )
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

Add auxiliary driver to support StarFive JH7110 system
and always-on resets.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  8 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../reset/starfive/reset-starfive-jh7110.c    | 67 +++++++++++++++++++
 .../reset/starfive/reset-starfive-jh71x0.h    |  7 ++
 4 files changed, 83 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index 9d15c4110e40..fab1a081af17 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -10,3 +10,11 @@ config RESET_STARFIVE_JH7100
 	default SOC_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
+config RESET_STARFIVE_JH7110
+	bool "StarFive JH7110 Reset Driver"
+	depends on AUXILIARY_BUS && CLK_STARFIVE_JH7110_SYS
+	select RESET_STARFIVE_JH71X0
+	default CLK_STARFIVE_JH7110_SYS
+	help
+	  This enables the reset controller driver for the StarFive JH7110 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index f6aa12466fad..7a44b66fb9d5 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -2,3 +2,4 @@
 obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
+obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
new file mode 100644
index 000000000000..00f3b4ecfb02
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ * Copyright (C) 2022 Hal Feng <hal.feng@starfivetech.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+
+#include "reset-starfive-jh71x0.h"
+
+#include <dt-bindings/reset/starfive-jh7110.h>
+
+static int jh7110_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct reset_info *info = (struct reset_info *)(id->driver_data);
+	void __iomem *base = dev_get_drvdata(adev->dev.parent);
+
+	if (!info || !base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
+					      base + info->assert_offset,
+					      base + info->status_offset,
+					      info->asserted,
+					      info->nr_resets,
+					      false);
+}
+
+static const struct reset_info jh7110_sys_info = {
+	.nr_resets = JH7110_SYSRST_END,
+	.assert_offset = 0x2F8,
+	.status_offset = 0x308,
+	.asserted = NULL,
+};
+
+static const struct reset_info jh7110_aon_info = {
+	.nr_resets = JH7110_AONRST_END,
+	.assert_offset = 0x38,
+	.status_offset = 0x3C,
+	.asserted = NULL,
+};
+
+static const struct auxiliary_device_id jh7110_reset_ids[] = {
+	{
+		.name = "clk_starfive_jh71x0.reset-sys",
+		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
+	},
+	{
+		.name = "clk_starfive_jh71x0.reset-aon",
+		.driver_data = (kernel_ulong_t)&jh7110_aon_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
+
+static struct auxiliary_driver jh7110_reset_driver = {
+	.probe		= jh7110_reset_probe,
+	.id_table	= jh7110_reset_ids,
+};
+module_auxiliary_driver(jh7110_reset_driver);
+
+MODULE_DESCRIPTION("StarFive JH7110 Reset Driver");
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index e6b27110de48..63a94ee1b395 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,6 +6,13 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
+struct reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+	const u32 *asserted;
+};
+
 int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u32 *asserted, unsigned int nr_resets,
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
