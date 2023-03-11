Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE2AC74A5B
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Mar 2023 09:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EMc3YAFTN43qoKWhuCnMuVzD6cJxwS2OvXFeBpadhyY=; b=R8lu4RHf4uma3e
	5KVcfciU2rDKEhdEdp84y1C8QXVCjBvidj1JQtnFINGb+JSRR1Ht2kC8SwusO4XebdJdQVpCF6KIp
	SW1OvNjMK6ix9cXsYUbUWf1Mce20Tr2CXIAEXIVQKyk7avwS5HsjdhN3tE2wVOV7QvIXcbzd/uKkn
	wyRSKYsyZ3uFTvhsYBZbfnnj8gTNXRRMuTLNgbQAOJ2AxjJUgjt5v/4FeFb5r2aN6mNzQrM8/MwIe
	MGumF4U61Ve/k9ldDTyJR1lvhn6tLrfxRvekIerIQkAxRoaX2KB+G/hQNQiEqhvBp7y91aOYs7YuS
	mCSlFk6MWRAt9OzKcOTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pavD9-00HYrw-Mk; Sat, 11 Mar 2023 09:08:19 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pavD4-00HYnq-Gu
	for linux-riscv@lists.infradead.org; Sat, 11 Mar 2023 09:08:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 420A624E1B7;
	Sat, 11 Mar 2023 17:07:44 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:44 +0800
Received: from ubuntu.localdomain (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 11 Mar
 2023 17:07:43 +0800
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
Subject: [PATCH v5 09/21] reset: starfive: Rename "jh7100" to "jh71x0" for the common code
Date: Sat, 11 Mar 2023 17:07:21 +0800
Message-ID: <20230311090733.56918-10-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230311090733.56918-1-hal.feng@starfivetech.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_010814_898105_531D07E4 
X-CRM114-Status: GOOD (  14.96  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

For the common code will be shared with the StarFive JH7110 SoC.

Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../reset/starfive/reset-starfive-jh7100.c    |  2 +-
 .../reset/starfive/reset-starfive-jh71x0.c    | 50 +++++++++----------
 .../reset/starfive/reset-starfive-jh71x0.h    |  2 +-
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 9d7cb4ed8869..5f06e5ae3346 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -51,7 +51,7 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	return reset_starfive_jh7100_register(&pdev->dev, pdev->dev.of_node,
+	return reset_starfive_jh71x0_register(&pdev->dev, pdev->dev.of_node,
 					      base + JH7100_RESET_ASSERT0,
 					      base + JH7100_RESET_STATUS0,
 					      jh7100_reset_asserted,
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
index 3577444a89c6..a689f4730ed7 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.c
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Reset driver for the StarFive JH7100 SoC
+ * Reset driver for the StarFive JH71X0 SoCs
  *
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
  */
@@ -15,7 +15,7 @@
 
 #include "reset-starfive-jh71x0.h"
 
-struct jh7100_reset {
+struct jh71x0_reset {
 	struct reset_controller_dev rcdev;
 	/* protect registers against concurrent read-modify-write */
 	spinlock_t lock;
@@ -24,16 +24,16 @@ struct jh7100_reset {
 	const u64 *asserted;
 };
 
-static inline struct jh7100_reset *
-jh7100_reset_from(struct reset_controller_dev *rcdev)
+static inline struct jh71x0_reset *
+jh71x0_reset_from(struct reset_controller_dev *rcdev)
 {
-	return container_of(rcdev, struct jh7100_reset, rcdev);
+	return container_of(rcdev, struct jh71x0_reset, rcdev);
 }
 
-static int jh7100_reset_update(struct reset_controller_dev *rcdev,
+static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
 	unsigned long offset = BIT_ULL_WORD(id);
 	u64 mask = BIT_ULL_MASK(id);
 	void __iomem *reg_assert = data->assert + offset * sizeof(u64);
@@ -62,34 +62,34 @@ static int jh7100_reset_update(struct reset_controller_dev *rcdev,
 	return ret;
 }
 
-static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
+static int jh71x0_reset_assert(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
-	return jh7100_reset_update(rcdev, id, true);
+	return jh71x0_reset_update(rcdev, id, true);
 }
 
-static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
+static int jh71x0_reset_deassert(struct reset_controller_dev *rcdev,
 				 unsigned long id)
 {
-	return jh7100_reset_update(rcdev, id, false);
+	return jh71x0_reset_update(rcdev, id, false);
 }
 
-static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
+static int jh71x0_reset_reset(struct reset_controller_dev *rcdev,
 			      unsigned long id)
 {
 	int ret;
 
-	ret = jh7100_reset_assert(rcdev, id);
+	ret = jh71x0_reset_assert(rcdev, id);
 	if (ret)
 		return ret;
 
-	return jh7100_reset_deassert(rcdev, id);
+	return jh71x0_reset_deassert(rcdev, id);
 }
 
-static int jh7100_reset_status(struct reset_controller_dev *rcdev,
+static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
-	struct jh7100_reset *data = jh7100_reset_from(rcdev);
+	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
 	unsigned long offset = BIT_ULL_WORD(id);
 	u64 mask = BIT_ULL_MASK(id);
 	void __iomem *reg_status = data->status + offset * sizeof(u64);
@@ -98,25 +98,25 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 	return !((value ^ data->asserted[offset]) & mask);
 }
 
-static const struct reset_control_ops jh7100_reset_ops = {
-	.assert		= jh7100_reset_assert,
-	.deassert	= jh7100_reset_deassert,
-	.reset		= jh7100_reset_reset,
-	.status		= jh7100_reset_status,
+static const struct reset_control_ops jh71x0_reset_ops = {
+	.assert		= jh71x0_reset_assert,
+	.deassert	= jh71x0_reset_deassert,
+	.reset		= jh71x0_reset_reset,
+	.status		= jh71x0_reset_status,
 };
 
-int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
+int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u64 *asserted, unsigned int nr_resets,
 				   struct module *owner)
 {
-	struct jh7100_reset *data;
+	struct jh71x0_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->rcdev.ops = &jh7100_reset_ops;
+	data->rcdev.ops = &jh71x0_reset_ops;
 	data->rcdev.owner = owner;
 	data->rcdev.nr_resets = nr_resets;
 	data->rcdev.dev = dev;
@@ -129,4 +129,4 @@ int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_no
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
-EXPORT_SYMBOL_GPL(reset_starfive_jh7100_register);
+EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
index 1fc5a648c8d8..ac9e80dd3f59 100644
--- a/drivers/reset/starfive/reset-starfive-jh71x0.h
+++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
@@ -6,7 +6,7 @@
 #ifndef __RESET_STARFIVE_JH71X0_H
 #define __RESET_STARFIVE_JH71X0_H
 
-int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
+int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
 				   void __iomem *assert, void __iomem *status,
 				   const u64 *asserted, unsigned int nr_resets,
 				   struct module *owner);
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
