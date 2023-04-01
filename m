Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DD7C77B61
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Apr 2023 11:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ad9Ni6CYS8nztM1HU9F1wdj+wIRjM4jbYFfn+I24Qo4=; b=kcpxAXHprvC7du
	Y/to6hW8sBJN5TbTI7xh7p8Z6FJ1HX/SEluKLwmlFyssqyX/Fx+vWbAul33ieeKTWiVEKxcdVf+Pa
	QgJmyj5YcAE8/756i/p33ka8qZOTw5teGEk043cefp10+Mjf3bECQavWlDY9hyEuUrVmgSJXliY3D
	Vvr+AOgsOhVw66g4aO1My79hkcSOBKBJLGIMgD+ikhNBt69CPklGu0c4AkvDZnJomYU59qD4JdDxO
	3jePIrrQ7x8s6/frQL9UiBcaKYJEv2jvr+KYQwtCW1+SCoqO9D94xrSvSl8dz+TEu83csafJMCWIz
	jHjuHfbc59N+Nn7b6AlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piZHk-00AF52-1q;
	Sat, 01 Apr 2023 11:20:40 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piZHh-00AF2S-28
	for linux-riscv@lists.infradead.org;
	Sat, 01 Apr 2023 11:20:39 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E17E524E178;
	Sat,  1 Apr 2023 19:19:51 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:51 +0800
Received: from ubuntu.localdomain (113.72.144.76) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 1 Apr
 2023 19:19:50 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v7 15/22] reset: starfive: Add StarFive JH7110 reset driver
Date: Sat, 1 Apr 2023 19:19:27 +0800
Message-ID: <20230401111934.130844-16-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230401111934.130844-1-hal.feng@starfivetech.com>
References: <20230401111934.130844-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.76]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230401_042038_027113_340D51D8 
X-CRM114-Status: GOOD (  15.67  )
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

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  8 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../reset/starfive/reset-starfive-jh7110.c    | 70 +++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index 1927a5a3b53a..1fa706a2c3dc 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -10,3 +10,11 @@ config RESET_STARFIVE_JH7100
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7100 SoC.
+
+config RESET_STARFIVE_JH7110
+	bool "StarFive JH7110 Reset Driver"
+	depends on AUXILIARY_BUS && CLK_STARFIVE_JH7110_SYS
+	select RESET_STARFIVE_JH71X0
+	default ARCH_STARFIVE
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
index 000000000000..c1b3a490d951
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JH7110 SoC
+ *
+ * Copyright (C) 2022 StarFive Technology Co., Ltd.
+ */
+
+#include <linux/auxiliary_bus.h>
+
+#include "reset-starfive-jh71x0.h"
+
+#include <dt-bindings/reset/starfive,jh7110-crg.h>
+
+struct jh7110_reset_info {
+	unsigned int nr_resets;
+	unsigned int assert_offset;
+	unsigned int status_offset;
+};
+
+static const struct jh7110_reset_info jh7110_sys_info = {
+	.nr_resets = JH7110_SYSRST_END,
+	.assert_offset = 0x2F8,
+	.status_offset = 0x308,
+};
+
+static const struct jh7110_reset_info jh7110_aon_info = {
+	.nr_resets = JH7110_AONRST_END,
+	.assert_offset = 0x38,
+	.status_offset = 0x3C,
+};
+
+static int jh7110_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
+	void __iomem **base = (void __iomem **)dev_get_drvdata(adev->dev.parent);
+
+	if (!info || !base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
+					      *base + info->assert_offset,
+					      *base + info->status_offset,
+					      NULL,
+					      info->nr_resets,
+					      NULL);
+}
+
+static const struct auxiliary_device_id jh7110_reset_ids[] = {
+	{
+		.name = "clk_starfive_jh7110_sys.rst-sys",
+		.driver_data = (kernel_ulong_t)&jh7110_sys_info,
+	},
+	{
+		.name = "clk_starfive_jh7110_sys.rst-aon",
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
+MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JH7110 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
