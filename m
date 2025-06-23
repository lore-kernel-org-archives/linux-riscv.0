Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81391C7EE32
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 16:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhyC9Y/1oJw0tjEG98X8ybfuUkJK3VwuvxtmpXAYNuk=; b=SnrZnhSIl04WfW
	3zwoiZbFcuPcUXRd9MVT4hjEM1wG6a8JKrdSqBrmOYKIh9esJeSU5QRH5zx4bKOZGTNcCZuV5L++X
	giitkQejrExE+XILGAwmPC0sAZuhIk+L6jCESKSHSEUbGUAE8OSqokQCK0ZVItawS+vQB77rAZv20
	rCc60vWvHrXpH8Hqv8+jl0bj6xKqeMr4rqkirrCTpNoeFnpL86P6wHMlvFXraPmQL3SpDudW5pLtC
	6cn6jyG1bhDVJERF5RON11LIUOUUJ7KWH2Fn/SmcJgBS6fve+wouyJODzmI+NSA2VUN3+896hNdTJ
	NrPBm3GOZyOax3DQOUMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTk3w-00000003QWj-0NrA;
	Mon, 23 Jun 2025 16:30:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTgjR-00000002nAB-2yBq
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 12:57:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7716A51B04;
	Mon, 23 Jun 2025 12:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5008DC4CEF3;
	Mon, 23 Jun 2025 12:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750683424;
	bh=OBN546Xw/XSBw1gh+gDHqku7W/MmXiHf4o1JKHEMJYY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UPgE1kp6j+P7lyqJv8VobwOmGm7NFUPUKXeUTYG/cgSM4b24dUpuw8GZUG0gppLKK
	 yM1QqMa7jMGLXOvHe/qqCWqbpPmI5t2FMBY0H9Fy2IKsu/yo47eDHkD0VTd0fgAdBn
	 TPLk2UojF0mrQPcQM/TJjC89qnw/nNTmE1qp9Cgc7OQAXfJOzItHgpEOh3PwZAITX8
	 BZskbY0gKuOEa7k8pEwSiWQX5klQUcyBBDiMUd/9mNRxlW+W38St9h+wQneh9VyYPu
	 /sWHPSIgHk0etVYLiu+XwQ8VBUQfKCnHEqQYVtESe34wD23DdpwOgkqEYS1vYh4kli
	 d6rgmfW0nQGag==
From: Conor Dooley <conor@kernel.org>
To: sboyd@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/9] reset: mpfs: add non-auxiliary bus probing
Date: Mon, 23 Jun 2025 13:56:18 +0100
Message-ID: <20250623-equate-ogle-0ce3293567e2@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250623-levitate-nugget-08c9a01f401d@spud>
References: <20250623-levitate-nugget-08c9a01f401d@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6071; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LdtKOZ18m1Z5XTBQK39rScuREwN0yhaKcaTMme0dp2Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmRfu8LLcs+9eZxOEiFV3+3ft+iwtWUJc4z7Uf/k9PR9 qvWH9jZUcLCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIloP2Bk2KmQKN0WK32vbGrb /GtsHQuONq7vvz+BZ8edeRLzf3Lb72b4pmvI8eXlbpvm/OwsoTmeCyeYnhJYcdqa41jT+YIwpe+ MAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_055705_880603_8F5E7E61 
X-CRM114-Status: GOOD (  21.43  )
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
v2:
Implement the request to use regmap_update_bits(). I found that I then
hated the read/write helpers since they were just bloat, so I ripped
them out. I replaced the regular spin_lock_irqsave() stuff with a
guard(spinlock_irqsave), since that's a simpler way of handling the two
different paths through such a trivial pair of functions.
---
 drivers/reset/reset-mpfs.c | 81 ++++++++++++++++++++++++++++++--------
 1 file changed, 65 insertions(+), 16 deletions(-)

diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 574e59db83a4f..9c3e996f3a099 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -7,12 +7,15 @@
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
 #include <linux/slab.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
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
+	guard(spinlock_irqsave)(&mpfs_reset_lock);
+
+	if (rst->regmap) {
+		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), BIT(id));
+		return 0;
+	}
 
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
+	guard(spinlock_irqsave)(&mpfs_reset_lock);
+
+	if (rst->regmap) {
+		regmap_update_bits(rst->regmap, REG_SUBBLK_RESET_CR, BIT(id), 0);
+		return 0;
+	}
 
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
@@ -222,12 +271,12 @@ static const struct auxiliary_device_id mpfs_reset_ids[] = {
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
