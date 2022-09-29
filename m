Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F1C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 16:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QPz3B2wN5h4cAleIXYh56l4dCYSo0Go7dCwumxjo4EA=; b=Dd6+ZR9YnqUbLQ
	YTCsYmgyKJ2GO5T+y9tPdGgZrjrcVEmx7nvcrFl94dtryWVdJf1onke4IvE05SYjiYq35PMl4xkBu
	s2ZVSug6VqMeVwOocubULVOAcc07paFhCnMOpMRb5QkjKDemO6nn/JFrpnW3n3Hd6cE+qGhsd3Y4g
	CdfOVVD1ed2mP/q3PosuW8Wsnb44RbBWjLD7zLK2VFUBekmPu1Bd1HXToPU6eAkJjB2w8gQ/Huy7l
	24bszbMEfReQM1ESqjnTLj7caYfcG/HVRYz7Rvbfx2H8LxLzHRX6nSLLHJCj/wdQHSFx1SL0ML04i
	lwsj842ujNKWN22EqzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw5H-0042Ol-67; Thu, 29 Sep 2022 16:08:23 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odw5E-0042NF-2Y
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 16:08:21 +0000
X-QQ-Spam: true
X-QQ-mid: bizesmtp84t1664461982tyvda2ps
Received: from localhost.localdomain ( [113.72.145.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Sep 2022 22:33:00 +0800 (CST)
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
Subject: [PATCH v1 08/30] reset: starfive: jh7100: Use regmap APIs to operate registers
Date: Thu, 29 Sep 2022 22:32:03 +0800
Message-Id: <20220929143225.17907-9-hal.feng@linux.starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:linux.starfivetech.com:qybglogicsvr:qybglogicsvr2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_090820_439015_1B588D5B 
X-CRM114-Status: GOOD (  13.72  )
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

Reset registers address region is shared with clock controller
on the new StarFive JH7110 SoC. Change to use regmap framework
to allow base address sharing and preparation for JH7110 reset
support.

Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
---
 drivers/reset/reset-starfive-jh7100.c | 61 +++++++++++++++------------
 1 file changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
index a6e0945071e9..8cba62348a16 100644
--- a/drivers/reset/reset-starfive-jh7100.c
+++ b/drivers/reset/reset-starfive-jh7100.c
@@ -3,15 +3,14 @@
  * Reset driver for the StarFive JH7100 SoC
  *
  * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ * Copyright (C) 2021-2022 StarFive Technology Co., Ltd.
  */
 
-#include <linux/bitmap.h>
-#include <linux/io.h>
-#include <linux/iopoll.h>
-#include <linux/mod_devicetable.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
-#include <linux/spinlock.h>
 
 #include <dt-bindings/reset/starfive-jh7100.h>
 
@@ -49,9 +48,7 @@ static const u32 jh7100_reset_asserted[4] = {
 
 struct jh7100_reset {
 	struct reset_controller_dev rcdev;
-	/* protect registers against concurrent read-modify-write */
-	spinlock_t lock;
-	void __iomem *base;
+	struct regmap *regmap;
 };
 
 static inline struct jh7100_reset *
@@ -64,31 +61,34 @@ static int jh7100_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
-	unsigned long offset = id / 32;
+	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
-	void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(u32);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u32);
+	u32 reg_assert = JH7100_RESET_ASSERT0 + offset * sizeof(u32);
+	u32 reg_status = JH7100_RESET_STATUS0 + offset * sizeof(u32);
 	u32 done = jh7100_reset_asserted[offset] & mask;
 	u32 value;
-	unsigned long flags;
 	int ret;
 
 	if (!assert)
 		done ^= mask;
 
-	spin_lock_irqsave(&data->lock, flags);
-
-	value = readl(reg_assert);
 	if (assert)
-		value |= mask;
+		ret = regmap_update_bits(data->regmap, reg_assert, mask, mask);
 	else
-		value &= ~mask;
-	writel(value, reg_assert);
+		ret = regmap_update_bits(data->regmap, reg_assert, mask, 0);
+
+	if (ret)
+		return ret;
 
 	/* if the associated clock is gated, deasserting might otherwise hang forever */
-	ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) == done, 0, 1000);
+	ret = regmap_read_poll_timeout_atomic(data->regmap,
+					      reg_status,
+					      value, (value & mask) == done,
+					      0, 1000);
+	if (ret)
+		dev_warn(rcdev->dev, "id:%ld bank:%d, mask:%#x assert:%#x status:%#x ret:%d\n",
+			 id, offset, mask, reg_assert, reg_status, ret);
 
-	spin_unlock_irqrestore(&data->lock, flags);
 	return ret;
 }
 
@@ -120,10 +120,15 @@ static int jh7100_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct jh7100_reset *data = jh7100_reset_from(rcdev);
-	unsigned long offset = id / 32;
+	u32 offset = id / 32;
 	u32 mask = BIT(id % 32);
-	void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(u32);
-	u32 value = readl(reg_status);
+	u32 reg_status = JH7100_RESET_STATUS0 + offset * sizeof(u32);
+	u32 value;
+	int ret;
+
+	ret = regmap_read(data->regmap, reg_status, &value);
+	if (ret)
+		return ret;
 
 	return !((value ^ jh7100_reset_asserted[offset]) & mask);
 }
@@ -143,16 +148,18 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
-	data->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(data->base))
-		return PTR_ERR(data->base);
+	data->regmap = device_node_to_regmap(pdev->dev.of_node);
+	if (IS_ERR(data->regmap)) {
+		dev_err(&pdev->dev, "failed to get regmap (error %ld)\n",
+			PTR_ERR(data->regmap));
+		return PTR_ERR(data->regmap);
+	}
 
 	data->rcdev.ops = &jh7100_reset_ops;
 	data->rcdev.owner = THIS_MODULE;
 	data->rcdev.nr_resets = JH7100_RSTN_END;
 	data->rcdev.dev = &pdev->dev;
 	data->rcdev.of_node = pdev->dev.of_node;
-	spin_lock_init(&data->lock);
 
 	return devm_reset_controller_register(&pdev->dev, &data->rcdev);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
