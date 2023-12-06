Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE0EC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 13:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXL2CRJiRKGvGkp7zK3kH36cimiQx9N5y1IWnBr0Nzk=; b=vwO37MNhLgq1rY
	HH4Z73w/KqhFGoZP5hjmF5HljCoxQZxQjDm3gCevN1f2YWgMbG3tqHkOFblEel1/viJhcSA3ndAen
	oZHg6uLJpVx4MEvoPK6p6JogYtIE9qqrIZ+DRPcnFrcxay0A1ZGMxxhgO9HlXYouZqS98ix8ydMny
	F8tJojI+q3aMGRc/ln73+G9bYidt9cQ9APvXCojB7dVBt50DnR2Qym8zyVRl7yIJouhQE6SuLI8Ar
	39VrvIlY2Uw9AvHHK81TZTlYOyPof2eoq578LK20zIlEkvb5NAPXy2n+JuU4KRv8AVlDtI8i6/DH2
	Ry9oAagAW95Hf9va3IBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rArVy-00ALMb-23;
	Wed, 06 Dec 2023 13:00:34 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqQX-00A8RU-3B
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 11:51:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BE33C7FFE;
	Wed,  6 Dec 2023 19:50:29 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 6 Dec
 2023 19:50:29 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 6 Dec 2023 19:50:22 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <conor@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <p.zabel@pengutronix.de>,
	<emil.renner.berthing@canonical.com>, <hal.feng@starfivetech.com>,
	<xingyu.wu@starfivetech.com>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH v1 02/16] reset: starfive: Convert the word "jh71x0" to "starfive"
Date: Wed, 6 Dec 2023 19:49:46 +0800
Message-ID: <20231206115000.295825-3-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [175.136.135.142]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_035054_556397_E9786460 
X-CRM114-Status: GOOD (  15.60  )
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

Function names that consist of the 'jh71x0' naming convention are
renamed to use the 'starfive' wording.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
---
 .../clk/starfive/clk-starfive-jh7110-sys.c    |  4 +-
 .../reset/starfive/reset-starfive-common.c    | 64 +++++++++----------
 .../reset/starfive/reset-starfive-common.h    |  8 +--
 .../reset/starfive/reset-starfive-jh7100.c    |  2 +-
 .../reset/starfive/reset-starfive-jh7110.c    |  4 +-
 include/soc/starfive/reset-starfive-common.h  |  6 +-
 6 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
index 6e45c580c9ba..e63353c70209 100644
--- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
+++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
@@ -345,7 +345,7 @@ static void jh7110_reset_unregister_adev(void *_adev)
 static void jh7110_reset_adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
+	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
 
 	kfree(rdev);
 }
@@ -354,7 +354,7 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
 				     const char *adev_name,
 				     u32 adev_id)
 {
-	struct jh71x0_reset_adev *rdev;
+	struct starfive_reset_adev *rdev;
 	struct auxiliary_device *adev;
 	int ret;
 
diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/reset/starfive/reset-starfive-common.c
index dab454e46bbf..8d8dec9e5d7a 100644
--- a/drivers/reset/starfive/reset-starfive-common.c
+++ b/drivers/reset/starfive/reset-starfive-common.c
@@ -14,7 +14,7 @@
 
 #include "reset-starfive-common.h"
 
-struct jh71x0_reset {
+struct starfive_reset {
 	struct reset_controller_dev rcdev;
 	/* protect registers against concurrent read-modify-write */
 	spinlock_t lock;
@@ -23,16 +23,16 @@ struct jh71x0_reset {
 	const u32 *asserted;
 };
 
-static inline struct jh71x0_reset *
-jh71x0_reset_from(struct reset_controller_dev *rcdev)
+static inline struct starfive_reset *
+starfive_reset_from(struct reset_controller_dev *rcdev)
 {
-	return container_of(rcdev, struct jh71x0_reset, rcdev);
+	return container_of(rcdev, struct starfive_reset, rcdev);
 }
 
-static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
-			       unsigned long id, bool assert)
+static int starfive_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
 {
-	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
 	unsigned long offset = id / 32;
 	u32 mask = BIT(id % 32);
 	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
@@ -61,34 +61,34 @@ static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
 	return ret;
 }
 
-static int jh71x0_reset_assert(struct reset_controller_dev *rcdev,
-			       unsigned long id)
+static int starfive_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
 {
-	return jh71x0_reset_update(rcdev, id, true);
+	return starfive_reset_update(rcdev, id, true);
 }
 
-static int jh71x0_reset_deassert(struct reset_controller_dev *rcdev,
-				 unsigned long id)
+static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
 {
-	return jh71x0_reset_update(rcdev, id, false);
+	return starfive_reset_update(rcdev, id, false);
 }
 
-static int jh71x0_reset_reset(struct reset_controller_dev *rcdev,
-			      unsigned long id)
+static int starfive_reset_reset(struct reset_controller_dev *rcdev,
+				unsigned long id)
 {
 	int ret;
 
-	ret = jh71x0_reset_assert(rcdev, id);
+	ret = starfive_reset_assert(rcdev, id);
 	if (ret)
 		return ret;
 
-	return jh71x0_reset_deassert(rcdev, id);
+	return starfive_reset_deassert(rcdev, id);
 }
 
-static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
-			       unsigned long id)
+static int starfive_reset_status(struct reset_controller_dev *rcdev,
+				 unsigned long id)
 {
-	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
+	struct starfive_reset *data = starfive_reset_from(rcdev);
 	unsigned long offset = id / 32;
 	u32 mask = BIT(id % 32);
 	void __iomem *reg_status = data->status + offset * sizeof(u32);
@@ -97,25 +97,25 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
 	return !((value ^ data->asserted[offset]) & mask);
 }
 
-static const struct reset_control_ops jh71x0_reset_ops = {
-	.assert		= jh71x0_reset_assert,
-	.deassert	= jh71x0_reset_deassert,
-	.reset		= jh71x0_reset_reset,
-	.status		= jh71x0_reset_status,
+static const struct reset_control_ops starfive_reset_ops = {
+	.assert		= starfive_reset_assert,
+	.deassert	= starfive_reset_deassert,
+	.reset		= starfive_reset_reset,
+	.status		= starfive_reset_status,
 };
 
-int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
-				   void __iomem *assert, void __iomem *status,
-				   const u32 *asserted, unsigned int nr_resets,
-				   struct module *owner)
+int reset_starfive_register(struct device *dev, struct device_node *of_node,
+			    void __iomem *assert, void __iomem *status,
+			    const u32 *asserted, unsigned int nr_resets,
+			    struct module *owner)
 {
-	struct jh71x0_reset *data;
+	struct starfive_reset *data;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
-	data->rcdev.ops = &jh71x0_reset_ops;
+	data->rcdev.ops = &starfive_reset_ops;
 	data->rcdev.owner = owner;
 	data->rcdev.nr_resets = nr_resets;
 	data->rcdev.dev = dev;
@@ -128,4 +128,4 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
 
 	return devm_reset_controller_register(dev, &data->rcdev);
 }
-EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
+EXPORT_SYMBOL_GPL(reset_starfive_register);
diff --git a/drivers/reset/starfive/reset-starfive-common.h b/drivers/reset/starfive/reset-starfive-common.h
index 266acc4b2caf..83461b22ee55 100644
--- a/drivers/reset/starfive/reset-starfive-common.h
+++ b/drivers/reset/starfive/reset-starfive-common.h
@@ -6,9 +6,9 @@
 #ifndef __RESET_STARFIVE_COMMON_H
 #define __RESET_STARFIVE_COMMON_H
 
-int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
-				   void __iomem *assert, void __iomem *status,
-				   const u32 *asserted, unsigned int nr_resets,
-				   struct module *owner);
+int reset_starfive_register(struct device *dev, struct device_node *of_node,
+			    void __iomem *assert, void __iomem *status,
+			    const u32 *asserted, unsigned int nr_resets,
+			    struct module *owner);
 
 #endif /* __RESET_STARFIVE_COMMON_H */
diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
index 546dea2e5811..122ac6c3893b 100644
--- a/drivers/reset/starfive/reset-starfive-jh7100.c
+++ b/drivers/reset/starfive/reset-starfive-jh7100.c
@@ -51,7 +51,7 @@ static int __init jh7100_reset_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	return reset_starfive_jh71x0_register(&pdev->dev, pdev->dev.of_node,
+	return reset_starfive_register(&pdev->dev, pdev->dev.of_node,
 					      base + JH7100_RESET_ASSERT0,
 					      base + JH7100_RESET_STATUS0,
 					      jh7100_reset_asserted,
diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
index 87dba01491ae..c4dd21761e53 100644
--- a/drivers/reset/starfive/reset-starfive-jh7110.c
+++ b/drivers/reset/starfive/reset-starfive-jh7110.c
@@ -53,13 +53,13 @@ static int jh7110_reset_probe(struct auxiliary_device *adev,
 			      const struct auxiliary_device_id *id)
 {
 	struct jh7110_reset_info *info = (struct jh7110_reset_info *)(id->driver_data);
-	struct jh71x0_reset_adev *rdev = to_jh71x0_reset_adev(adev);
+	struct starfive_reset_adev *rdev = to_starfive_reset_adev(adev);
 	void __iomem *base = rdev->base;
 
 	if (!info || !base)
 		return -ENODEV;
 
-	return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
+	return reset_starfive_register(&adev->dev, adev->dev.parent->of_node,
 					      base + info->assert_offset,
 					      base + info->status_offset,
 					      NULL,
diff --git a/include/soc/starfive/reset-starfive-common.h b/include/soc/starfive/reset-starfive-common.h
index 56d8f413cf18..16df46a074bc 100644
--- a/include/soc/starfive/reset-starfive-common.h
+++ b/include/soc/starfive/reset-starfive-common.h
@@ -6,12 +6,12 @@
 #include <linux/compiler_types.h>
 #include <linux/container_of.h>
 
-struct jh71x0_reset_adev {
+struct starfive_reset_adev {
 	void __iomem *base;
 	struct auxiliary_device adev;
 };
 
-#define to_jh71x0_reset_adev(_adev) \
-	container_of((_adev), struct jh71x0_reset_adev, adev)
+#define to_starfive_reset_adev(_adev) \
+	container_of((_adev), struct starfive_reset_adev, adev)
 
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
