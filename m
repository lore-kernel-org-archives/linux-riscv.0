Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 988E7CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 17:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMbJwndMP6Z/bi2ENFTAt0aXSPLweIuKzZaPTzeTCwM=; b=WhlnGQ/TcWUPkj
	/xil6KOZd0u8RO+PCTCETiUCOivexOu8/EYtOS6VuedaH9EkOlKw8QI3etYOPMsOuZR1xpE2wYfhJ
	0/BU6po43rLFIdK10kBAOKp7JSZBrnZopfqOlwhoJW/rqNqIPvY7HyfVRrDL3CSSWC3gTllEHgqx4
	1kfwXSvyI/RNHfmRmIoRPy0I4avYb5p/p5y/UkYHUPbcMp1cxRY2ZakUWRErA9zg97PIa50ZnRsI4
	HXIN9AV8uhnchGHIBXqKo+yggcZXuRL8KywZM6+bPEYaYV+OSTFh/LjYoiCMAukQmFuEx67Dvc2Uz
	qK//Vil1wfXsZnZfB9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeK-0000000E4pZ-2mbp;
	Mon, 13 Oct 2025 17:47:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8MeJ-0000000E4oP-2QQw
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 17:47:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9CF486147B;
	Mon, 13 Oct 2025 17:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CA9AC4CEE7;
	Mon, 13 Oct 2025 17:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760377674;
	bh=gYIW6qM4II8bzUyw/0Yitdmt2pkZmG4mm0A5gjVISyQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fCDCoNa5eT+TgBGOQfI6f13AjT85WIkf0+Gyb28RA3CP0XMSxKW63uFqspFNqhPQJ
	 khNDIJpZfNLI+d40S/fMC6QDhnTWGaftOUCKvYhd56/O6YWVmj4D9bx0nxcFZDVLQ6
	 uO9tQYZ1GrJIQbRQQ8jKLSApWOq6ekuVjkNc0FNideiMbkPiYMa1sUpwtSBNw77Ac4
	 ka+sjBU900kKOB6swJZ/0EF6Sua+YrB8wpJLgLYpRmFDgYdhkjh0DCc2nMSvNUsNvE
	 jKniEtq9w8C+rhXyl91cReH+LTYmz41mpWBb4Fu23+t4MFf406gFnXCByL66H399Ci
	 WMfVThZUxG37g==
From: Conor Dooley <conor@kernel.org>
To: claudiu.beznea@tuxon.dev
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] reset: mpfs: add non-auxiliary bus probing
Date: Mon, 13 Oct 2025 18:45:35 +0100
Message-ID: <20251013-crane-utilize-cff9298291a4@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013-album-bovine-faf9f5ebc5d4@spud>
References: <20251013-album-bovine-faf9f5ebc5d4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6170; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=atjxMOlwn8gZYomggzeS9HhyZYxGjL5gzEklClKSlp8=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlvrQ5I7E75yDx359215zusHKcUl5gfXbMxXVNcUdrxt oLMv6/8HaUsDGJcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI5VsMf8Uj3h6/zizrWlL1 wXzuiS8RFknskXt2fm++V6az7vFBFyaGv0JL3F/Z7dn44P0k1c4Z2au6KpkSbRe7tl6RSPMWWbd rDy8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

While the auxiliary bus was a nice bandaid, and meant that re-writing
the representation of the clock regions in devicetree was not required,
it has run its course. The "mss_top_sysreg" region that contains the
clock and reset regions, also contains pinctrl and an interrupt
controller, so the time has come rewrite the devicetree and probe the
reset controller from an mfd devicetree node, rather than implement
those drivers using the auxiliary bus. Wanting to avoid propagating this
naive/incorrect description of the hardware to the new pic64gx SoC is a
major motivating factor here.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v4:
- Only use driver specific lock for non-regmap writes

v2:
- Implement the request to use regmap_update_bits(). I found that I then
  hated the read/write helpers since they were just bloat, so I ripped
  them out. I replaced the regular spin_lock_irqsave() stuff with a
  guard(spinlock_irqsave), since that's a simpler way of handling the two
  different paths through such a trivial pair of functions.
---
 drivers/reset/reset-mpfs.c | 83 ++++++++++++++++++++++++++++++--------
 1 file changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index f6fa10e03ea8..8e5ed4deecf3 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -7,13 +7,16 @@
  *
  */
 #include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/microchip,mpfs-clock.h>
 #include <soc/microchip/mpfs.h>
 
@@ -27,11 +30,14 @@
 #define MPFS_SLEEP_MIN_US	100
 #define MPFS_SLEEP_MAX_US	200
 
+#define REG_SUBBLK_RESET_CR	0x88u
+
 /* block concurrent access to the soft reset register */
 static DEFINE_SPINLOCK(mpfs_reset_lock);
 
 struct mpfs_reset {
 	void __iomem *base;
+	struct regmap *regmap;
 	struct reset_controller_dev rcdev;
 };
 
@@ -46,41 +52,50 @@ static inline struct mpfs_reset *to_mpfs_reset(struct reset_controller_dev *rcde
 static int mpfs_assert(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&mpfs_reset_lock, flags);
+	if (rst->regmap) {
+		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));
+		return 0;
+	}
+
+	guard(spinlock_irqsave)(&mpfs_reset_lock);
 
 	reg = readl(rst->base);
 	reg |= BIT(id);
 	writel(reg, rst->base);
 
-	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
-
 	return 0;
 }
 
 static int mpfs_deassert(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	unsigned long flags;
 	u32 reg;
 
-	spin_lock_irqsave(&mpfs_reset_lock, flags);
+	if (rst->regmap) {
+		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);
+		return 0;
+	}
+
+	guard(spinlock_irqsave)(&mpfs_reset_lock);
 
 	reg = readl(rst->base);
 	reg &= ~BIT(id);
 	writel(reg, rst->base);
 
-	spin_unlock_irqrestore(&mpfs_reset_lock, flags);
-
 	return 0;
 }
 
 static int mpfs_status(struct reset_controller_dev *rcdev, unsigned long id)
 {
 	struct mpfs_reset *rst = to_mpfs_reset(rcdev);
-	u32 reg = readl(rst->base);
+	u32 reg;
+
+	if (rst->regmap)
+		regmap_read(rst->regmap, REG_SUBBLK_RESET_CR, &reg);
+	else
+		reg = readl(rst->base);
 
 	/*
 	 * It is safe to return here as MPFS_NUM_RESETS makes sure the sign bit
@@ -130,11 +145,45 @@ static int mpfs_reset_xlate(struct reset_controller_dev *rcdev,
 	return index - MPFS_PERIPH_OFFSET;
 }
 
-static int mpfs_reset_probe(struct auxiliary_device *adev,
-			    const struct auxiliary_device_id *id)
+static int mpfs_reset_mfd_probe(struct platform_device *pdev)
 {
-	struct device *dev = &adev->dev;
 	struct reset_controller_dev *rcdev;
+	struct device *dev = &pdev->dev;
+	struct mpfs_reset *rst;
+
+	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
+	if (!rst)
+		return -ENOMEM;
+
+	rcdev = &rst->rcdev;
+	rcdev->dev = dev;
+	rcdev->ops = &mpfs_reset_ops;
+
+	rcdev->of_node = pdev->dev.parent->of_node;
+	rcdev->of_reset_n_cells = 1;
+	rcdev->of_xlate = mpfs_reset_xlate;
+	rcdev->nr_resets = MPFS_NUM_RESETS;
+
+	rst->regmap = device_node_to_regmap(pdev->dev.parent->of_node);
+	if (IS_ERR(rst->regmap))
+		dev_err_probe(dev, PTR_ERR(rst->regmap), "Failed to find syscon regmap\n");
+
+	return devm_reset_controller_register(dev, rcdev);
+}
+
+static struct platform_driver mpfs_reset_mfd_driver = {
+	.probe		= mpfs_reset_mfd_probe,
+	.driver = {
+		.name = "mpfs-reset",
+	},
+};
+module_platform_driver(mpfs_reset_mfd_driver);
+
+static int mpfs_reset_adev_probe(struct auxiliary_device *adev,
+				 const struct auxiliary_device_id *id)
+{
+	struct reset_controller_dev *rcdev;
+	struct device *dev = &adev->dev;
 	struct mpfs_reset *rst;
 
 	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
@@ -145,8 +194,8 @@ static int mpfs_reset_probe(struct auxiliary_device *adev,
 
 	rcdev = &rst->rcdev;
 	rcdev->dev = dev;
-	rcdev->dev->parent = dev->parent;
 	rcdev->ops = &mpfs_reset_ops;
+
 	rcdev->of_node = dev->parent->of_node;
 	rcdev->of_reset_n_cells = 1;
 	rcdev->of_xlate = mpfs_reset_xlate;
@@ -176,12 +225,12 @@ static const struct auxiliary_device_id mpfs_reset_ids[] = {
 };
 MODULE_DEVICE_TABLE(auxiliary, mpfs_reset_ids);
 
-static struct auxiliary_driver mpfs_reset_driver = {
-	.probe		= mpfs_reset_probe,
+static struct auxiliary_driver mpfs_reset_aux_driver = {
+	.probe		= mpfs_reset_adev_probe,
 	.id_table	= mpfs_reset_ids,
 };
 
-module_auxiliary_driver(mpfs_reset_driver);
+module_auxiliary_driver(mpfs_reset_aux_driver);
 
 MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
 MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
