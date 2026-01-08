Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B0ED185F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O6vQGyLWfO8WgPWt4j+0OTgxDTTFhYsIFb9JrBolUbc=; b=FUUYNOykSvCDKn
	m8HIueWCFq4kaTTqyeLRNBm1td99yqLCdmFlL23FsGsYrvA93vgVB+qgp8k+IzPNWOi8O/qCAbHuW
	dUauFnPWFxU7DDbDKuIRMgM00f/wgnigCQqWzKW3w+fx/48ltyHyHYtJENUuiyq1a2+AdWzryPDNJ
	BpVojKycWjeQTeVqdaiSkAnj7m9UeFV64HZkFQ8w/eyi7usGEE7F9T3mwBeUOsMsYPnomu5Huu1l4
	0JQz0AxhxawUDvRTOFJA+p9JYE/TsAStE0lV15K4LFdtbwDjxClM2ZI21obbE6e+BIQwZK/EcBVSW
	XVyhj2/o6kC3pJNa0R9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFP-0000000HCMK-3ttt;
	Thu, 08 Jan 2026 13:40:19 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFM-0000000HCKk-0DcD
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:40:17 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 80D01341ECC;
	Thu, 08 Jan 2026 13:40:11 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:23 +0800
Subject: [PATCH v4 2/4] clk: spacemit: extract common ccu functions
MIME-Version: 1.0
Message-Id: <20260108-06-k1-clk-common-v4-2-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=12491; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=wCwVBG8x1ps9/vbKC1hJJG16paIqZcbG0GgngPzz0EQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Oo64ocdLv81GYkzF06vI5skrNtJIhXDyhJY
 xxV1zUKxOSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zqBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3k1w//Tc6HDkuNEWfuqjlHl1NViG03JSLZpMNWLExgiav8SZB4m1WHRdY0j
 XVr6j7gCM/c8bXvpvJABExcdTAIEqIQPhPhVg/EKp6a6nDlVLAt7uPzOC4vHvOoXuSne7HpazQe
 sPTQ8j9eafYNpOAy9GDAeYU8wrtlY4BVTti9AJcTR0xULzZSaokx68hnXOrhDPvyojhTr4Xo6pb
 pOgqXB+u3Ewi790FfiPrVD0tRmanSKehGIX542mEB666ZOnQhES3+9iVWVB3J00hwE2X3GlEWVh
 UndcVgVpnd/JOfw2WKFnbwq0cftk7iV5kUOU9zEVh0uphC5mtn3ixs988tWxOqeTQyZWE8PGX1L
 o48y0ie/ClIQypDqpwNKqk4gqLdSgw0zdILjjkqJMpx7/EyqzZCbksQww+pxTWFHbMuY9nFl3re
 KAight92e8yMZsp58Qa1Ymut9l6khyYJXG4RTVWBSqWccx71s+1opsa/cMYEP5ZdwhDujelGnd2
 AiIgaSqQ9SdSRklarz++1ee0dZwq+Pnu2WIOdGsuDl5oahOYeW5jZh38D1GqJdF3usW6WSYSk7K
 ARyHJfxVvG6h2Kqm0c62AV5mOA3jK+fR0OtykdTyHSA0zBAfeflKSXsq/4Smp4zQ6zgiWjTJycd
 9jV00G/PJU4aYjkmcp4bzJ1507KcAQ=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054016_131146_77703FB4 
X-CRM114-Status: GOOD (  23.91  )
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

Refactor the probe function of SpacemiT's clock, and extract a common ccu
file, so new clock driver added in the future can share the same code,
which would lower the burden of maintenance. Since this commit changes the
module name from spacemit_ccu_k1 to spacemit_ccu where the auxiliary device
registered, the auxiliary device id need to be adjusted. Idea of the patch
comes from the review of K3 clock driver, please refer to this disucssion[1]
for more detail.

This change will introduce a runtime break to reset driver, and will be
fixed in follow-up commit:
("reset: spacemit: fix auxiliary device id")

Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie/ [1]
Suggested-by: Yao Zi <me@ziyao.cc>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c     | 179 ++------------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 +++
 3 files changed, 186 insertions(+), 174 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 01d9485b615d..02c792a73759 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -5,15 +5,10 @@
  */
 
 #include <linux/array_size.h>
-#include <linux/auxiliary_bus.h>
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/idr.h>
-#include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/slab.h>
 #include <soc/spacemit/k1-syscon.h>
 
 #include "ccu_common.h"
@@ -23,14 +18,6 @@
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
 
-struct spacemit_ccu_data {
-	const char *reset_name;
-	struct clk_hw **hws;
-	size_t num;
-};
-
-static DEFINE_IDA(auxiliary_ids);
-
 /* APBS clocks start, APBS region contains and only contains all PLL clocks */
 
 /*
@@ -1001,167 +988,6 @@ static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
 	.reset_name	= "apbc2-reset",
 };
 
-static int spacemit_ccu_register(struct device *dev,
-				 struct regmap *regmap,
-				 struct regmap *lock_regmap,
-				 const struct spacemit_ccu_data *data)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int i, ret;
-
-	/* Nothing to do if the CCU does not implement any clocks */
-	if (!data->hws)
-		return 0;
-
-	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
-				GFP_KERNEL);
-	if (!clk_data)
-		return -ENOMEM;
-
-	clk_data->num = data->num;
-
-	for (i = 0; i < data->num; i++) {
-		struct clk_hw *hw = data->hws[i];
-		struct ccu_common *common;
-		const char *name;
-
-		if (!hw) {
-			clk_data->hws[i] = ERR_PTR(-ENOENT);
-			continue;
-		}
-
-		name = hw->init->name;
-
-		common = hw_to_ccu_common(hw);
-		common->regmap		= regmap;
-		common->lock_regmap	= lock_regmap;
-
-		ret = devm_clk_hw_register(dev, hw);
-		if (ret) {
-			dev_err(dev, "Cannot register clock %d - %s\n",
-				i, name);
-			return ret;
-		}
-
-		clk_data->hws[i] = hw;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
-	if (ret)
-		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
-
-	return ret;
-}
-
-static void spacemit_cadev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	ida_free(&auxiliary_ids, adev->id);
-	kfree(to_spacemit_ccu_adev(adev));
-}
-
-static void spacemit_adev_unregister(void *data)
-{
-	struct auxiliary_device *adev = data;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static int spacemit_ccu_reset_register(struct device *dev,
-				       struct regmap *regmap,
-				       const char *reset_name)
-{
-	struct spacemit_ccu_adev *cadev;
-	struct auxiliary_device *adev;
-	int ret;
-
-	/* Nothing to do if the CCU does not implement a reset controller */
-	if (!reset_name)
-		return 0;
-
-	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
-	if (!cadev)
-		return -ENOMEM;
-
-	cadev->regmap = regmap;
-
-	adev = &cadev->adev;
-	adev->name = reset_name;
-	adev->dev.parent = dev;
-	adev->dev.release = spacemit_cadev_release;
-	adev->dev.of_node = dev->of_node;
-	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
-	if (ret < 0)
-		goto err_free_cadev;
-	adev->id = ret;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		goto err_free_aux_id;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
-
-err_free_aux_id:
-	ida_free(&auxiliary_ids, adev->id);
-err_free_cadev:
-	kfree(cadev);
-
-	return ret;
-}
-
-static int k1_ccu_probe(struct platform_device *pdev)
-{
-	struct regmap *base_regmap, *lock_regmap = NULL;
-	const struct spacemit_ccu_data *data;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	base_regmap = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(base_regmap))
-		return dev_err_probe(dev, PTR_ERR(base_regmap),
-				     "failed to get regmap\n");
-
-	/*
-	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
-	 * are in APBS region. Reference to MPMU syscon is required to check PLL
-	 * status.
-	 */
-	if (of_device_is_compatible(dev->of_node, "spacemit,k1-pll")) {
-		struct device_node *mpmu = of_parse_phandle(dev->of_node,
-							    "spacemit,mpmu", 0);
-		if (!mpmu)
-			return dev_err_probe(dev, -ENODEV,
-					     "Cannot parse MPMU region\n");
-
-		lock_regmap = device_node_to_regmap(mpmu);
-		of_node_put(mpmu);
-
-		if (IS_ERR(lock_regmap))
-			return dev_err_probe(dev, PTR_ERR(lock_regmap),
-					     "failed to get lock regmap\n");
-	}
-
-	data = of_device_get_match_data(dev);
-
-	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register clocks\n");
-
-	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register resets\n");
-
-	return 0;
-}
-
 static const struct of_device_id of_k1_ccu_match[] = {
 	{
 		.compatible	= "spacemit,k1-pll",
@@ -1195,6 +1021,11 @@ static const struct of_device_id of_k1_ccu_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_k1_ccu_match);
 
+static int k1_ccu_probe(struct platform_device *pdev)
+{
+	return spacemit_ccu_probe(pdev, "spacemit,k1-pll");
+}
+
 static struct platform_driver k1_ccu_driver = {
 	.driver = {
 		.name		= "spacemit,k1-ccu",
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 4412c4104dab..5f05b17f8452 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -1,6 +1,177 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/clk-provider.h>
+#include <linux/device/devres.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+#include <soc/spacemit/ccu.h>
+
+#include "ccu_common.h"
+
+static DEFINE_IDA(auxiliary_ids);
+static int spacemit_ccu_register(struct device *dev,
+				 struct regmap *regmap,
+				 struct regmap *lock_regmap,
+				 const struct spacemit_ccu_data *data)
+{
+	struct clk_hw_onecell_data *clk_data;
+	int i, ret;
+
+	/* Nothing to do if the CCU does not implement any clocks */
+	if (!data->hws)
+		return 0;
+
+	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = data->num;
+
+	for (i = 0; i < data->num; i++) {
+		struct clk_hw *hw = data->hws[i];
+		struct ccu_common *common;
+		const char *name;
+
+		if (!hw) {
+			clk_data->hws[i] = ERR_PTR(-ENOENT);
+			continue;
+		}
+
+		name = hw->init->name;
+
+		common = hw_to_ccu_common(hw);
+		common->regmap		= regmap;
+		common->lock_regmap	= lock_regmap;
+
+		ret = devm_clk_hw_register(dev, hw);
+		if (ret) {
+			dev_err(dev, "Cannot register clock %d - %s\n",
+				i, name);
+			return ret;
+		}
+
+		clk_data->hws[i] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		dev_err(dev, "failed to add clock hardware provider (%d)\n", ret);
+
+	return ret;
+}
+
+static void spacemit_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	ida_free(&auxiliary_ids, adev->id);
+	kfree(to_spacemit_ccu_adev(adev));
+}
+
+static void spacemit_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int spacemit_ccu_reset_register(struct device *dev,
+				       struct regmap *regmap,
+				       const char *reset_name)
+{
+	struct spacemit_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	/* Nothing to do if the CCU does not implement a reset controller */
+	if (!reset_name)
+		return 0;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = regmap;
+
+	adev = &cadev->adev;
+	adev->name = reset_name;
+	adev->dev.parent = dev;
+	adev->dev.release = spacemit_cadev_release;
+	adev->dev.of_node = dev->of_node;
+	ret = ida_alloc(&auxiliary_ids, GFP_KERNEL);
+	if (ret < 0)
+		goto err_free_cadev;
+	adev->id = ret;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_aux_id;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, spacemit_adev_unregister, adev);
+
+err_free_aux_id:
+	ida_free(&auxiliary_ids, adev->id);
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
+
+int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
+{
+	struct regmap *base_regmap, *lock_regmap = NULL;
+	const struct spacemit_ccu_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	base_regmap = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(base_regmap))
+		return dev_err_probe(dev, PTR_ERR(base_regmap),
+				     "failed to get regmap\n");
+
+	/*
+	 * The lock status of PLLs locate in MPMU region, while PLLs themselves
+	 * are in APBS region. Reference to MPMU syscon is required to check PLL
+	 * status.
+	 */
+	if (compat && of_device_is_compatible(dev->of_node, compat)) {
+		struct device_node *mpmu = of_parse_phandle(dev->of_node,
+							    "spacemit,mpmu", 0);
+		if (!mpmu)
+			return dev_err_probe(dev, -ENODEV,
+					     "Cannot parse MPMU region\n");
+
+		lock_regmap = device_node_to_regmap(mpmu);
+		of_node_put(mpmu);
+
+		if (IS_ERR(lock_regmap))
+			return dev_err_probe(dev, PTR_ERR(lock_regmap),
+					     "failed to get lock regmap\n");
+	}
+
+	data = of_device_get_match_data(dev);
+
+	ret = spacemit_ccu_register(dev, base_regmap, lock_regmap, data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register clocks\n");
+
+	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_probe, "CLK_SPACEMIT");
 
 MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/spacemit/ccu_common.h b/drivers/clk/spacemit/ccu_common.h
index da72f3836e0b..7ae244b5eace 100644
--- a/drivers/clk/spacemit/ccu_common.h
+++ b/drivers/clk/spacemit/ccu_common.h
@@ -7,6 +7,8 @@
 #ifndef _CCU_COMMON_H_
 #define _CCU_COMMON_H_
 
+#include <linux/clk-provider.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 struct ccu_common {
@@ -36,6 +38,12 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 	return container_of(hw, struct ccu_common, hw);
 }
 
+struct spacemit_ccu_data {
+	const char *reset_name;
+	struct clk_hw **hws;
+	size_t num;
+};
+
 #define ccu_read(c, reg)						\
 	({								\
 		u32 tmp;						\
@@ -45,4 +53,6 @@ static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 #define ccu_update(c, reg, mask, val) \
 	regmap_update_bits((c)->regmap, (c)->reg_##reg, mask, val)
 
+int spacemit_ccu_probe(struct platform_device *pdev, const char *compat);
+
 #endif /* _CCU_COMMON_H_ */

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
