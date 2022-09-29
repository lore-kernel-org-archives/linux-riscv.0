Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22785C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=osLTi93U6mIFzqNsbkaMv/QuuxJL3BJmrL/uuvuvbtg=; b=ijkCj+bKDJnOc7
	c8o3KvhLGGtqHeOZU6/uut1SBpahj0EImVFdEZRTzwZp77yInbjHV6pmfwRwXgYaELKd9LBdlxvWE
	l/3IAngqJw86wEpybMAtFN8rewZKNDaRGHHOe4YLPR8Dasea40FZ/XZG3nkcT7Ovcv4LMdH6FJeDT
	DYRr5CflTUIi9V37NfOnAmKo1QrBQMAH4qXMgaqb/VxMpmhxUQJ7gc4SoQTh3azdf2N23b6pai8Gt
	2xPkQX2bw57ThKdL6vNq2eZpjTPgaIGLK73a9fd4G3dSdmwtQ5tf6OQqr6/pHKabFY81+RyX4RqIF
	sV7pshD4HSpGRgChG4oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw6E-0042nH-Cy; Thu, 29 Sep 2022 16:09:22 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw6B-0042lN-0i
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:09:20 +0000
X-QQ-Spam: true
X-QQ-mid: bizesmtp84t1664461988tobq0a5b
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:33:07 +0800 (CST)
X-QQ-SSF: 01000000002000201000B00A0000000
From: Hal Feng <hal.feng@linux.starfivetech.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@linux.starfivetech.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 10/30] reset: starfive: Rename 'reset-starfive-jh7100.c' to 'reset-starfive.c'
Date: Thu, 29 Sep 2022 22:32:05 +0800
Message-Id: <20220929143225.17907-11-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_090919_383606_E6E83872 
X-CRM114-Status: GOOD (  17.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

So this reset driver can be compatible with other StarFive SoCs.
No functional change.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 MAINTAINERS                                   |  9 +--
 drivers/reset/Kconfig                         |  6 +-
 drivers/reset/Makefile                        |  2 +-
 ...set-starfive-jh7100.c => reset-starfive.c} | 68 +++++++++----------
 4 files changed, 43 insertions(+), 42 deletions(-)
 rename drivers/reset/{reset-starfive-jh7100.c => reset-starfive.c} (70%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f5ca4aefd184..f2319a3b708b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19411,12 +19411,13 @@ F:	Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
 F:	drivers/pinctrl/pinctrl-starfive.c
 F:	include/dt-bindings/pinctrl/pinctrl-starfive.h
 
-STARFIVE JH7100 RESET CONTROLLER DRIVER
+STARFIVE RESET CONTROLLER DRIVER
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Hal Feng <hal.feng@linux.starfivetech.com>
 S:	Maintained
-F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
-F:	drivers/reset/reset-starfive-jh7100.c
-F:	include/dt-bindings/reset/starfive-jh7100.h
+F:	Documentation/devicetree/bindings/reset/starfive*
+F:	drivers/reset/reset-starfive.c
+F:	include/dt-bindings/reset/starfive*
 
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 806773e88832..8121de5ecc3c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -225,12 +225,12 @@ config RESET_SOCFPGA
 	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
 	  driver gets initialized early during platform init calls.
 
-config RESET_STARFIVE_JH7100
-	bool "StarFive JH7100 Reset Driver"
+config RESET_STARFIVE
+	bool "StarFive SoC Reset Driver"
 	depends on SOC_STARFIVE || COMPILE_TEST
 	default SOC_STARFIVE
 	help
-	  This enables the reset controller driver for the StarFive JH7100 SoC.
+	  This enables the reset controller driver for the StarFive SoCs.
 
 config RESET_SUNPLUS
 	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index cd5cf8e7c6a7..269268a48f56 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -29,7 +29,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
 obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
-obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
+obj-$(CONFIG_RESET_STARFIVE) += reset-starfive.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
 obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive.c
similarity index 70%
rename from drivers/reset/reset-starfive-jh7100.c
rename to drivers/reset/reset-starfive.c
index d3656e99ae0e..56d07bafadd7 100644
--- a/drivers/reset/reset-starfive-jh7100.c
+++ b/drivers/reset/reset-starfive.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Reset driver for the StarFive JH7100 SoC
+ * Reset driver for the StarFive SoC
  *
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  * Copyright (C) 2021-2022 StarFive Technology Co., Ltd.
@@ -36,7 +36,7 @@ static const u32 jh7100_reset_asserted[4] = {
 	0,
 };
 
-struct jh7100_reset {
+struct starfive_reset {
 	struct reset_controller_dev rcdev;
 	struct regmap *regmap;
 	u32 assert_offset;
@@ -45,16 +45,16 @@ struct jh7100_reset {
 	const u32 *asserted;
 };
 
-static inline struct jh7100_reset *
-jh7100_reset_from(struct reset_controller_dev *rcdev)
+static inline struct starfive_reset *
+starfive_reset_from(struct reset_controller_dev *rcdev)
 {
-	return container_of(rcdev, struct jh7100_reset, rcdev);
+	return container_of(rcdev, struct starfive_reset, rcdev);
 }
 
-static int jh7100_reset_update(struct reset_controller_dev *rcdev,
-			       unsigned long id, bool assert)
+static int starfive_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
 {
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
 	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
 	u32 reg_assert = data->assert_offset + offset * sizeof(u32);
@@ -86,34 +86,34 @@ static int jh7100_reset_update(struct reset_controller_dev *rcdev,
 	return ret;
 }
 
-static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
-			       unsigned long id)
+static int starfive_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
 {
-	return jh7100_reset_update(rcdev, id, true);
+	return starfive_reset_update(rcdev, id, true);
 }
 
-static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
-				 unsigned long id)
+static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
 {
-	return jh7100_reset_update(rcdev, id, false);
+	return starfive_reset_update(rcdev, id, false);
 }
 
-static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int starfive_reset_reset(struct reset_controller_dev *rcdev,
+				unsigned long id)
 {
 	int ret;
 
-	ret = jh7100_reset_assert(rcdev, id);
+	ret = starfive_reset_assert(rcdev, id);
 	if (ret)
 		return ret;
 
-	return jh7100_reset_deassert(rcdev, id);
+	return starfive_reset_deassert(rcdev, id);
 }
 
-static int jh7100_reset_status(struct reset_controller_dev *rcdev,
-			       unsigned long id)
+static int starfive_reset_status(struct reset_controller_dev *rcdev,
+				 unsigned long id)
 {
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
 	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
 	u32 reg_status = data->status_offset + offset * sizeof(u32);
@@ -127,16 +127,16 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 	return !((value ^ data->asserted[offset]) & mask);
 }
 
-static const struct reset_control_ops jh7100_reset_ops = {
-	.assert		= jh7100_reset_assert,
-	.deassert	= jh7100_reset_deassert,
-	.reset		= jh7100_reset_reset,
-	.status		= jh7100_reset_status,
+static const struct reset_control_ops starfive_reset_ops = {
+	.assert		= starfive_reset_assert,
+	.deassert	= starfive_reset_deassert,
+	.reset		= starfive_reset_reset,
+	.status		= starfive_reset_status,
 };
 
-static int __init jh7100_reset_probe(struct platform_device *pdev)
+static int __init starfive_reset_probe(struct platform_device *pdev)
 {
-	struct jh7100_reset *data;
+	struct starfive_reset *data;
 	int ret;
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
@@ -171,7 +171,7 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	data->rcdev.ops = &jh7100_reset_ops;
+	data->rcdev.ops = &starfive_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.nr_resets = data->nr_resets;
 	data->rcdev.dev = &pdev->dev;
@@ -182,16 +182,16 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
 }
 
-static const struct of_device_id jh7100_reset_dt_ids[] = {
+static const struct of_device_id starfive_reset_dt_ids[] = {
 	{ .compatible = "starfive,jh7100-reset" },
 	{ /* sentinel */ }
 };
 
-static struct platform_driver jh7100_reset_driver = {
+static struct platform_driver starfive_reset_driver = {
 	.driver = {
-		.name = "jh7100-reset",
-		.of_match_table = jh7100_reset_dt_ids,
+		.name = "starfive-reset",
+		.of_match_table = starfive_reset_dt_ids,
 		.suppress_bind_attrs = true,
 	},
 };
-builtin_platform_driver_probe(jh7100_reset_driver, jh7100_reset_probe);
+builtin_platform_driver_probe(starfive_reset_driver, starfive_reset_probe);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
