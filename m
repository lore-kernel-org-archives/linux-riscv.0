Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419B9D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wSm3KjtchFW6qBpam1mr1TjYXoWxSzVe76f3qi2Lb9E=; b=fO2yl4xYvRufDY
	0+onMNGbsE8pQLfYR/XuZeYirxP3yy0byPijAePgVDUtGkQ/id3Df9lSKdOnYC1Ux0+LYq7UVgSxi
	mjS835Nw3La44nIV6B19vgN8AdtgMklvJz73twFK+ExYOpv177r9oO1XHNLWY5NBuiyxix5QiCr68
	gbU/s+MjiUwhX+bM6i6EAJC93m1MROzkYXePNVYT99BnyCzdDxVx2cpANrkHq5d8oE60n4PGSgHhU
	b4DyAgUmEZCO/35m8o8h4F8SLsLLcAU07AFj5mAjzdamg4TNQENEJWuG/BZGYxj7C4UlRRm0Ajr+L
	OaJSIzbhkHzfnd8Phn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9e9-00000003gA4-0TAH;
	Tue, 20 Jan 2026 11:11:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9dt-00000003g73-1KfC
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 11:11:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-81ef4b87291so2616188b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 03:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768907484; x=1769512284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uez6X+iymQJpeDjdab9LEMJvp0cchNgB+RDT9Qm0CoM=;
        b=cYeTacfeLyNA7ar2xq15ApNRvNfNd6t6nvLBLd+FvmGeUunLxANRKEntRsaySNItpv
         uwUVNZZ8cSjqa10jA0TvlqlAJZkDq8Z1zJ0eaFYAx4mWFds0DG4pK+nfm8z95fFJTu//
         JCksL6EiOK5XwdF/eQacZ6S5/NghAeWQSaTqGKVRpdSXrrG6VimyppIWjt1k3RuBUt49
         7BDa3BMMF2kJ7gMBWyFSvwVntJpf9ilS8xe8pExI4F3yBgy0zuBNlXUlUqPhQfi7lQ60
         b0h682a6regzPDuAkl8g58IYu0VZgESGmTfa2WPgYv8HKPP6RKqovadKWgv/DMhlG0dG
         28Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907484; x=1769512284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uez6X+iymQJpeDjdab9LEMJvp0cchNgB+RDT9Qm0CoM=;
        b=a6jkJIxa0P3rgkgZo8/dT+sszguL7PvE1ADjHL2Wy9nmVDFawj5vwtEIpi2/vlrjZi
         454NjGtWsn199UiNVJ8LUvDzVoD5URMGqfvUUQq00tc0W1AkZDijWsEnrsYeX/nPRvG5
         ILAsKNC39/ZIDe+rcBFXV3FaFRojQeaXM8Ej5b0hyyIF/wO9x9PggUazHMEr1gWD95rm
         r78ECb7YIEsNnLQeVgFhM9gYSMhIjfkoZH0rstTxcR6cOxO67yJZGeGDk3Cq1QwG2I5D
         Z0/1eqT5pHKtPXPHWkk0uiVCm8J8bS73s0XgzC6AUPOZHRfsyTDEh9oNMdvyRD+xUc+o
         Xv9g==
X-Forwarded-Encrypted: i=1; AJvYcCVRlTpitmdTYRK0kwLfu4kyLI/DjnE9mqHoQHqqbrbBOBImduwJ8UrAP/+RsjqYWJwFeUhbDm9UQiZ30A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw22uPQBd6fm3/FMUB61uSkDhc3+PoJ91GI0osExvZYaTdYRAJc
	Q6MAMSPv/dv9SXl3zck0jMgGzYKS7oKr2Fm3OW2MD6yeYhkdM8pUUOL8Wt/Fcy7Fg9M=
X-Gm-Gg: AZuq6aLgu87FnKAqfX6CZOLhYj2RbzUtrzJwbZzM0ZQFyrBiUXAIcCrQwIX0NybTLnD
	KVxkRsTSUWA/Lm8FZ5pJFYBKmgOZKz1ztS6ObNiwZAugip8Gmelkk95UkuAxRclT8QEjOaxHpjd
	bDQXktMQ1qcSZmeZnRaIiD2m/WUgLE1CCLwbQ0ymjZYM+pweO8uym5Yc+LCn1C0r6aSvR5BmZr4
	rrziXQTxiIpk6rgZd3sMWI4tRBi+uRj6a5UT9fyiOWTdJDX915FgrgGcShwmaKCvwcrPvkVn3tr
	y/81EnjvO0Y2eerx1rJRC416S3JdBsdkKDvY1MyurMhQH7WRNLwozt+GXVUvcKGt2GxkVQPE9Ud
	0h2Uvg1HbctCvZbFJIIdaGZP40+nsnq0KOvW2Z7dCo5IGHBfJBW4nB4nzA/szbBI0Mx6L6yvM3O
	xg+e2zWUFBm5XgQMMxFb6sWfuvZUi4uBxlE0mPRFVoEg==
X-Received: by 2002:a05:6a00:a89:b0:81f:50b1:51ec with SMTP id d2e1a72fcca58-81f9f7e64e9mr12973971b3a.4.1768907484141;
        Tue, 20 Jan 2026 03:11:24 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4015])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa10efc6bsm11398349b3a.29.2026.01.20.03.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 03:11:23 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 20 Jan 2026 19:10:51 +0800
Subject: [PATCH v3 3/4] reset: spacemit: Extract common K1 reset code
MIME-Version: 1.0
Message-Id: <20260120-k3-reset-v3-3-effe87f4bdbe@riscstar.com>
References: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
In-Reply-To: <20260120-k3-reset-v3-0-effe87f4bdbe@riscstar.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Haylen Chu <heylenay@4d2.org>
Cc: Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_031138_451988_D477E3AB 
X-CRM114-Status: GOOD (  21.60  )
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

Extract the common reset controller code from the K1 driver into
separate reset-spacemit-common.{c,h} files to prepare for additional
SpacemiT SoCs that share the same reset controller architecture.

The common code includes handlers for reset assert and deassert
operations and probing for auxiliary bus devices.

Changes during extraction:
- Module ownership: Use dev->driver->owner instead of THIS_MODULE in
  spacemit_reset_controller_register() to correctly reference the
  calling driver's module.
- Rename spacemit_reset_ids to spacemit_k1_reset_ids.
- Define new namespace "RESET_SPACEMIT" for the exported common
  functions (spacemit_reset_probe) and update K1 driver to import it.

This prepares for additional SpacemiT SoCs (K3) that share the same reset
controller architecture.

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3: Add reviewed-by from Alex.
v2: Use dev->driver->owner for the reset controller owner instead of
    THIS_MODULE to fix the module reference counting issue pointed out
    by Krzysztof Kozlowski.
---
 drivers/reset/spacemit/Kconfig                 |  17 +++-
 drivers/reset/spacemit/Makefile                |   2 +
 drivers/reset/spacemit/reset-spacemit-common.c |  77 ++++++++++++++++++
 drivers/reset/spacemit/reset-spacemit-common.h |  42 ++++++++++
 drivers/reset/spacemit/reset-spacemit-k1.c     | 107 +++----------------------
 5 files changed, 144 insertions(+), 101 deletions(-)

diff --git a/drivers/reset/spacemit/Kconfig b/drivers/reset/spacemit/Kconfig
index 552884e8b72a..56a4858b30e1 100644
--- a/drivers/reset/spacemit/Kconfig
+++ b/drivers/reset/spacemit/Kconfig
@@ -1,10 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config RESET_SPACEMIT_K1
-	tristate "SpacemiT K1 reset driver"
+menu "Reset support for SpacemiT platforms"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
-	depends on SPACEMIT_K1_CCU
+
+config RESET_SPACEMIT_COMMON
+	tristate
 	select AUXILIARY_BUS
+	help
+	  Common reset controller infrastructure for SpacemiT SoCs.
+	  This provides shared code and helper functions used by
+	  reset drivers for various SpacemiT SoC families.
+
+config RESET_SPACEMIT_K1
+	tristate "Support for SpacemiT K1 SoC"
+	depends on SPACEMIT_K1_CCU
+	select RESET_SPACEMIT_COMMON
 	default SPACEMIT_K1_CCU
 	help
 	  Support for reset controller in SpacemiT K1 SoC.
@@ -12,3 +22,4 @@ config RESET_SPACEMIT_K1
 	  unit (CCU) driver to provide reset control functionality
 	  for various peripherals and subsystems in the SoC.
 
+endmenu
diff --git a/drivers/reset/spacemit/Makefile b/drivers/reset/spacemit/Makefile
index 34e3350136bb..0b056e8661ec 100644
--- a/drivers/reset/spacemit/Makefile
+++ b/drivers/reset/spacemit/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_RESET_SPACEMIT_COMMON)	+= reset-spacemit-common.o
+
 obj-$(CONFIG_RESET_SPACEMIT_K1)		+= reset-spacemit-k1.o
diff --git a/drivers/reset/spacemit/reset-spacemit-common.c b/drivers/reset/spacemit/reset-spacemit-common.c
new file mode 100644
index 000000000000..0626633a5e7d
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/* SpacemiT reset controller driver - common implementation */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/module.h>
+
+#include <soc/spacemit/ccu.h>
+
+#include "reset-spacemit-common.h"
+
+static int spacemit_reset_update(struct reset_controller_dev *rcdev,
+				 unsigned long id, bool assert)
+{
+	struct ccu_reset_controller *controller;
+	const struct ccu_reset_data *data;
+	u32 mask;
+	u32 val;
+
+	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
+	data = &controller->data->reset_data[id];
+	mask = data->assert_mask | data->deassert_mask;
+	val = assert ? data->assert_mask : data->deassert_mask;
+
+	return regmap_update_bits(controller->regmap, data->offset, mask, val);
+}
+
+static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, true);
+}
+
+static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
+				   unsigned long id)
+{
+	return spacemit_reset_update(rcdev, id, false);
+}
+
+static const struct reset_control_ops spacemit_reset_control_ops = {
+	.assert		= spacemit_reset_assert,
+	.deassert	= spacemit_reset_deassert,
+};
+
+static int spacemit_reset_controller_register(struct device *dev,
+					      struct ccu_reset_controller *controller)
+{
+	struct reset_controller_dev *rcdev = &controller->rcdev;
+
+	rcdev->ops = &spacemit_reset_control_ops;
+	rcdev->owner = dev->driver->owner;
+	rcdev->of_node = dev->of_node;
+	rcdev->nr_resets = controller->data->count;
+
+	return devm_reset_controller_register(dev, &controller->rcdev);
+}
+
+int spacemit_reset_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id)
+{
+	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
+	struct ccu_reset_controller *controller;
+	struct device *dev = &adev->dev;
+
+	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
+	if (!controller)
+		return -ENOMEM;
+	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
+	controller->regmap = rdev->regmap;
+
+	return spacemit_reset_controller_register(dev, controller);
+}
+EXPORT_SYMBOL_NS_GPL(spacemit_reset_probe, "RESET_SPACEMIT");
+
+MODULE_DESCRIPTION("SpacemiT reset controller driver - common code");
+MODULE_LICENSE("GPL");
diff --git a/drivers/reset/spacemit/reset-spacemit-common.h b/drivers/reset/spacemit/reset-spacemit-common.h
new file mode 100644
index 000000000000..ffaf2f86eb39
--- /dev/null
+++ b/drivers/reset/spacemit/reset-spacemit-common.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SpacemiT reset controller driver - common definitions
+ */
+
+#ifndef _RESET_SPACEMIT_COMMON_H_
+#define _RESET_SPACEMIT_COMMON_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/types.h>
+
+struct ccu_reset_data {
+	u32 offset;
+	u32 assert_mask;
+	u32 deassert_mask;
+};
+
+struct ccu_reset_controller_data {
+	const struct ccu_reset_data *reset_data;	/* array */
+	size_t count;
+};
+
+struct ccu_reset_controller {
+	struct reset_controller_dev rcdev;
+	const struct ccu_reset_controller_data *data;
+	struct regmap *regmap;
+};
+
+#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
+	{							\
+		.offset		= (_offset),			\
+		.assert_mask	= (_assert_mask),		\
+		.deassert_mask	= (_deassert_mask),		\
+	}
+
+/* Common probe function */
+int spacemit_reset_probe(struct auxiliary_device *adev,
+			 const struct auxiliary_device_id *id);
+
+#endif /* _RESET_SPACEMIT_COMMON_H_ */
diff --git a/drivers/reset/spacemit/reset-spacemit-k1.c b/drivers/reset/spacemit/reset-spacemit-k1.c
index cc7fd1f8750d..8f3b5329ea5f 100644
--- a/drivers/reset/spacemit/reset-spacemit-k1.c
+++ b/drivers/reset/spacemit/reset-spacemit-k1.c
@@ -1,41 +1,13 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* SpacemiT reset controller driver */
+/* SpacemiT K1 reset controller driver */
 
-#include <linux/auxiliary_bus.h>
-#include <linux/container_of.h>
-#include <linux/device.h>
 #include <linux/module.h>
-#include <linux/regmap.h>
-#include <linux/reset-controller.h>
-#include <linux/types.h>
 
-#include <soc/spacemit/k1-syscon.h>
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <soc/spacemit/k1-syscon.h>
 
-struct ccu_reset_data {
-	u32 offset;
-	u32 assert_mask;
-	u32 deassert_mask;
-};
-
-struct ccu_reset_controller_data {
-	const struct ccu_reset_data *reset_data;	/* array */
-	size_t count;
-};
-
-struct ccu_reset_controller {
-	struct reset_controller_dev rcdev;
-	const struct ccu_reset_controller_data *data;
-	struct regmap *regmap;
-};
-
-#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
-	{							\
-		.offset		= (_offset),			\
-		.assert_mask	= (_assert_mask),		\
-		.deassert_mask	= (_deassert_mask),		\
-	}
+#include "reset-spacemit-common.h"
 
 static const struct ccu_reset_data k1_mpmu_resets[] = {
 	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
@@ -214,91 +186,30 @@ static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
 	.count		= ARRAY_SIZE(k1_apbc2_resets),
 };
 
-static int spacemit_reset_update(struct reset_controller_dev *rcdev,
-				 unsigned long id, bool assert)
-{
-	struct ccu_reset_controller *controller;
-	const struct ccu_reset_data *data;
-	u32 mask;
-	u32 val;
-
-	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
-	data = &controller->data->reset_data[id];
-	mask = data->assert_mask | data->deassert_mask;
-	val = assert ? data->assert_mask : data->deassert_mask;
-
-	return regmap_update_bits(controller->regmap, data->offset, mask, val);
-}
-
-static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
-				 unsigned long id)
-{
-	return spacemit_reset_update(rcdev, id, true);
-}
-
-static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
-				   unsigned long id)
-{
-	return spacemit_reset_update(rcdev, id, false);
-}
-
-static const struct reset_control_ops spacemit_reset_control_ops = {
-	.assert		= spacemit_reset_assert,
-	.deassert	= spacemit_reset_deassert,
-};
-
-static int spacemit_reset_controller_register(struct device *dev,
-					      struct ccu_reset_controller *controller)
-{
-	struct reset_controller_dev *rcdev = &controller->rcdev;
-
-	rcdev->ops = &spacemit_reset_control_ops;
-	rcdev->owner = THIS_MODULE;
-	rcdev->of_node = dev->of_node;
-	rcdev->nr_resets = controller->data->count;
-
-	return devm_reset_controller_register(dev, &controller->rcdev);
-}
-
-static int spacemit_reset_probe(struct auxiliary_device *adev,
-				const struct auxiliary_device_id *id)
-{
-	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
-	struct ccu_reset_controller *controller;
-	struct device *dev = &adev->dev;
-
-	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
-	if (!controller)
-		return -ENOMEM;
-	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
-	controller->regmap = rdev->regmap;
-
-	return spacemit_reset_controller_register(dev, controller);
-}
-
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
 		.name = "spacemit_ccu.k1-" #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 
-static const struct auxiliary_device_id spacemit_reset_ids[] = {
+static const struct auxiliary_device_id spacemit_k1_reset_ids[] = {
 	K1_AUX_DEV_ID(mpmu),
 	K1_AUX_DEV_ID(apbc),
 	K1_AUX_DEV_ID(apmu),
 	K1_AUX_DEV_ID(rcpu),
 	K1_AUX_DEV_ID(rcpu2),
 	K1_AUX_DEV_ID(apbc2),
-	{ },
+	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
+MODULE_DEVICE_TABLE(auxiliary, spacemit_k1_reset_ids);
 
 static struct auxiliary_driver spacemit_k1_reset_driver = {
 	.probe          = spacemit_reset_probe,
-	.id_table       = spacemit_reset_ids,
+	.id_table       = spacemit_k1_reset_ids,
 };
 module_auxiliary_driver(spacemit_k1_reset_driver);
 
+MODULE_IMPORT_NS("RESET_SPACEMIT");
 MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
-MODULE_DESCRIPTION("SpacemiT reset controller driver");
+MODULE_DESCRIPTION("SpacemiT K1 reset controller driver");
 MODULE_LICENSE("GPL");

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
